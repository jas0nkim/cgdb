import os
import json
from pathlib import Path
from django.urls import include, path, reverse
from django.contrib.auth import get_user_model
from rest_framework import status
from rest_framework.test import APITestCase, URLPatternsTestCase, APIClient
from cgdb_core.models import Game, Image
from cgdb_core import utils

class SteampoweredPostTests(APITestCase, URLPatternsTestCase):
    urlpatterns = [
        path('api/', include('cgdb_core.urls')),
    ]

    @classmethod
    def setUpTestData(cls):
        content = Path(f'{os.path.splitext(os.path.abspath(__file__))[0]}_data.json').read_text()
        _json = json.loads(content)
        cls._data_reddit_games = _json.get('reddit_games')
        cls._data_reddit_games_pro = _json.get('reddit_games_pro')
        cls._data_reddit_game_stats = _json.get('reddit_game_stats')
        cls._data_steampowered_games = _json.get('steampowered_games')
        cls._data_metacritic_games = _json.get('metacritic_games')
        cls._data_wikipedia_games = _json.get('wikipedia_games')
        cls.testuser = get_user_model().objects.create_user(username='testuser', password='12345')

    def tearDown(self):
        """
        Delete all images uploaded to s3 during this test
        """
        for image in Image.objects.all():
            utils.delete_from_s3(image.s3_url)

    def test_auth_fail_unautorized(self):
        """
        Test without auth
        """
        url = reverse('bot-stadia-game-post')
        response = self.client.post(url, data={}, format='json')
        self.assertEqual(response.status_code, status.HTTP_401_UNAUTHORIZED)
        url = reverse('bot-stadia-game-pro-post')
        response = self.client.post(url, data={}, format='json')
        self.assertEqual(response.status_code, status.HTTP_401_UNAUTHORIZED)
        url = reverse('bot-stadia-game-stats-post')
        response = self.client.post(url, data={}, format='json')
        self.assertEqual(response.status_code, status.HTTP_401_UNAUTHORIZED)
        url = reverse('bot-steampowered-stadia-game-post')
        response = self.client.post(url, data={}, format='json')
        self.assertEqual(response.status_code, status.HTTP_401_UNAUTHORIZED)
        url = reverse('bot-metacritic-stadia-game-post')
        response = self.client.post(url, data={}, format='json')
        self.assertEqual(response.status_code, status.HTTP_401_UNAUTHORIZED)
        url = reverse('bot-wikipedia-stadia-game-post')
        response = self.client.post(url, data={}, format='json')
        self.assertEqual(response.status_code, status.HTTP_401_UNAUTHORIZED)

    def _post(self, url, dataset, resp_status=0):
        # force authenticate
        self.client = APIClient()
        self.client.force_authenticate(user=self.testuser)
        for data in dataset:
            response = self.client.post(url, data, format='json')
            if response.status_code != resp_status:
                print(response.content)
            self.assertEqual(response.status_code, resp_status)

    def _post_stadia_game_from_reddit_and_metacritic(self):
        """
        Game crawled from reddit and metacritic (no steam)
        """
        self._post(url=reverse('bot-stadia-game-post'),
                dataset=self._data_reddit_games,
                resp_status=status.HTTP_201_CREATED)
        self._post(url=reverse('bot-stadia-game-pro-post'),
                dataset=self._data_reddit_games_pro,
                resp_status=status.HTTP_200_OK)
        self._post(url=reverse('bot-stadia-game-stats-post'),
                dataset=self._data_reddit_game_stats,
                resp_status=status.HTTP_200_OK)
        self._post(url=reverse('bot-metacritic-stadia-game-post'),
                dataset=self._data_metacritic_games,
                resp_status=status.HTTP_200_OK)

    def test_stadia_game_from_reddit_and_metacritic_genre_count(self):
        self._post_stadia_game_from_reddit_and_metacritic()
        # Cake Bash
        game = Game.objects.get(title='Cake Bash')
        self.assertEqual(game.genres.all().count(), 3)

    def test_stadia_game_from_reddit_and_metacritic_genre_exists(self):
        self._post_stadia_game_from_reddit_and_metacritic()
        # Cake Bash
        game = Game.objects.get(title='Cake Bash')
        self.assertTrue(game.genres.all().filter(name='party').exists())

    def test_stadia_game_from_reddit_and_metacritic_developer_count(self):
        self._post_stadia_game_from_reddit_and_metacritic()
        # Cake Bash
        game = Game.objects.get(title='Cake Bash')
        self.assertEqual(game.developers.all().count(), 1)

    def test_stadia_game_from_reddit_and_metacritic_publisher_count(self):
        self._post_stadia_game_from_reddit_and_metacritic()
        # Cake Bash
        game = Game.objects.get(title='Cake Bash')
        self.assertEqual(game.publishers.all().count(), 1)

    def test_stadia_game_from_reddit_and_metacritic_series_count(self):
        self._post_stadia_game_from_reddit_and_metacritic()
        # Cake Bash
        game = Game.objects.get(title='Cake Bash')
        self.assertEqual(game.series.all().count(), 0)

    def test_stadia_game_from_reddit_and_metacritic_modes_count(self):
        self._post_stadia_game_from_reddit_and_metacritic()
        # Cake Bash
        game = Game.objects.get(title='Cake Bash')
        self.assertEqual(game.modes.all().count(), 5)

    def test_stadia_game_from_reddit_and_metacritic_mode_exists(self):
        self._post_stadia_game_from_reddit_and_metacritic()
        # Cake Bash
        game = Game.objects.get(title='Cake Bash')
        self.assertTrue(game.modes.all().filter(name='cross platform multiplayer').exists())

    def test_stadia_game_from_reddit_and_metacritic_image_count(self):
        self._post_stadia_game_from_reddit_and_metacritic()
        # Cake Bash
        game = Game.objects.get(title='Cake Bash')
        self.assertEqual(game.images.all().count(), 1)

    def test_stadia_game_from_reddit_and_metacritic_image_exists(self):
        self._post_stadia_game_from_reddit_and_metacritic()
        # Cake Bash
        game = Game.objects.get(title='Cake Bash')
        self.assertTrue(game.images.all().filter(source_url='https://static.metacritic.com/images/products/games/2/68057d5258e1ebebe7c81cf230a7a503-98.jpg').exists())

    def test_stadia_game_from_reddit_and_metacritic_link_count(self):
        self._post_stadia_game_from_reddit_and_metacritic()
        # Cake Bash
        game = Game.objects.get(title='Cake Bash')
        self.assertEqual(len(game.links), 2)

    def test_stadia_game_from_reddit_and_metacritic_link_exists(self):
        self._post_stadia_game_from_reddit_and_metacritic()
        # Cake Bash
        game = Game.objects.get(title='Cake Bash')
        self.assertIn('stadia', game.links)
        self.assertIn('metacritic', game.links)

    def test_stadia_game_from_reddit_and_metacritic_description(self):
        self._post_stadia_game_from_reddit_and_metacritic()
        # Cake Bash
        game = Game.objects.get(title='Cake Bash')
        self.assertEqual(game.description, "Fight to be the tastiest cake! A party game for up to four players, complete with very unique hazards - bash your friends, dash away from danger and have a delicious time!")

    def _post_stadia_game_from_reddit_steam_and_metacritic(self):
        """
        Game crawled from reddit, steam, and metacritic
        """
        self._post(url=reverse('bot-stadia-game-post'),
                dataset=self._data_reddit_games,
                resp_status=status.HTTP_201_CREATED)
        self._post(url=reverse('bot-stadia-game-pro-post'),
                dataset=self._data_reddit_games_pro,
                resp_status=status.HTTP_200_OK)
        self._post(url=reverse('bot-stadia-game-stats-post'),
                dataset=self._data_reddit_game_stats,
                resp_status=status.HTTP_200_OK)
        self._post(url=reverse('bot-steampowered-stadia-game-post'),
                dataset=self._data_steampowered_games,
                resp_status=status.HTTP_200_OK)
        self._post(url=reverse('bot-metacritic-stadia-game-post'),
                dataset=self._data_metacritic_games,
                resp_status=status.HTTP_200_OK)

    def test_stadia_game_from_r_s_and_m_image_count(self):
        """
        from Reddit, Steam, and Metacritic
        """
        self._post_stadia_game_from_reddit_steam_and_metacritic()
        # Cake Bash
        game = Game.objects.get(title='Cake Bash')
        self.assertEqual(game.images.all().count(), 2)

    def test_stadia_game_from_r_s_and_m_image_exists(self):
        """
        from Reddit, Steam, and Metacritic
        """
        self._post_stadia_game_from_reddit_steam_and_metacritic()
        # Cake Bash
        game = Game.objects.get(title='Cake Bash')
        self.assertTrue(game.images.all().filter(source_url='https://cdn.cloudflare.steamstatic.com/steam/apps/971690/capsule_616x353.jpg').exists())
        self.assertTrue(game.images.all().filter(source_url='https://static.metacritic.com/images/products/games/2/68057d5258e1ebebe7c81cf230a7a503-98.jpg').exists())

    def test_stadia_game_from_r_s_and_m_link_count(self):
        """
        from Reddit, Steam, and Metacritic
        """
        self._post_stadia_game_from_reddit_steam_and_metacritic()
        # Cake Bash
        game = Game.objects.get(title='Cake Bash')
        self.assertEqual(len(game.links), 3)

    def test_stadia_game_from_r_s_and_m_link_exists(self):
        """
        from Reddit, Steam, and Metacritic
        """
        self._post_stadia_game_from_reddit_steam_and_metacritic()
        # Cake Bash
        game = Game.objects.get(title='Cake Bash')
        self.assertIn('stadia', game.links)
        self.assertIn('steampowered', game.links)
        self.assertIn('metacritic', game.links)

    def test_stadia_game_from_r_s_and_m_description(self):
        """
        from Reddit, Steam, and Metacritic
        """
        self._post_stadia_game_from_reddit_steam_and_metacritic()
        # Cake Bash
        game = Game.objects.get(title='Cake Bash')
        self.assertEqual(game.description, "Fight to be the tastiest cake in Cake Bash! A frantic four player party game where adorable drawn-to-life cakes beat the crumbs out of each other.")
