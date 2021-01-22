from scrapy import Spider, Request
from cgdb_bot.parsers import parse_reddit_stadia_wiki
from . import general_resp_error_handler

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

    def start_requests(self):
        for wiki_type, url in self.urls.items():
            yield Request(
                    url,
                    callback=parse_reddit_stadia_wiki,
                    errback=general_resp_error_handler,
                    cb_kwargs={'wiki_type': wiki_type})

