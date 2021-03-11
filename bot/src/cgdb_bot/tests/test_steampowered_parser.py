import os
import json
import unittest
from pathlib import Path
from scrapy import Request
from cgdb_bot.items import ErrorItem
from cgdb_bot.parsers import (parse_steamstore_searchresults,
                            parse_steamstore_game_detail)
from cgdb_bot.utils import get_steampowered_search_result_url, clean_url
from .utils import build_response

class TestSteampoweredParser(unittest.TestCase):
    """
    Test Steampowered page parsers
    """
    @classmethod
    def setUpClass(cls):
        cls.test_search_data = json.loads(Path(f'{os.path.splitext(os.path.abspath(__file__))[0]}_search_data.json').read_text())
        cls.test_detail_data = json.loads(Path(f'{os.path.splitext(os.path.abspath(__file__))[0]}_detail_data.json').read_text())

    def test_url_responses(self):
        """
        test each url active
        """
        for data in self.test_search_data:
            url = get_steampowered_search_result_url(data['title'])
            resp = build_response(url)
            with self.subTest(url=data['title']):
                self.assertEqual(resp.status, 200)
        for data in self.test_detail_data:
            resp = build_response(data['url'])
            with self.subTest(url=data['url']):
                self.assertEqual(resp.status, 200)

    def test_search(self):
        """
        test Steampowered game search parser
        """
        for data in self.test_search_data:
            url = get_steampowered_search_result_url(data['title'])
            item = parse_steamstore_searchresults(build_response(url),
                                                title=data['title'])
            with self.subTest(title=data['title']):
                # num of item is 1, but it's still iterate since generation.
                for i in item:
                    if isinstance(i, Request):
                        self.assertEqual(clean_url(i.url),
                                        data['expected']['link'])
                        self.assertEqual(i.cb_kwargs['title'],
                                        data['expected']['title'])
                    elif isinstance(i, ErrorItem):
                        self.assertEqual(i.title,
                                        data['expected']['title'])
                        self.assertEqual(i.link,
                                        data['expected']['link'])
                        self.assertEqual(i.message,
                                        data['expected']['message'])

    def test_game_detail(self):
        """
        test Steampowered game detail parser
        """
        for data in self.test_detail_data:
            item = parse_steamstore_game_detail(build_response(data['url']))
            with self.subTest(url=data['url']):
                # num of item is 1, but it's still iterate since generation.
                for i in item:
                    self.assertEqual(i.title,
                                    data['expected']['title'])
                    self.assertEqual(i.description,
                                    data['expected']['description'])
                    self.assertTrue(set(i.pictures).issubset(data['expected']['pictures']))
                    self.assertEqual(frozenset(i.developers),
                                    frozenset(data['expected']['developers']))
                    self.assertEqual(frozenset(i.publishers),
                                    frozenset(data['expected']['publishers']))
                    self.assertEqual(i.franchise,
                                    data['expected']['franchise'])
                    self.assertEqual(frozenset(i.genres),
                                    frozenset(data['expected']['genres']))
                    self.assertEqual(i.release_date,
                                    data['expected']['release_date'])
                    self.assertEqual(i.link,
                                    data['expected']['link'])
