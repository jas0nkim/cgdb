from slugify import slugify
from scrapy import Request
from scrapy.exceptions import CloseSpider
from cgdb_bot.parsers import parse_metacritic_game_detail
from cgdb_bot import settings, utils
from . import BaseCgdbSpider

class MetacriticSpider(BaseCgdbSpider):
    """
    crawl steam store pages
    """
    name = 'MetacriticSpider'
    allowed_domains = ('metacritic.com',)

    def __init__(self, *a, **kw):
        super().__init__(*a, **kw)
        self._titles = kw['titles'].split(settings.CRAWL_ARG_DELIMITER) if 'titles' in kw else []
        self._urls = kw['urls'].split(settings.CRAWL_ARG_DELIMITER) if 'urls' in kw else []
        self._platform = kw['platform'] if 'platform' in kw else None
        self._postdata = utils.to_bool(kw['postdata']) if 'postdata' in kw else False

    def start_requests(self):
        if not self._platform:
            raise CloseSpider('No platform specified.')
        for title in self._titles:
            yield Request(
                    settings.METACRITIC_GAME_URL_FORMAT.format(
                        platform=settings.METACRITIC_PLATFORM_MAP[self._platform],
                        title=slugify(title,
                            replacements=settings.METACRITIC_SLUGIFY_REPLACEMENTS)),
                    callback=parse_metacritic_game_detail,
                    errback=self.resp_error_handler,
                    cb_kwargs={'title': title})
        for url in self._urls:
            yield Request(
                    url,
                    callback=parse_metacritic_game_detail,
                    errback=self.resp_error_handler)
