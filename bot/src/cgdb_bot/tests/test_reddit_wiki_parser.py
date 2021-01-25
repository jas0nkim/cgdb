import datetime
import unittest

import requests
from scrapy.http.request import Request
from cgdb_bot.parsers import parse_reddit_stadia_wiki
from .utils import build_response

class TestRedditWikiParser(unittest.TestCase):
    """
    Test subreddit (r/Stadia) wiki page parsers
    """

    headers = {
        'user-agent': 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36'
    }

    urls = {
        'games': 'https://www.reddit.com/r/Stadia/wiki/gamestatistics/gameslist',
        'pro_games': 'https://www.reddit.com/r/Stadia/wiki/gamestatistics/progameslist',
        'ratings': 'https://www.reddit.com/r/Stadia/wiki/gamestatistics/gameratings',
        'genres': 'https://www.reddit.com/r/Stadia/wiki/gamestatistics/gamegenres',
        'developers': 'https://www.reddit.com/r/Stadia/wiki/gamestatistics/gamedevelopers',
        'publishers': 'https://www.reddit.com/r/Stadia/wiki/gamestatistics/gamepublishers',
        'modes': 'https://www.reddit.com/r/Stadia/wiki/gamestatistics/gamemodes',
    }

    esrb_urls = {
        'E': 'https://www.reddit.com/r/Stadia/wiki/gamestatistics/gameratings/esrb-e10',
        'E10+': 'https://www.reddit.com/r/Stadia/wiki/gamestatistics/gameratings/esrb-e10',
        'T': 'https://www.reddit.com/r/Stadia/wiki/gamestatistics/gameratings/esrb-t',
        'M17+': 'https://www.reddit.com/r/Stadia/wiki/gamestatistics/gameratings/esrb-m17',
    }

    def test_game_fields_valid(self):
        """
        ref link:
        https://www.reddit.com/r/Stadia/wiki/gamestatistics/gameslist
        check all fields (game title, stadia link, release date) not null
        """
        resp = build_response(self.urls['games'], headers=self.headers)
        self.assertEqual(resp.status, 200)
        item_count = 0
        for i in parse_reddit_stadia_wiki(resp, 'games'):
            item_count += 1
            # fields not null
            self.assertIsNotNone(i.title)
            self.assertIsNotNone(i.stadia_link)
            self.assertIsNotNone(i.release_date)
            # valid stadia link
            self.assertIn('https://stadia.google.com/store/details', i.stadia_link)
            # release_date field format
            self.assertIsInstance(
                    datetime.datetime.strptime(i.release_date, '%Y %b %d'),
                    datetime.datetime)
        # total 136 items (Jan 25 2021)
        self.assertEqual(item_count, 136)

    def test_game_pro_fields_valid_and_related(self):
        """
        ref link:
        https://www.reddit.com/r/Stadia/wiki/gamestatistics/progameslist
        check field (event_date - entered/left month) not null.
        same event_date cannot be appeared more than once in the items
        """
        resp = build_response(self.urls['pro_games'], headers=self.headers)
        self.assertEqual(resp.status, 200)
        curr_item = None
        prev_item = None
        event_date_list = []
        pro_titles = []
        item_count = 0
        for i in parse_reddit_stadia_wiki(resp, 'pro_games'):
            item_count += 1
            curr_item = i
            # event_date field not null
            self.assertIsNotNone(curr_item.event_date)
            # previous event_date should be bigger than current one.
            if prev_item:
                self.assertTrue(
                    datetime.datetime.strptime(curr_item.event_date, '%Y %b') >
                    datetime.datetime.strptime(prev_item.event_date, '%Y %b'))
            # event_date should not be duplicated.
            self.assertFalse(curr_item.event_date in event_date_list)
            event_date_list.append(curr_item.event_date)
            # check entered/left games
            for entered in curr_item.entered_titles:
                self.assertFalse(entered in pro_titles)
                pro_titles.append(entered)
            for left in curr_item.left_titles:
                self.assertTrue(left in pro_titles)
                pro_titles.remove(left)
            prev_item = curr_item
        # total 15 items (Jan 25 2021)
        self.assertEqual(item_count, 15)
        self.assertEqual(len(event_date_list), item_count)
        self.assertTrue(len(event_date_list) > 0)
        self.assertTrue(len(pro_titles) > 0)

    def test_game_ratings_home(self):
        """
        ref link:
        https://www.reddit.com/r/Stadia/wiki/gamestatistics/gameratings
        check all fields (game title, ESRB rating) not null
        """
        resp = build_response(self.urls['ratings'], headers=self.headers)
        self.assertEqual(resp.status, 200)
        for request in parse_reddit_stadia_wiki(resp, 'ratings'):
            self.assertIsInstance(request, Request)

    def test_game_esrb_ratings_each(self):
        """
        ref link:
        https://www.reddit.com/r/Stadia/wiki/gamestatistics/gameratings/xxx
        check all fields (game title, ESRB rating) not null
        """
        for esrb, url in self.esrb_urls.items():
            resp = build_response(url, headers=self.headers)
            self.assertEqual(resp.status, 200)
            for i in parse_reddit_stadia_wiki(resp, esrb):
                # fields not null
                self.assertIsNotNone(i.title)
                self.assertIsNotNone(i.esrb)
                if i.title == 'Just Dance 2020':
                    self.assertEqual(i.esrb, 'E10+')
                elif i.title == 'Watch Dogs 2':
                    self.assertEqual(i.esrb, 'M17+')
