import datetime
import unittest
from cgdb_bot.parsers import parse_reddit_stadia_wiki
from .utils import build_response

class TestRedditWikiParser(unittest.TestCase):
    """
    Test subreddit (r/Stadia) wiki page parsers
    """

    headers = {
        'user-agent': 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.130 Mobile Safari/537.36'
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

    def test_game_fields_valid(self):
        """
        ref link:
        https://www.reddit.com/r/Stadia/wiki/gamestatistics/gameslist
        check all fields (game title, stadia link, release date) not null
        """
        resp = build_response(self.urls['games'], headers=self.headers)
        self.assertEqual(resp.status, 200)
        items = parse_reddit_stadia_wiki(resp, 'games')
        for i in items:
            # fields not null
            self.assertIsNotNone(i.title)
            self.assertIsNotNone(i.stadia_link)
            self.assertIsNotNone(i.release_date)
            # valid stadia link
            self.assertIn('https://stadia.google.com/store/details' in i.stadia_link)
            # release_date field format
            self.assertIsInstance(
                    datetime.datetime.strptime(i.release_date, '%Y %b %d'),
                    datetime.datetime)
