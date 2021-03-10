from scrapy import Request, signals
from cgdb_bot.settings import (CRAWL_ARG_DELIMITER,
                            WIKIPEDIA_STADIA_GAMES_URL)
from cgdb_bot.parsers import (parse_wikipedia_game_article,
                            parse_wikipedia_stadia_games,)
from cgdb_bot.utils import to_bool, get_wikipedia_article_url
from . import BaseCgdbSpider

class BaseWikipediaGameSpider(BaseCgdbSpider):
    allowed_domains = ('wikipedia.org',)

    @classmethod
    def from_crawler(cls, crawler, *args, **kwargs):
        spider = super().from_crawler(crawler, *args, **kwargs)
        crawler.signals.connect(spider.item_scraped,
                                signal=signals.item_scraped)
        crawler.signals.connect(spider.item_dropped,
                                signal=signals.item_dropped)
        crawler.signals.connect(spider.spider_opened,
                                signal=signals.spider_opened)
        crawler.signals.connect(spider.spider_closed,
                                signal=signals.spider_closed)
        return spider


class WikipediaGameSpider(BaseWikipediaGameSpider):
    """
    crawl wikipedia game pages (multi-language)
    """
    name = 'WikipediaGameSpider'

    def __init__(self, *a, **kw):
        super().__init__(*a, **kw)
        self._titles = kw['titles'].split(CRAWL_ARG_DELIMITER) if 'titles' in kw else []
        self._urls = kw['urls'].split(CRAWL_ARG_DELIMITER) if 'urls' in kw else []
        self._platform = kw['platform'] if 'platform' in kw else None
        self._postdata = to_bool(kw['postdata']) if 'postdata' in kw else False

    def start_requests(self):
        for title in self._titles:
            yield Request(
                    get_wikipedia_article_url(title),
                    callback=parse_wikipedia_game_article,
                    errback=self.resp_error_handler)
        for url in self._urls:
            yield Request(
                    url,
                    callback=parse_wikipedia_game_article,
                    errback=self.resp_error_handler)


class WikipediaStadiaSpider(BaseWikipediaGameSpider):
    """
    Crawl List of Stadia games wikipedia page, and crawl related game title wikipedia links
    """

    name = 'WikipediaStadiaSpider'

    _platform = 'Stadia'

    def __init__(self, *a, **kw):
        super().__init__(*a, **kw)
        self._postdata = to_bool(kw['postdata']) if 'postdata' in kw else False

    def start_requests(self):
        yield Request(
            WIKIPEDIA_STADIA_GAMES_URL,
            callback=parse_wikipedia_stadia_games,
            errback=self.resp_error_handler)
