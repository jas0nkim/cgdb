import json
from datetime import datetime
from urllib.parse import quote_plus
from requests.models import stream_decode_response_unicode
from twisted.internet.defer import inlineCallbacks
import treq
from scrapy import Spider, Request, signals
from scrapy.exceptions import DropItem
from cgdb_bot.settings import (WIKIPEDIA_ARTICLE_URL_FORMAT,
                            API_SERVER_HOST, API_SERVER_PORT, SRC_DIR)
from cgdb_bot.parsers import parse_wikipedia_game_article, resp_error_handler
from cgdb_bot.items import WikipediaGameItem

class WikipediaGameSpider(Spider):
    """
    crawl wikipedia game pages (multi-language)
    """
    name = 'WikipediaGameSpider'
    allowed_domains = ('wikipedia.org',)

    _titles = []
    _urls = []
    _platform = None

    _dropped_items_file = None

    def __init__(self, *a, **kw):
        super().__init__(*a, **kw)
        self._titles = kw['titles'].split('||') if 'titles' in kw else []
        self._urls = kw['urls'].split('||') if 'urls' in kw else []
        self._platform = kw['platform'] if 'platform' in kw else None

    def start_requests(self):
        for title in self._titles:
            yield Request(
                    WIKIPEDIA_ARTICLE_URL_FORMAT.format(underscored_title=title.strip().replace(' ', '_')),
                    callback=parse_wikipedia_game_article,
                    errback=resp_error_handler)
        for url in self._urls:
            yield Request(
                    url,
                    callback=parse_wikipedia_game_article,
                    errback=resp_error_handler)

    def parse(self, response, **kwargs):
        pass

    @classmethod
    def from_crawler(cls, crawler, *args, **kwargs):
        spider = super().from_crawler(crawler, *args, **kwargs)
        crawler.signals.connect(spider.item_scraped, signal=signals.item_scraped)
        crawler.signals.connect(spider.item_dropped, signal=signals.item_dropped)
        crawler.signals.connect(spider.spider_opened, signal=signals.spider_opened)
        crawler.signals.connect(spider.spider_closed, signal=signals.spider_closed)
        return spider

    def item_scraped(self, item, response, spider):
        """
        Send the scraped item to the API server
        """
        if not isinstance(item, WikipediaGameItem):
            raise DropItem("Invalid item passed to item_scraped (Scrapy Signal)")

        _logger = self.logger
        @inlineCallbacks
        def _cb(resp):
            content = yield resp.content()
            if resp.code >= 400:
                _logger.error("API post request error [HTTP:%d] %s %s",
                            resp.code, resp.request.absoluteURI, content)

        d = treq.post(f'{API_SERVER_HOST}:{API_SERVER_PORT}/api/bot/game/',
                    item.asjson().encode('ascii'),
                    headers={b'Content-Type': [b'application/json']})
        d.addCallback(_cb)
        # The next item will be scraped only after
        # deferred (d) is fired
        return d

    def spider_opened(self, spider):
        dropped_items_file = f'{SRC_DIR}/.data/dropped_items/{datetime.now().strftime("%Y%m%d%H%M%S")}.csv'
        spider._dropped_items_file = open(dropped_items_file, 'a')

    def spider_closed(self, spider, reason):
        spider._dropped_items_file.close()

    def item_dropped(self, item, response, exception, spider):
        """
        Record dropped items/links
        """
        spider._dropped_items_file.write(f'{response.url}|{spider._platform}|{str(exception)}\n')