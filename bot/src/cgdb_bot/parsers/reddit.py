import json
import logging
from scrapy.selector import Selector
from cgdb_bot.exceptions import NoHtmlElementFound
from cgdb_bot.items import (RedditStadiaWikiGame,
                            RedditStadiaWikiGamePro,
                            RedditStadiaStatDetail,
                            ErrorItem)
from cgdb_bot.settings import REDDIT_DOMAIN

class RedditStadiaWikiParser:
    """
    subreddit Stadia Wiki page parser
    """
    def __init__(self):
        self.logger = logging.getLogger(__name__)

    def _get_selector_from_js(self, response, wiki_type):
        _page = {
            'games': '[stadia]--[gamestatistics/gameslist]',
            'pro_games': '[stadia]--[gamestatistics/progameslist]',
            'ratings': '[stadia]--[gamestatistics/gameratings]',
            'genres': '[stadia]--[gamestatistics/gamegenres]',
            'developers': '[stadia]--[gamestatistics/gamedevelopers]',
            'publishers': '[stadia]--[gamestatistics/gamepublishers]',
            'modes': '[stadia]--[gamestatistics/gamemodes]',
        }
        html = None
        _d = response.xpath('//script[@id="data"]/text()').get()
        if not _d:
            raise NoHtmlElementFound('_get_selector_from_js: Unable to find script @id=data')
        _d = _d.lstrip('window.___r = ').rstrip(';')
        try:
            json_data = json.loads(_d)
        except json.JSONDecodeError as err:
            raise NoHtmlElementFound(f'_get_selector_from_js: JSONDecodeError - {str(err)}')
        try:
            html = json_data['pages']['subredditWiki']['pages'][_page[wiki_type]]['content']['html']
        except KeyError as err:
            raise NoHtmlElementFound(f'_get_selector_from_js: KeyError - {str(err)}')
        return Selector(text=html)

    def parse_games_page(self, response, wiki_type):
        if response.status != 200:
            # broken link or inactive
            error_msg = f"Wiki page ({wiki_type}) not working: HTTP status code - {response.status} - {response.url}"
            self.logger.error(error_msg)
            yield ErrorItem(link=response.url,
                            message=error_msg)
        else:
            wiki_table_query = '//div[contains(@class, "wiki")]/table/tbody/tr'
            games = response.xpath(wiki_table_query)
            if not games:
                try:
                    selector = self._get_selector_from_js(response, wiki_type)
                except NoHtmlElementFound as err:
                    self.logger.error(str(err))
                    yield ErrorItem(link=response.url,
                                    message=str(err))
                else:
                    games = selector.xpath(wiki_table_query)
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
            error_msg = f"Wiki page ({wiki_type}) not working: HTTP status code - {response.status} - {response.url}"
            self.logger.error(error_msg)
            yield ErrorItem(link=response.url,
                            message=error_msg)
        else:
            wiki_table_query = '//div[contains(@class, "wiki")]/table/tbody/tr'
            pro_games = response.xpath(wiki_table_query)
            if not pro_games:
                try:
                    selector = self._get_selector_from_js(response, wiki_type)
                except NoHtmlElementFound as err:
                    self.logger.error(str(err))
                    yield ErrorItem(link=response.url,
                                    message=str(err))
                else:
                    pro_games = selector.xpath(wiki_table_query)
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

    def parse_game_stats_home_page(self, response, wiki_type):
        if response.status != 200:
            # broken link or inactive
            error_msg = f"Wiki page ({wiki_type}) not working: HTTP status code - {response.status} - {response.url}"
            self.logger.error(error_msg)
            yield ErrorItem(link=response.url,
                            message=error_msg)
        else:
            wiki_table_query = '//div[contains(@class, "wiki")]/table[1]/tbody/tr'
            stats = response.xpath(wiki_table_query)
            if not stats:
                try:
                    selector = self._get_selector_from_js(response, wiki_type)
                except NoHtmlElementFound as err:
                    self.logger.error(str(err))
                    yield ErrorItem(link=response.url,
                                    message=str(err))
                else:
                    stats = selector.xpath(wiki_table_query)
            for stat in stats:
                if wiki_type in ['ratings', 'genres', 'modes']:
                    stat_detail_text = stat.xpath('./td[1]/a/text()').get()
                    stat_detail_link = stat.xpath('./td[1]/a/@href').get()
                else:
                    stat_detail_text = stat.xpath('./td[1]/a/text()').get()
                    stat_detail_link = stat.xpath('./td[2]/a/@href').get()
                if stat_detail_link and stat_detail_text:
                    if wiki_type in ['genres', 'modes']:
                        stat_detail_text = stat_detail_text.lower()
                    yield response.follow(
                            REDDIT_DOMAIN + stat_detail_link,
                            callback=self.parse_game_stats_detail_page,
                            cb_kwargs={
                                'stat_type': wiki_type,
                                'stat_detail': stat_detail_text,
                            })

    def parse_game_stats_detail_page(self, response, stat_type, stat_detail):
        if response.status != 200:
            # broken link or inactive
            error_msg = f"Wiki page ({stat_type} - {stat_detail}) not working: HTTP status code - {response.status} - {response.url}"
            self.logger.error(error_msg)
            yield ErrorItem(link=response.url,
                            message=error_msg)
        else:
            games = response.xpath("""//div[contains(@class, "wiki")]
                                    /table/tbody/tr""")
            for game in games:
                title = game.xpath('./td/a/text()').get()
                if not title:
                    self.logger.warning("game title not found from page (%s - %s) - %s",
                                    stat_type,
                                    stat_detail,
                                    response.url)
                yield RedditStadiaStatDetail(title=title,
                                            stat_type=stat_type,
                                            stat_detail=stat_detail)
