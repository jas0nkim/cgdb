import datetime
import os
import json
from pathlib import Path
from django.urls import include, path, reverse
from django.contrib.auth import get_user_model
from rest_framework import status
from rest_framework.test import APITestCase, URLPatternsTestCase, APIClient
from cgdb_core.models import Game, Image
from cgdb_core import utils

class WikipediaPostTests(APITestCase, URLPatternsTestCase):
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
        cls._data_wikipedia_games = _json.get('wikipedia_games')
        cls.testuser = get_user_model().objects.create_user(username='testuser', password='12345')

    def tearDown(self):
        """
        Delete all images uploaded to s3 during this test
        """
        for image in Image.objects.all():
            utils.delete_from_s3(image.s3_url)

    def test_auth(self):
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
        url = reverse('bot-wikipedia-stadia-game-post')
        response = self.client.post(url, data={}, format='json')
        self.assertEqual(response.status_code, status.HTTP_401_UNAUTHORIZED)

    def _post_stadia_games(self, resp_status=0):
        url = reverse('bot-stadia-game-post')
        # force authenticate
        self.client = APIClient()
        self.client.force_authenticate(user=self.testuser)
        for data in self._data_reddit_games:
            response = self.client.post(url, data, format='json')
            if response.status_code != resp_status:
                print(response.content)
            self.assertEqual(response.status_code, resp_status)

    def _post_stadia_pro_games(self, resp_status=0):
        url = reverse('bot-stadia-game-pro-post')
        # force authenticate
        self.client = APIClient()
        self.client.force_authenticate(user=self.testuser)
        for data in self._data_reddit_games_pro:
            response = self.client.post(url, data, format='json')
            if response.status_code != resp_status:
                print(response.content)
            self.assertEqual(response.status_code, resp_status)

    def _post_stadia_game_stats(self, resp_status=0):
        url = reverse('bot-stadia-game-stats-post')
        # force authenticate
        self.client = APIClient()
        self.client.force_authenticate(user=self.testuser)
        for data in self._data_reddit_game_stats:
            response = self.client.post(url, data, format='json')
            if response.status_code != resp_status:
                print(response.content)
            self.assertEqual(response.status_code, resp_status)

    def _post_wikipedia_game(self, resp_status=0):
        url = reverse('bot-wikipedia-stadia-game-post')
        # force authenticate
        self.client = APIClient()
        self.client.force_authenticate(user=self.testuser)
        for data in self._data_wikipedia_games:
            response = self.client.post(url, data, format='json')
            if response.status_code != resp_status:
                print(response.content)
            self.assertEqual(response.status_code, resp_status)

    def test_post_reddit_data(self):
        """
        Check stadia games after processing reddit data
        """
        self._post_stadia_games(status.HTTP_201_CREATED)
        self._post_stadia_pro_games(status.HTTP_200_OK)
        self._post_stadia_game_stats(status.HTTP_200_OK)
        game = Game.objects.get(title='Destiny 2')
        for game_release in game.game_release_dates.all():
            self.assertEqual(game_release.release_date, datetime.datetime.strptime('2019 Nov 19', '%Y %b %d').date())
        self.assertEqual(game.esrb, 'T')
        self.assertEqual(game.genres.all().count(), 3)
        self.assertTrue(game.genres.all().filter(name='action').exists())
        self.assertTrue(game.genres.all().filter(name='adventure').exists())
        self.assertTrue(game.genres.all().filter(name='shooter').exists())
        self.assertEqual(game.modes.all().count(), 4)
        self.assertTrue(game.modes.all().filter(name='competitive').exists())
        self.assertTrue(game.modes.all().filter(name='online multiplayer').exists())
        self.assertTrue(game.modes.all().filter(name='single player').exists())
        self.assertTrue(game.modes.all().filter(name='online co-op').exists())
        self.assertEqual(game.developers.all().count(), 1)
        self.assertTrue(game.developers.all().filter(name='Bungie').exists())
        self.assertEqual(game.publishers.all().count(), 1)
        self.assertTrue(game.publishers.all().filter(name='Bungie').exists())
        self.assertEqual(game.platforms.all().count(), 1)
        self.assertTrue(game.platforms.all().filter(name='Stadia').exists())

    def test_post_reddit_data_wikipedia_data(self):
        """
        Check stadia games after processing reddit data
        """
        self._post_stadia_games(status.HTTP_201_CREATED)
        self._post_stadia_pro_games(status.HTTP_200_OK)
        self._post_stadia_game_stats(status.HTTP_200_OK)
        self._post_wikipedia_game(status.HTTP_200_OK)
        game = Game.objects.get(title='Destiny 2')
        for game_release in game.game_release_dates.all():
            self.assertEqual(game_release.release_date, datetime.datetime.strptime('2019 Nov 19', '%Y %b %d').date())
        self.assertEqual(game.esrb, 'T')
        self.assertEqual(game.genres.all().count(), 3)
        self.assertTrue(game.genres.all().filter(name='action').exists())
        self.assertTrue(game.genres.all().filter(name='adventure').exists())
        self.assertTrue(game.genres.all().filter(name='shooter').exists())
        self.assertFalse(game.genres.all().filter(name='first-person shooter').exists())
        self.assertEqual(game.modes.all().count(), 4)
        self.assertTrue(game.modes.all().filter(name='competitive').exists())
        self.assertTrue(game.modes.all().filter(name='online multiplayer').exists())
        self.assertTrue(game.modes.all().filter(name='single player').exists())
        self.assertTrue(game.modes.all().filter(name='online co-op').exists())
        self.assertFalse(game.modes.all().filter(name='multiplayer').exists())
        self.assertEqual(game.developers.all().count(), 1)
        self.assertTrue(game.developers.all().filter(name='Bungie').exists())
        self.assertEqual(game.publishers.all().count(), 1)
        self.assertTrue(game.publishers.all().filter(name='Bungie').exists())
        self.assertFalse(game.publishers.all().filter(name='Activision').exists())
        self.assertEqual(game.platforms.all().count(), 1)
        self.assertTrue(game.platforms.all().filter(name='Stadia').exists())
        self.assertEqual(len(game.pictures), 1)
        self.assertIn('https://upload.wikimedia.org/wikipedia/en/0/05/Destiny_2_%28artwork%29.jpg', game.pictures)
        self.assertEqual(game.images.all().count(), 1)
        self.assertTrue(game.images.all().filter(source_url='https://upload.wikimedia.org/wikipedia/en/0/05/Destiny_2_%28artwork%29.jpg').exists())
        self.assertEqual(len(game.links), 19)
        self.assertIn('wikipedia_en', game.links)
        self.assertIn('stadia', game.links)
