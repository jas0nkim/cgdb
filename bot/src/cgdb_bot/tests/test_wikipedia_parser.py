import os
import json
import unittest
from pathlib import Path
from cgdb_bot.parsers import (parse_wikipedia_game_article,
                            WikipediaStadiaGamesParser)
from cgdb_bot.settings import WIKIPEDIA_STADIA_GAMES_URL
from .utils import build_response

class TestWikipediaParser(unittest.TestCase):
    """
    Test Wikipedia page parsers
    """

    @classmethod
    def setUpClass(cls):
        cls.test_article_data = json.loads(Path(f'{os.path.splitext(os.path.abspath(__file__))[0]}_games_data.json').read_text())
        cls.test_interlang_data = json.loads(Path(f'{os.path.splitext(os.path.abspath(__file__))[0]}_game_inter_languages_data.json').read_text())

    def test_url_responses(self):
        """
        test each url active
        """
        for data in self.test_article_data:
            resp = build_response(data['url'])
            with self.subTest(url=data['url']):
                self.assertEqual(resp.status, 200)

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
                    #####################################
                    # skip checking decription: since some contents in #
                    # wikipedia is keep changing.
                    #
                    # self.assertEqual(i.description_lc,
                    #                 data['expected']['description_lc'])
                    #####################################
                    self.assertEqual(frozenset(i.pictures),
                                    frozenset(data['expected']['pictures']))
                    self.assertEqual(frozenset(i.developers),
                                    frozenset(data['expected']['developers']))
                    self.assertEqual(frozenset(i.publishers),
                                    frozenset(data['expected']['publishers']))
                    self.assertEqual(frozenset(i.series),
                                    frozenset(data['expected']['series']))
                    self.assertEqual(frozenset(i.genres),
                                    frozenset(data['expected']['genres']))
                    self.assertEqual(frozenset(i.modes),
                                    frozenset(data['expected']['modes']))
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

    def test_stadia_game_links(self):
        """
        test parsing stadia game links are valid:
        https://en.wikipedia.org/wiki/List_of_Stadia_games
        """
        for link in WikipediaStadiaGamesParser()._extract_game_links(
                    build_response(WIKIPEDIA_STADIA_GAMES_URL)):
            self.assertRegex(link, r'/wiki/(.+)')
