import logging
from scrapy import Request
from cgdb_bot.items import (RedditStadiaWikiGame,
                            RedditStadiaWikiGamePro,
                            RedditStadiaWikiRating)
from cgdb_bot.settings import REDDIT_DOMAIN

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
            title = game.xpath('./td[4]/a/text()').get()
            stadia_link = game.xpath('./td[4]/a/@href').get()
            release_date = game.xpath('./td[1]/text()').get()
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
        if response.status != 200:
            # broken link or inactive
            self.logger.error("Wiki page (%s) not working: HTTP status code - %s - %s", 
                            wiki_type,
                            response.status,
                            response.url)
            return []

        pro_games = response.xpath('//div[contains(@class, "wiki")]/table/tbody/tr')
        pro_games.reverse()
        current_entered_titles = []
        current_left_titles = []
        current_event_date = None
        for game in pro_games:
            entered = game.xpath('./td[4]/a/text()').get()
            left = game.xpath('./td[6]/a/text()').get()
            event_year = game.xpath('./td[1]/text()').get()
            event_month = game.xpath('./td[2]/text()').get()
            if entered:
                current_entered_titles.append(entered)
            if left:
                current_left_titles.append(left)
            if event_year and event_month:
                current_event_date = f'{event_year} {event_month}'
                yield RedditStadiaWikiGamePro(
                                entered_titles=current_entered_titles,
                                left_titles=current_left_titles,
                                event_date=current_event_date)
                current_entered_titles = []
                current_left_titles = []
                current_event_date = None

    def parse_game_ratings_page(self, response, wiki_type):
        if response.status != 200:
            # broken link or inactive
            self.logger.error("Wiki page (%s) not working: HTTP status code - %s - %s",
                            wiki_type,
                            response.status,
                            response.url)
            return []
        esrb_ratings = response.xpath('//div[contains(@class, "wiki")]/table[1]/tbody/tr')
        for esrb in esrb_ratings:
            esrb_text = esrb.xpath('./td[1]/a/text()').get()
            esrb_games_link = esrb.xpath('./td[1]/a/@href').get()
            if esrb_games_link and esrb_text in ['E', 'E10+', 'T', 'M17+']:
                yield Request(
                        REDDIT_DOMAIN + esrb_games_link,
                        callback=self.parse_each_rating_page,
                        cb_kwargs={'esrb': esrb_text})

    def parse_each_rating_page(self, response, esrb):
        if response.status != 200:
            # broken link or inactive
            self.logger.error("Wiki page (%s) not working: HTTP status code - %s - %s",
                            f'ESRB {esrb}',
                            response.status,
                            response.url)
            return []
        games = response.xpath('//div[contains(@class, "wiki")]/table/tbody/tr')
        for game in games:
            title = game.xpath('./td/a/text()').get()
            if not title:
                self.logger.warning("game title not found from ESRB %s page - %s",
                                esrb,
                                response.url)
            yield RedditStadiaWikiRating(title=title,
                                        esrb=esrb)
