from scrapy import Request
from scrapy.exceptions import CloseSpider
from cgdb_bot.parsers import parse_metacritic_browse_games
from cgdb_bot import utils, settings
from . import BaseCgdbSpider

class MetacriticSpider(BaseCgdbSpider):
    """
    crawl steam store pages
    """
    name = 'MetacriticSpider'
    allowed_domains = ('metacritic.com',)

    def __init__(self, *a, **kw):
        super().__init__(*a, **kw)
        # self._titles = kw['titles'].split(settings.CRAWL_ARG_DELIMITER) if 'titles' in kw else []
        # self._urls = kw['urls'].split(settings.CRAWL_ARG_DELIMITER) if 'urls' in kw else []
        self._platform = kw['platform'] if 'platform' in kw else None
        self._postdata = utils.to_bool(kw['postdata']) if 'postdata' in kw else False

    def start_requests(self):
        if self._platform == 'Stadia':
            yield Request(
                    url=settings.METACRITIC_START_URL,
                    callback=parse_metacritic_browse_games,
                    errback=self.resp_error_handler)
        else:
            raise CloseSpider('No platform specified.')
