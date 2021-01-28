import datetime
import os
import json
import logging
from pathlib import Path
from django.urls import include, path, reverse
from rest_framework import status
from rest_framework.test import APITestCase, URLPatternsTestCase
from cgdb_core.models import Game, GameReleaseDate
from cgdb_core.serializers import RedditStadiaGameSerializer

logger = logging.getLogger(__name__)

class RedditPostTests(APITestCase, URLPatternsTestCase):
    urlpatterns = [
        path('api/', include('cgdb_core.urls')),
    ]

    @classmethod
    def setUpTestData(cls):
        content = Path(f'{os.path.splitext(os.path.abspath(__file__))[0]}_data.json').read_text()
        cls.test_data = json.loads(content)

    def test_post_data_and_count(self):
        """
        Check initial data
        """
        url = reverse('bot-stadia-game-post')
        for data in self.test_data:
            response = self.client.post(url, data, format='json')
            self.assertEqual(response.status_code, status.HTTP_201_CREATED)
        self.assertEqual(Game.objects.count(), 137)
        game = Game.objects.get(title='FINAL FANTASY XV')
        for game_release in game.game_release_dates.all():
            self.assertEqual(game_release.release_date, datetime.datetime.strptime('2019 Nov 19', '%Y %b %d').date())
            break
