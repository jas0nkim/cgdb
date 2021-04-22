import os
import json
import datetime
import unittest
from pathlib import Path
from scrapy.http.request import Request
from cgdb_bot.parsers import (parse_reddit_stadia_wiki,
                            parse_reddit_game_stat_detail)
from .utils import build_response

class TestRedditWikiParser(unittest.TestCase):
    """
    Test subreddit (r/Stadia) wiki page parsers
    """

    def setUp(self):
        content = Path(f'{os.path.splitext(os.path.abspath(__file__))[0]}_data.json').read_text()
        _json = json.loads(content)
        self.urls = _json.get('urls')
        self.esrb_urls = _json.get('esrb_urls')
        self.genre_urls = _json.get('genre_urls')
        self.developer_urls = _json.get('developer_urls')
        self.publisher_urls = _json.get('publisher_urls')
        self.mode_urls = _json.get('mode_urls')

    def test_game_fields_valid(self):
        """
        ref link:
        https://www.reddit.com/r/Stadia/wiki/gamestatistics/gameslist
        check all fields (game title, stadia link, release date) not null
        """
        wiki_type = 'games'
        resp = build_response(self.urls[wiki_type])
        self.assertEqual(resp.status, 200)
        item_count = 0
        for i in parse_reddit_stadia_wiki(resp, wiki_type):
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
        # total 175 items (Apr 22 2021)
        self.assertEqual(item_count, 175)

    def test_game_pro_fields_valid_and_related(self):
        """
        ref link:
        https://www.reddit.com/r/Stadia/wiki/gamestatistics/progameslist
        check field (event_date - entered/left month) not null.
        same event_date cannot be appeared more than once in the items
        """
        wiki_type = 'pro_games'
        resp = build_response(self.urls[wiki_type])
        self.assertEqual(resp.status, 200)
        curr_item = None
        prev_item = None
        event_date_list = []
        pro_titles = []
        item_count = 0
        for i in parse_reddit_stadia_wiki(resp, wiki_type):
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
        # total 18 items (Mar 24 2021)
        self.assertEqual(item_count, 18)
        self.assertEqual(len(event_date_list), item_count)
        self.assertTrue(len(event_date_list) > 0)
        self.assertTrue(len(pro_titles) > 0)

    def test_game_ratings_home(self):
        """
        ref link:
        https://www.reddit.com/r/Stadia/wiki/gamestatistics/gameratings
        """
        wiki_type = 'ratings'
        resp = build_response(self.urls[wiki_type])
        self.assertEqual(resp.status, 200)
        for request in parse_reddit_stadia_wiki(resp, wiki_type):
            self.assertIsInstance(request, Request)

    def test_game_esrb_ratings_detail(self):
        """
        ref link:
        https://www.reddit.com/r/Stadia/wiki/gamestatistics/gameratings/xxx
        check all fields (game title, stats type, stats detail) not null
        """
        wiki_type = 'ratings'
        for esrb, url in self.esrb_urls.items():
            resp = build_response(url)
            self.assertEqual(resp.status, 200)
            for i in parse_reddit_game_stat_detail(resp, wiki_type, esrb):
                # fields not null
                self.assertIsNotNone(i.title)
                self.assertIsNotNone(i.stat_type)
                self.assertIsNotNone(i.stat_detail)
                if i.title == 'Just Dance 2020':
                    self.assertEqual(i.stat_detail, 'E10+')
                elif i.title == 'Watch Dogs 2':
                    self.assertEqual(i.stat_detail, 'M17+')

    def test_game_genres_home(self):
        """
        ref link:
        https://www.reddit.com/r/Stadia/wiki/gamestatistics/gamegenres
        """
        wiki_type = 'genres'
        resp = build_response(self.urls[wiki_type])
        self.assertEqual(resp.status, 200)
        for request in parse_reddit_stadia_wiki(resp, wiki_type):
            self.assertIsInstance(request, Request)

    def test_game_genres_detail(self):
        """
        ref link:
        https://www.reddit.com/r/Stadia/wiki/gamestatistics/gamegenres/xxx
        check all fields (game title, stats type, stats detail) not null
        """
        wiki_type = 'genres'
        for genre, url in self.genre_urls.items():
            resp = build_response(url)
            self.assertEqual(resp.status, 200)
            for i in parse_reddit_game_stat_detail(resp, wiki_type, genre):
                # fields not null
                self.assertIsNotNone(i.title)
                self.assertIsNotNone(i.stat_type)
                self.assertIsNotNone(i.stat_detail)
                if i.title == "Assassin's Creed Origins":
                    self.assertIn(i.stat_detail, ['action', 'role-playing game'])

    def test_game_developers_home(self):
        """
        ref link:
        https://www.reddit.com/r/Stadia/wiki/gamestatistics/gamedevelopers
        """
        wiki_type = 'developers'
        resp = build_response(self.urls[wiki_type])
        self.assertEqual(resp.status, 200)
        for request in parse_reddit_stadia_wiki(resp, wiki_type):
            self.assertIsInstance(request, Request)

    def test_game_developers_detail(self):
        """
        ref link:
        https://www.reddit.com/r/Stadia/wiki/gamestatistics/gamedevelopers/xxx
        check all fields (game title, stats type, stats detail) not null
        """
        wiki_type = 'developers'
        for genre, url in self.developer_urls.items():
            resp = build_response(url)
            self.assertEqual(resp.status, 200)
            for i in parse_reddit_game_stat_detail(resp, wiki_type, genre):
                # fields not null
                self.assertIsNotNone(i.title)
                self.assertIsNotNone(i.stat_type)
                self.assertIsNotNone(i.stat_detail)
                if i.title == "Far Cry New Dawn":
                    self.assertIn(i.stat_detail, ['Ubisoft',])
                elif i.title == "Just Dance 2021":
                    self.assertIn(i.stat_detail, ['Ubisoft',])
                elif i.title == "Marvel's Avengers":
                    self.assertIn(i.stat_detail, ['Nixxes', 'Crystal Dynamics', 'Eidos Interactive'])

    def test_game_publishers_home(self):
        """
        ref link:
        https://www.reddit.com/r/Stadia/wiki/gamestatistics/gamepublishers
        """
        wiki_type = 'publishers'
        resp = build_response(self.urls[wiki_type])
        self.assertEqual(resp.status, 200)
        for request in parse_reddit_stadia_wiki(resp, wiki_type):
            self.assertIsInstance(request, Request)

    def test_game_publishers_detail(self):
        """
        ref link:
        https://www.reddit.com/r/Stadia/wiki/gamestatistics/gamepublishers/xxx
        check all fields (game title, stats type, stats detail) not null
        """
        wiki_type = 'publishers'
        for genre, url in self.publisher_urls.items():
            resp = build_response(url)
            self.assertEqual(resp.status, 200)
            for i in parse_reddit_game_stat_detail(resp, wiki_type, genre):
                # fields not null
                self.assertIsNotNone(i.title)
                self.assertIsNotNone(i.stat_type)
                self.assertIsNotNone(i.stat_detail)
                if i.title == "Assassin's Creed Origins":
                    self.assertIn(i.stat_detail, ['Ubisoft',])
                elif i.title == "Family Feud":
                    self.assertIn(i.stat_detail, ['Ubisoft',])
                elif i.title == "Doom":
                    self.assertIn(i.stat_detail, ['Bethesda Softworks',])

    def test_game_modes_home(self):
        """
        ref link:
        https://www.reddit.com/r/Stadia/wiki/gamestatistics/gamemodes
        """
        wiki_type = 'modes'
        resp = build_response(self.urls[wiki_type])
        self.assertEqual(resp.status, 200)
        for request in parse_reddit_stadia_wiki(resp, wiki_type):
            self.assertIsInstance(request, Request)

    def test_game_modes_detail(self):
        """
        ref link:
        https://www.reddit.com/r/Stadia/wiki/gamestatistics/gamemodes/xxx
        check all fields (game title, stats type, stats detail) not null
        """
        wiki_type = 'modes'
        for genre, url in self.mode_urls.items():
            resp = build_response(url)
            self.assertEqual(resp.status, 200)
            for i in parse_reddit_game_stat_detail(resp, wiki_type, genre):
                # fields not null
                self.assertIsNotNone(i.title)
                self.assertIsNotNone(i.stat_type)
                self.assertIsNotNone(i.stat_detail)
                if i.title == "DRAGON BALL XENOVERSE 2":
                    self.assertIn(i.stat_detail, ['local multiplayer games', 'single player', 'online multiplayer', 'competitive', 'online co-op', 'local multiplayer',])
                elif i.title == "Human: Fall Flat":
                    self.assertIn(i.stat_detail, ['local co-op', 'single player', 'online multiplayer', 'online co-op', 'local multiplayer', 'split screen',])
                elif i.title == "UNO":
                    self.assertIn(i.stat_detail, ['local multiplayer', 'single player', 'online multiplayer', 'competitive', 'online co-op', 'local co-op',])
