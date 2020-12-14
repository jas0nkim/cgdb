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
        _json = json.loads(content)
        self.test_article_data = _json.get('parse_wikipedia_game_article')
        self.test_interlang_data = _json.get('parse_wikipedia_game_inter_languages')

    def test_url_responses(self):
        """
        test each url active
        """
        for data in self.test_article_data:
            resp = requests.get(data['url'])
            with self.subTest(url=data['url']):
                self.assertEqual(resp.status_code, 200)

    def test_article(self):
        """
        test wiki game article parser
        """
        for data in self.test_article_data:
            item = parse_wikipedia_game_article(build_response(data['url']))
            with self.subTest(url=data['url']):
                # num of item is 1, but it's still iterate since generation.
                for i in item:
                    self.assertEqual(i.english_title,
                                    data['expected']['english_title'])
                    self.assertEqual(i.language,
                                    data['expected']['language'])
                    self.assertEqual(i.title_lc,
                                    data['expected']['title_lc'])
                    self.assertEqual(i.description_lc,
                                    data['expected']['description_lc'])
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
                    self.assertEqual(i.link,
                                    data['expected']['link'])

    def test_interlang(self):
        """
        test inter language from wiki game article page
        """
        for data in self.test_interlang_data:
            item = parse_wikipedia_game_article(build_response(data['url']))
            with self.subTest(url=data['url']):
                # num of item is 1, but it's still iterate since generation.
                for i in item:
                    self.assertEqual(len(i.inter_languages),
                                    len(data['expected']['inter_languages']))
                    for j in range(len(i.inter_languages)):
                        self.assertEqual(i.inter_languages[j]['iso'],
                                data['expected']['inter_languages'][j]['iso'])
                        self.assertEqual(i.inter_languages[j]['url'],
                                data['expected']['inter_languages'][j]['url'])
                        self.assertEqual(i.inter_languages[j]['lang'],
                                data['expected']['inter_languages'][j]['lang'])
                        self.assertEqual(i.inter_languages[j]['lang_lc'],
                                data['expected']['inter_languages'][j]['lang_lc'])
                        self.assertEqual(i.inter_languages[j]['title_lc'],
                                data['expected']['inter_languages'][j]['title_lc'])
