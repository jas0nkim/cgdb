import datetime
import os
import json
import logging
from pathlib import Path
from django.urls import include, path, reverse
from django.contrib.auth import get_user_model
from rest_framework import status
from rest_framework.test import APITestCase, URLPatternsTestCase, APIClient
from cgdb_core.models import Developer, Game, GameFreeOnSubscription, Genre, Mode, Publisher

logger = logging.getLogger(__name__)

class RedditPostTests(APITestCase, URLPatternsTestCase):
    urlpatterns = [
        path('api/', include('cgdb_core.urls')),
    ]

    @classmethod
    def setUpTestData(cls):
        cls._data_games = json.loads(Path(f'{os.path.splitext(os.path.abspath(__file__))[0]}_games_data.json').read_text())
        cls._data_pro_games = json.loads(Path(f'{os.path.splitext(os.path.abspath(__file__))[0]}_pro_games_data.json').read_text())
        cls._data_ratings = json.loads(Path(f'{os.path.splitext(os.path.abspath(__file__))[0]}_ratings_data.json').read_text())
        cls._data_genres = json.loads(Path(f'{os.path.splitext(os.path.abspath(__file__))[0]}_genres_data.json').read_text())
        cls._data_developers = json.loads(Path(f'{os.path.splitext(os.path.abspath(__file__))[0]}_developers_data.json').read_text())
        cls._data_publishers = json.loads(Path(f'{os.path.splitext(os.path.abspath(__file__))[0]}_publishers_data.json').read_text())
        cls._data_modes = json.loads(Path(f'{os.path.splitext(os.path.abspath(__file__))[0]}_modes_data.json').read_text())
        cls.testuser = get_user_model().objects.create_user(username='testuser', password='12345')

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

    def _post_stadia_games(self, resp_status=0):
        url = reverse('bot-stadia-game-post')
        # force authenticate
        self.client = APIClient()
        self.client.force_authenticate(user=self.testuser)
        for data in self._data_games:
            response = self.client.post(url, data, format='json')
            if response.status_code != resp_status:
                print(response.content)
            self.assertEqual(response.status_code, resp_status)
        self.assertEqual(Game.objects.count(), 142)

    def _post_stadia_pro_games(self, resp_status=0):
        url = reverse('bot-stadia-game-pro-post')
        # force authenticate
        self.client = APIClient()
        self.client.force_authenticate(user=self.testuser)
        for data in self._data_pro_games:
            response = self.client.post(url, data, format='json')
            if response.status_code != resp_status:
                print(response.content)
            self.assertEqual(response.status_code, resp_status)
        self.assertEqual(GameFreeOnSubscription.objects.count(), 69)

    def _post_stadia_game_stats(self, resp_status=0):
        url = reverse('bot-stadia-game-stats-post')
        # force authenticate
        self.client = APIClient()
        self.client.force_authenticate(user=self.testuser)
        for data in self._data_ratings:
            response = self.client.post(url, data, format='json')
            if response.status_code != resp_status:
                print(response.content)
            self.assertEqual(response.status_code, resp_status)
        for data in self._data_genres:
            response = self.client.post(url, data, format='json')
            if response.status_code != resp_status:
                print(response.content)
            self.assertEqual(response.status_code, resp_status)
        for data in self._data_developers:
            response = self.client.post(url, data, format='json')
            if response.status_code != resp_status:
                print(response.content)
            self.assertEqual(response.status_code, resp_status)
        for data in self._data_publishers:
            response = self.client.post(url, data, format='json')
            if response.status_code != resp_status:
                print(response.content)
            self.assertEqual(response.status_code, resp_status)
        for data in self._data_modes:
            response = self.client.post(url, data, format='json')
            if response.status_code != resp_status:
                print(response.content)
            self.assertEqual(response.status_code, resp_status)
        self.assertEqual(Game.objects.count(), 142)

    def test_post_stadia_games_data_and_count(self):
        """
        Check initial stadia games
        """
        self._post_stadia_games(status.HTTP_201_CREATED)
        game = Game.objects.get(title='FINAL FANTASY XV')
        for game_release in game.game_release_dates.all():
            self.assertEqual(game_release.release_date, datetime.datetime.strptime('2019 Nov 19', '%Y %b %d').date())
            break

    def test_post_stadia_games_data_multiple_times(self):
        """
        Post same stadia games multiple times
        """
        self._post_stadia_games(status.HTTP_201_CREATED)
        self._post_stadia_games(status.HTTP_200_OK)
        game = Game.objects.get(title='FINAL FANTASY XV')
        for game_release in game.game_release_dates.all():
            self.assertEqual(game_release.release_date, datetime.datetime.strptime('2019 Nov 19', '%Y %b %d').date())
            break

    def test_post_stadia_games_with_pro_subs(self):
        """
        Post stadia games + pro games
        """
        self._post_stadia_games(status.HTTP_201_CREATED)
        self._post_stadia_pro_games(status.HTTP_200_OK)

    def test_post_same_stadia_games_pro_twice(self):
        """
        Post stadia games + pro games
        """
        self._post_stadia_games(status.HTTP_201_CREATED)
        self._post_stadia_pro_games(status.HTTP_200_OK)
        self._post_stadia_pro_games(status.HTTP_200_OK)

    def test_post_stadia_games_with_pro_subs_and_stats(self):
        """
        Post stadia games + pro games + stats (ratings)
        """
        self._post_stadia_games(status.HTTP_201_CREATED)
        self._post_stadia_pro_games(status.HTTP_200_OK)
        self._post_stadia_game_stats(status.HTTP_200_OK)
        game = Game.objects.get(title='FINAL FANTASY XV', platforms__name='Stadia')
        self.assertEqual(game.esrb, 'T')
        self.assertTrue(game.genres.all().filter(name='Role-playing game').exists())
        self.assertTrue(game.developers.all().filter(name='Square Enix Japan').exists())
        self.assertTrue(game.publishers.all().filter(name='Square Enix').exists())
        self.assertTrue(game.modes.all().filter(name='Online multiplayer').exists())
        self.assertTrue(game.modes.all().filter(name='Single player').exists())
        self.assertTrue(game.modes.all().filter(name='Online co-op').exists())
        self.assertEqual(game.modes.all().count(), 3)
        game = Game.objects.get(title='Farming Simulator 19', platforms__name='Stadia')
        self.assertEqual(game.esrb, 'E')
        self.assertTrue(game.genres.all().filter(name='Simulator').exists())
        self.assertTrue(game.genres.all().filter(name='Simulation').exists())
        self.assertTrue(game.developers.all().filter(name='GIANTS Software').exists())
        self.assertFalse(game.publishers.all().exists())
        self.assertTrue(game.modes.all().filter(name='Cross platform multiplayer').exists())
        self.assertTrue(game.modes.all().filter(name='Online multiplayer').exists())
        self.assertTrue(game.modes.all().filter(name='Single player').exists())
        self.assertEqual(game.modes.all().count(), 3)
        game = Game.objects.get(title='DOOM 64', platforms__name='Stadia')
        self.assertTrue(game.publishers.all().filter(name='Bethesda Softworks').exists())
        self.assertTrue(game.modes.all().filter(name='Single player').exists())
        self.assertEqual(game.modes.all().count(), 1)
        # modes
        modes = Mode.objects.all()
        self.assertEqual(modes.count(), 8)
        # genres
        genres = Genre.objects.all()
        self.assertEqual(genres.count(), 18)
        # publishers
        publishers = Publisher.objects.all()
        self.assertEqual(publishers.count(), 55)
        # developers
        developers = Developer.objects.all()
        self.assertEqual(developers.count(), 59)
