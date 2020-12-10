from urllib.parse import quote_plus
from scrapy import Spider, Request
from cgdb_bot.common import WIKIPEDIA_SEARCH_LINK_FORMAT
from cgdb_bot.parsers import parse_wikipedia_game_article, resp_error_handler

class WikipediaGameSpider(Spider):
    """
    crawl wikipedia game pages (multi-language)
    """
    name = 'WikipediaGameSpider'
    allowed_domains = ('wikipedia.org',)

    _titles = []

    def __init__(self, *a, **kw):
        super().__init__(*a, **kw)
        self._titles = kw['titles'].split('||') if 'titles' in kw else []

    def start_requests(self):
        for title in self._titles:
            url = WIKIPEDIA_SEARCH_LINK_FORMAT.format(urlencoded=quote_plus(title))
            yield Request(url,
                        callback=parse_wikipedia_game_article,
                        errback=resp_error_handler)

    def parse(self, response, **kwargs):
        pass
