import logging
from cgdb_bot.items import RedditStadiaWikiGame

class RedditStadiaWikiParser:
    """
    subreddit Stadia Wiki page parser
    """
    def __init__(self):
        self.logger = logging.getLogger(__name__)

    def parse_games_page(self, response, wiki_type):
        if response.status != 200:
            # broken link or inactive
            self.logger.error("Wiki page (%s) not working: HTTP status code - %s - %s", 
                            wiki_type,
                            response.status,
                            response.url)
            return []

        games = response.xpath('//div[contains(@class, "wiki")]/table/tbody/tr')
        for game in games:
            title = game.xpath('./td[4]//text()').get()
            stadia_link = game.xpath('./td[4]/a/@href').get()
            release_date = game.xpath('./td[1]//text()').get()
            if not title:
                self.logger.warning("game title not found from wiki page (%s) - %s",
                                wiki_type,
                                response.url)
            if not stadia_link:
                self.logger.warning("stadia game link not found from wiki page (%s) - %s",
                                wiki_type,
                                response.url)
            if not release_date:
                self.logger.warning("game release date not found from wiki page (%s) - %s",
                                wiki_type,
                                response.url)
            yield RedditStadiaWikiGame(title=title,
                                    stadia_link=stadia_link,
                                    release_date=release_date)

    def parse_pro_games_page(self, response, wiki_type):
        pass