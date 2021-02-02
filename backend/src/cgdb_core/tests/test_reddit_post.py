import datetime
import os
import json
import logging
from pathlib import Path
from django.urls import include, path, reverse
from rest_framework import status
from rest_framework.test import APITestCase, URLPatternsTestCase
from cgdb_core.models import Game, GameFreeOnSubscription

logger = logging.getLogger(__name__)

class RedditPostTests(APITestCase, URLPatternsTestCase):
    urlpatterns = [
        path('api/', include('cgdb_core.urls')),
    ]

    @classmethod
    def setUpTestData(cls):
        content_games = Path(f'{os.path.splitext(os.path.abspath(__file__))[0]}_games_data.json').read_text()
        content_pro_games = Path(f'{os.path.splitext(os.path.abspath(__file__))[0]}_pro_games_data.json').read_text()
        cls.test_games_data = json.loads(content_games)
        cls.test_pro_games_data = json.loads(content_pro_games)

    def _post_stadia_games(self, resp_status=0):
        url = reverse('bot-stadia-game-post')
        for data in self.test_games_data:
            response = self.client.post(url, data, format='json')
            self.assertEqual(response.status_code, resp_status)
        self.assertEqual(Game.objects.count(), 141)

    def _post_stadia_pro_games(self, resp_status=0):
        url = reverse('bot-stadia-game-pro-post')
        for data in self.test_pro_games_data:
            response = self.client.post(url, data, format='json')
            if response.status_code != resp_status:
                print(response.content)
            self.assertEqual(response.status_code, resp_status)
        self.assertEqual(GameFreeOnSubscription.objects.count(), 69)

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
