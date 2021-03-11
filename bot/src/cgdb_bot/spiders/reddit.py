from scrapy import Request, signals
from cgdb_bot.parsers import parse_reddit_stadia_wiki
from cgdb_bot.utils import to_bool
from . import BaseCgdbSpider

class RedditStadiaSpider(BaseCgdbSpider):
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
                    errback=self.resp_error_handler,
                    cb_kwargs={'wiki_type': stat})
        else:
            yield Request(
                self.urls[self._type],
                callback=parse_reddit_stadia_wiki,
                errback=self.resp_error_handler,
                cb_kwargs={'wiki_type': self._type})
