import logging
import csv
from datetime import datetime
from twisted.internet.defer import inlineCallbacks
from twisted.internet.error import DNSLookupError
from twisted.internet.error import TimeoutError as TOError, TCPTimedOutError
from scrapy.spidermiddlewares.httperror import HttpError
from scrapy import Spider, Request, signals
from scrapy.exceptions import DropItem
import treq
from cgdb_bot.settings import (WIKIPEDIA_ARTICLE_URL_FORMAT,
                            API_SERVER_HOST, API_SERVER_PORT,
                            CRAWL_ARG_DELIMITER, DATA_DIR)
from cgdb_bot.parsers import parse_wikipedia_game_article
from cgdb_bot.items import WikipediaGameItem


def general_resp_error_handler(failure):
    """
    Scrapy Request general error handler
    """
    # in case you want to do something special for some errors,
    # you may need the failure's type:
    logger = logging.getLogger(__name__)

    if failure.check(HttpError):
        # these exceptions come from HttpError spider middleware
        # you can get the non-200 response
        response = failure.value.response
        logger.error('ScrapyRequestError, HttpError: %s - %s - %s',
                    response.url,
                    failure.getErrorMessage(),
                    response.text)
    elif failure.check(DNSLookupError):
        # this is the original request
        request = failure.request
        logger.error('ScrapyRequestError, DNSLookupError: %s - %s',
                    request.cb_kwargs['main_url'],
                    failure.getErrorMessage())
    elif failure.check(TOError, TCPTimedOutError):
        request = failure.request
        logger.error('ScrapyRequestError, TimeoutError, TCPTimedOutError: %s - %s',
                    request.cb_kwargs['main_url'],
                    failure.getErrorMessage())
    else:
        request = failure.request
        logger.error('ScrapyRequestError: %s - %s',
                    request.cb_kwargs['main_url'],
                    failure.getErrorMessage())


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
        self._titles = kw['titles'].split(CRAWL_ARG_DELIMITER) if 'titles' in kw else []
        self._urls = kw['urls'].split(CRAWL_ARG_DELIMITER) if 'urls' in kw else []
        self._platform = kw['platform'] if 'platform' in kw else None

    def start_requests(self):
        for title in self._titles:
            yield Request(
                    WIKIPEDIA_ARTICLE_URL_FORMAT.format(underscored_title=title.strip().replace(' ', '_')),
                    callback=parse_wikipedia_game_article,
                    errback=self.resp_error_handler)
        for url in self._urls:
            yield Request(
                    url,
                    callback=parse_wikipedia_game_article,
                    errback=self.resp_error_handler)

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
        dropped_items_file = f'{DATA_DIR}/dropped_items/{datetime.now().strftime("%Y%m%d%H%M%S")}.csv'
        spider._dropped_items_file = open(dropped_items_file, 'a')

    def spider_closed(self, spider, reason):
        spider._dropped_items_file.close()

    def _record_dropped_items(self, url, exception):
        dropped_item_writer = csv.writer(self._dropped_items_file,
                            delimiter='|',
                            quotechar='"',
                            quoting=csv.QUOTE_MINIMAL)
        dropped_item_writer.writerow([url, self._platform, str(exception)])

    def item_dropped(self, item, response, exception, spider):
        """
        Record dropped items/links
        """
        self._record_dropped_items(response.url, exception)

    def resp_error_handler(self, failure):
        """
        Scrapy Request general error handler
        """
        # in case you want to do something special for some errors,
        # you may need the failure's type:

        if failure.check(HttpError):
            # these exceptions come from HttpError spider middleware
            # you can get the non-200 response
            response = failure.value.response
            self.logger.error('ScrapyRequestError, HttpError: %s - %s - %s',
                        response.url,
                        failure.getErrorMessage(),
                        response.text)
            self._record_dropped_items(response.url, failure.getErrorMessage())
        elif failure.check(DNSLookupError):
            # this is the original request
            request = failure.request
            self.logger.error('ScrapyRequestError, DNSLookupError: %s - %s',
                        request.cb_kwargs['main_url'],
                        failure.getErrorMessage())
            self._record_dropped_items(request.cb_kwargs['main_url'],
                                    failure.getErrorMessage())
        elif failure.check(TOError, TCPTimedOutError):
            request = failure.request
            self.logger.error('ScrapyRequestError, TimeoutError, TCPTimedOutError: %s - %s',
                        request.cb_kwargs['main_url'],
                        failure.getErrorMessage())
            self._record_dropped_items(request.cb_kwargs['main_url'],
                                    failure.getErrorMessage())
        else:
            request = failure.request
            self.logger.error('ScrapyRequestError: %s - %s',
                        request.cb_kwargs['main_url'],
                        failure.getErrorMessage())
            self._record_dropped_items(request.cb_kwargs['main_url'],
                                    failure.getErrorMessage())
