import os
import json
import logging
from pathlib import Path
from django.urls import include, path, reverse
from django.db import transaction, IntegrityError
from rest_framework import status
from rest_framework.test import APITestCase, URLPatternsTestCase
from cgdb_core.models import Game, Tag
from cgdb_core.serializers import GameSerializer

logger = logging.getLogger(__name__)

class SearchTests(APITestCase, URLPatternsTestCase):
    urlpatterns = [
        path('api/', include('cgdb_core.urls')),
    ]

    @classmethod
    def setUpTestData(cls):
        content = Path(f'{os.path.splitext(os.path.abspath(__file__))[0]}_data.json').read_text()
        test_data = json.loads(content)
        for _data in test_data:
            try:
                game = Game.objects.get(title=_data.get('english_title'))
                serializer = GameSerializer(game, data=_data)
            except Game.DoesNotExist:
                serializer = GameSerializer(data=_data)
            if not serializer.is_valid():
                continue
            try:
                with transaction.atomic():
                    serializer.save()
            except IntegrityError as err:
                logger.error(str(err))

    def test_initial_data(self):
        """
        Check initial data
        """
        self.assertEqual(Game.objects.count(), 11)
        self.assertEqual(Tag.objects.count(), 50)

    def test_search_game_by_english_title(self):
        url = reverse('search', kwargs={'term': 'ark'})
        response = self.client.get(url)
        self.assertEqual(response.status_code, status.HTTP_200_OK)
        self.assertEqual(response.data[0].get('title'), 'Ark: Survival Evolved')
        self.assertEqual(len(response.data[0].get('platforms')), 1)
        self.assertEqual(response.data[0].get('platforms')[0].get('name'), 'xCloud')

    def test_search_game_by_korean_title(self):
        url = reverse('search', kwargs={'term': '트로니어'})
        response = self.client.get(url)
        self.assertEqual(response.status_code, status.HTTP_200_OK)
        self.assertEqual(response.data[0].get('title'), 'Astroneer')
        self.assertEqual(len(response.data[0].get('platforms')), 1)
        self.assertEqual(response.data[0].get('platforms')[0].get('name'), 'xCloud')
