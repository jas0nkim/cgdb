import os
import json
import unittest
import requests
from pathlib import Path
from scrapy.http import HtmlResponse, Request
from cgdb_bot.parsers import parse_wikipedia_game_article

def build_response(url):
    resp = requests.get(url)
    return HtmlResponse(url, request=Request(url, encoding=resp.encoding),
                        body=resp.content)

class TestWikipediaParser(unittest.TestCase):

    def setUp(self):
        content = Path(f'{os.path.splitext(os.path.abspath(__file__))[0]}_data.json').read_text()
        self.test_data = json.loads(content)

    def test_url_responses(self):
        for data in self.test_data:
            resp = requests.get(data['url'])
            with self.subTest(url=data['url']):
                self.assertEqual(resp.status_code, 200)
    
    def test_parser(self):
        for data in self.test_data:
            item = parse_wikipedia_game_article(build_response(data['url']))
            with self.subTest(url=data['url']):
                for i in item:  # num of item is 1
                    self.assertEqual(i.get('title'), data['expected']['title'])
