import os
import json
import unittest
from pathlib import Path
from slugify import slugify
from cgdb_bot.items import ErrorItem
from cgdb_bot.parsers import parse_metacritic_game_detail
from cgdb_bot import settings
from .utils import build_response

class TestMetacriticParser(unittest.TestCase):
    """
    Test Metacritic page parsers
    """
    @classmethod
    def setUpClass(cls):
        cls.test_data = json.loads(Path(f'{os.path.splitext(os.path.abspath(__file__))[0]}_data.json').read_text())

    def test_game_detail(self):
        """
        test Steampowered game detail parser
        """
        for data in self.test_data:
            item = parse_metacritic_game_detail(
                build_response(
                    settings.METACRITIC_GAME_URL_FORMAT.format(
                        platform=settings.METACRITIC_PLATFORM_MAP[data['platform']],
                        title=slugify(data['title'],
                            replacements=settings.METACRITIC_SLUGIFY_REPLACEMENTS))))
            with self.subTest(url=data['title']):
                # num of item is 1, but it's still iterate since generation.
                for i in item:
                    self.assertEqual(i.title,
                                    data['expected']['title'])
                    self.assertEqual(i.description,
                                    data['expected']['description'])
                    self.assertTrue(set(i.pictures).issubset(data['expected']['pictures']))
                    self.assertEqual(frozenset(i.developers),
                                    frozenset(data['expected']['developers']))
                    self.assertEqual(frozenset(i.genres),
                                    frozenset(data['expected']['genres']))
                    self.assertEqual(i.rating,
                                    data['expected']['rating'])
                    self.assertEqual(i.link,
                                    data['expected']['link'])
