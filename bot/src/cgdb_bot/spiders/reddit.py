from twisted.internet.defer import inlineCallbacks
import treq
from scrapy import Spider, Request, signals
from scrapy.exceptions import DropItem
from cgdb_bot.parsers import (parse_reddit_stadia_wiki,
                            general_resp_error_handler)
from cgdb_bot.items import (RedditStadiaWikiGame,
                        RedditStadiaWikiGamePro,
                        RedditStadiaStatDetail)
from cgdb_bot.settings import API_SERVER_HOST, API_SERVER_PORT
from cgdb_bot.utils import to_bool

class RedditStadiaSpider(Spider):
    """
    Crawl subreddit r/Stadia/wiki pages
    """

    name = 'RedditStadiaSpider'
    allowed_domains = ('reddit.com',)

    urls = {
        'games': 'https://www.reddit.com/r/Stadia/wiki/gamestatistics/gameslist',
        'pro_games': 'https://www.reddit.com/r/Stadia/wiki/gamestatistics/progameslist',
        'ratings': 'https://www.reddit.com/r/Stadia/wiki/gamestatistics/gameratings',
        'genres': 'https://www.reddit.com/r/Stadia/wiki/gamestatistics/gamegenres',
        'developers': 'https://www.reddit.com/r/Stadia/wiki/gamestatistics/gamedevelopers',
        'publishers': 'https://www.reddit.com/r/Stadia/wiki/gamestatistics/gamepublishers',
        'modes': 'https://www.reddit.com/r/Stadia/wiki/gamestatistics/gamemodes',
    }

    def __init__(self, *a, **kw):
        super().__init__(*a, **kw)
        self._type = kw['type'] if 'type' in kw and (kw['type'] in self.urls or kw['type'] == 'allstats') else 'games'
        self._postdata = to_bool(kw['postdata']) if 'postdata' in kw else False

    def start_requests(self):
        if self._type == 'allstats':
            for stat in ['ratings', 'genres', 'developers', 'publishers', 'modes']:
                yield Request(
                    self.urls[stat],
                    callback=parse_reddit_stadia_wiki,
                    errback=general_resp_error_handler,
                    cb_kwargs={'wiki_type': stat})
        else:
            yield Request(
                self.urls[self._type],
                callback=parse_reddit_stadia_wiki,
                errback=general_resp_error_handler,
                cb_kwargs={'wiki_type': self._type})

    @classmethod
    def from_crawler(cls, crawler, *args, **kwargs):
        spider = super().from_crawler(crawler, *args, **kwargs)
        crawler.signals.connect(spider.item_scraped, signal=signals.item_scraped)
        return spider

    def item_scraped(self, item, response, spider):
        """
        Send the scraped item to the API server
        """
        if not self._postdata:
            return None
        api_endpoint = None
        if isinstance(item, RedditStadiaWikiGame):
            api_endpoint = '/api/bot/reddit/stadia/game/'
        elif isinstance(item, RedditStadiaWikiGamePro):
            api_endpoint = '/api/bot/reddit/stadia/gamepro/'
        elif isinstance(item, RedditStadiaStatDetail):
            api_endpoint = '/api/bot/reddit/stadia/gamestats/'
        else:
            raise DropItem(f"Invalid item passed to item_scraped (Scrapy Signal) - {type(item).__name__}")

        _logger = self.logger
        @inlineCallbacks
        def _cb(resp):
            content = yield resp.content()
            if resp.code >= 400:
                _logger.error("API post request error [HTTP:%d] %s %s %s",
                            resp.code,
                            resp.request.absoluteURI,
                            item.asjson(),
                            content[0:2000])

        d = treq.post(f'{API_SERVER_HOST}:{API_SERVER_PORT}{api_endpoint}',
                    item.asjson().encode('ascii'),
                    headers={b'Content-Type': [b'application/json']})
        d.addCallback(_cb)
        # The next item will be scraped only after
        # deferred (d) is fired
        return d
