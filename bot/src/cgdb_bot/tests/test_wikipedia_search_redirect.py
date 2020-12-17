import os
import json
from pathlib import Path
from urllib.parse import quote_plus
import unittest
import requests
from cgdb_bot.settings import WIKIPEDIA_SEARCH_URL_FORMAT

class TestWikipediaSearchRedirect(unittest.TestCase):
    """
    Test Wikipedia search redirect
    """

    def setUp(self):
        content = Path(f'{os.path.splitext(os.path.abspath(__file__))[0]}_data.json').read_text()
        self.test_data = json.loads(content)

    def test_url_responses(self):
        """
        test each url active
        """
        for title in self.test_data:
            url = WIKIPEDIA_SEARCH_URL_FORMAT.format(urlencoded=quote_plus(title))
            resp = requests.get(url)
            with self.subTest(title=title):
                self.assertEqual(resp.status_code, 200)
