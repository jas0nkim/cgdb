from scrapy import Request
from cgdb_bot.parsers import (parse_steamstore_searchresults,
                            parse_steamstore_game_detail)
from cgdb_bot import utils
from cgdb_bot.settings import (CRAWL_ARG_DELIMITER,
                            STEAMPOWERED_PRESET_COOKIES)
from . import BaseCgdbSpider

class SteampoweredSpider(BaseCgdbSpider):
    """
    crawl steam store pages
    """
    name = 'SteampoweredSpider'
    allowed_domains = ('steampowered.com',)

    def __init__(self, *a, **kw):
        super().__init__(*a, **kw)
        self._titles = kw['titles'].split(CRAWL_ARG_DELIMITER) if 'titles' in kw else []
        self._urls = kw['urls'].split(CRAWL_ARG_DELIMITER) if 'urls' in kw else []
        self._platform = kw['platform'] if 'platform' in kw else None
        self._postdata = utils.to_bool(kw['postdata']) if 'postdata' in kw else False

    def start_requests(self):
        for title in self._titles:
            yield Request(
                    utils.get_steampowered_search_result_url(title),
                    callback=parse_steamstore_searchresults,
                    errback=self.resp_error_handler,
                    cookies=STEAMPOWERED_PRESET_COOKIES,
                    cb_kwargs={'title': title})
        for url in self._urls:
            yield Request(
                    url,
                    callback=parse_steamstore_game_detail,
                    errback=self.resp_error_handler,
                    cookies=STEAMPOWERED_PRESET_COOKIES)
