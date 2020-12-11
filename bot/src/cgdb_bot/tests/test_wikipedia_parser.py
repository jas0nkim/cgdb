import os
import json
import unittest
from pathlib import Path
import requests
from scrapy.http import HtmlResponse, Request
from cgdb_bot.parsers import parse_wikipedia_game_article

def build_response(url):
    """
    build Scrapy HtmlResponse object
    """
    resp = requests.get(url)
    return HtmlResponse(url, request=Request(url, encoding=resp.encoding),
                        body=resp.content)

class TestWikipediaParser(unittest.TestCase):
    """
    Test Wikipedia page parsers
    """

    def setUp(self):
        content = Path(f'{os.path.splitext(os.path.abspath(__file__))[0]}_data.json').read_text()
        self.test_data = json.loads(content)

    def test_url_responses(self):
        """
        test each url active
        """
        for data in self.test_data:
            resp = requests.get(data['url'])
            with self.subTest(url=data['url']):
                self.assertEqual(resp.status_code, 200)

    def test_parser(self):
        """
        test wiki game article parser
        """
        for data in self.test_data:
            item = parse_wikipedia_game_article(build_response(data['url']))
            with self.subTest(url=data['url']):
                # num of item is 1, but it's still iterate since generation.
                for i in item:
                    self.assertEqual(i.title,
                                    data['expected']['title'])
                    self.assertEqual(i.description,
                                    data['expected']['description'])
                    self.assertEqual(i.pictures,
                                    data['expected']['pictures'])
                    self.assertEqual(i.developers,
                                    data['expected']['developers'])
                    self.assertEqual(i.publishers,
                                    data['expected']['publishers'])
                    self.assertEqual(i.series,
                                    data['expected']['series'])
                    self.assertEqual(i.genres,
                                    data['expected']['genres'])
                    self.assertEqual(i.modes,
                                    data['expected']['modes'])
