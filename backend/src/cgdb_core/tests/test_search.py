import os
import json
import logging
from pathlib import Path
from django.urls import include, path, reverse
from rest_framework import status
from rest_framework.test import APITestCase, URLPatternsTestCase
from cgdb_core.models import Game, Tag, Image
from cgdb_core.serializers import WikipediaGameSerializer
from cgdb_core import utils

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
                serializer = WikipediaGameSerializer(game, data=_data)
            except Game.DoesNotExist:
                serializer = WikipediaGameSerializer(data=_data)
            if not serializer.is_valid():
                logger.error(serializer.errors)
                continue
            serializer.save()

    def setUp(self):
        # reset all games inactive
        Game.objects.all().update(active=False)

    def tearDown(self):
        """
        Delete all images uploaded to s3 during this test
        """
        for image in Image.objects.all():
            utils.delete_from_s3(image.s3_url)

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
        self.assertEqual(len(response.data), 0)
        # set all games active
        Game.objects.all().update(active=True)
        response = self.client.get(url)
        self.assertEqual(response.status_code, status.HTTP_200_OK)
        self.assertEqual(len(response.data), 2)
        self.assertEqual(response.data[0].get('title'), 'Ark: Survival Evolved')
        self.assertEqual(len(response.data[0].get('platforms')), 1)
        self.assertEqual(response.data[0].get('platforms')[0].get('name'), 'Xbox Game Pass')

    def test_search_game_by_korean_title(self):
        # set all games active
        Game.objects.all().update(active=True)
        url = reverse('search', kwargs={'term': '트로니어'})
        response = self.client.get(url)
        self.assertEqual(response.status_code, status.HTTP_200_OK)
        self.assertEqual(len(response.data), 1)
        self.assertEqual(response.data[0].get('title'), 'Astroneer')
        self.assertEqual(len(response.data[0].get('platforms')), 1)
        self.assertEqual(response.data[0].get('platforms')[0].get('name'), 'Xbox Game Pass')

    def test_search_game_by_english_title_with_wrong_order_like_google_search(self):
        # set all games active
        Game.objects.all().update(active=True)
        url = reverse('search', kwargs={'term': 'witch blair'})
        response = self.client.get(url)
        self.assertEqual(response.status_code, status.HTTP_200_OK)
        self.assertEqual(len(response.data), 1)
        self.assertEqual(response.data[0].get('title'), 'Blair Witch')
        self.assertEqual(len(response.data[0].get('platforms')), 1)
        self.assertEqual(response.data[0].get('platforms')[0].get('name'), 'Xbox Game Pass')
