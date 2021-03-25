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
        cls.test_data_1 = _json.get('data_1')
        cls.test_data_2 = _json.get('data_2')
        cls.test_data_3 = _json.get('data_3')
        cls.test_data_4 = _json.get('data_4')
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
        url = reverse('bot-wikipedia-game-post')
        response = self.client.post(url, data={}, format='json')
        self.assertEqual(response.status_code, status.HTTP_401_UNAUTHORIZED)

    def test_single_post_create(self):
        """
        Single wiki game artlcle post, and create in db
        """
        url = reverse('bot-wikipedia-game-post')
        # force authenticate
        self.client = APIClient()
        self.client.force_authenticate(user=self.testuser)
        response = self.client.post(url, self.test_data_1, format='json')
        self.assertEqual(response.status_code, status.HTTP_201_CREATED)
        self.assertEqual(Game.objects.count(), 1)
        # assert game details
        game = Game.objects.get()
        self.assertEqual(game.title, 'A Plague Tale: Innocence')
        self.assertEqual(len(game.title_lc), 18)
        self.assertEqual(game.title_lc.get('en'), 'A Plague Tale: Innocence')
        self.assertEqual(game.title_lc.get('ko'), '플래그 테일: 이노센스')
        self.assertEqual(len(game.pictures), 1)
        self.assertEqual(game.pictures[0],
                        "https://upload.wikimedia.org/wikipedia/en/1/1d/A_Plague_Tale_cover_art.jpg")
        self.assertEqual(game.images.count(), 1)
        self.assertEqual(game.images.filter(source_url='https://upload.wikimedia.org/wikipedia/en/1/1d/A_Plague_Tale_cover_art.jpg').exists(), True)
        self.assertEqual(len(game.links), 18)
        self.assertEqual(game.links.get('wikipedia_en'),
                        'https://en.wikipedia.org/wiki/A_Plague_Tale:_Innocence')
        self.assertEqual(game.links.get('wikipedia_ko'),
                        'https://ko.wikipedia.org/wiki/%ED%94%8C%EB%9E%98%EA%B7%B8_%ED%85%8C%EC%9D%BC:_%EC%9D%B4%EB%85%B8%EC%84%BC%EC%8A%A4')
        self.assertEqual(game.developers.count(), 1)
        self.assertEqual(game.developers.get().name, 'Asobo Studio')
        self.assertEqual(game.publishers.count(), 1)
        self.assertEqual(game.publishers.get().name, 'Focus Home Interactive')
        self.assertEqual(game.series.count(), 0)
        self.assertEqual(game.platforms.count(), 1)
        self.assertEqual(game.platforms.get().name, 'Xbox Game Pass')
        self.assertEqual(game.genres.count(), 3)
        self.assertEqual(game.genres.filter(name='stealth').exists(), True)
        self.assertEqual(game.modes.count(), 1)
        self.assertEqual(game.modes.get().name, 'single-player')
        self.assertEqual(game.tags.count(), 9)

    def test_single_post_update(self):
        """
        Single wiki game artlcle post, and update in db
        """
        url = reverse('bot-wikipedia-game-post')
        # force authenticate
        self.client = APIClient()
        self.client.force_authenticate(user=self.testuser)
        response_create = self.client.post(url, self.test_data_1, format='json')
        self.assertEqual(response_create.status_code, status.HTTP_201_CREATED)
        response_update = self.client.post(url, self.test_data_1, format='json')
        self.assertEqual(response_update.status_code, status.HTTP_200_OK)
        self.assertEqual(Game.objects.count(), 1)
        # assert game details
        game = Game.objects.get()
        self.assertEqual(game.title, 'A Plague Tale: Innocence')
        self.assertEqual(len(game.title_lc), 18)
        self.assertEqual(game.title_lc.get('en'), 'A Plague Tale: Innocence')
        self.assertEqual(game.title_lc.get('ko'), '플래그 테일: 이노센스')
        self.assertEqual(len(game.pictures), 1)
        self.assertEqual(game.pictures[0],
                        "https://upload.wikimedia.org/wikipedia/en/1/1d/A_Plague_Tale_cover_art.jpg")
        self.assertEqual(game.images.count(), 1)
        self.assertEqual(game.images.filter(source_url='https://upload.wikimedia.org/wikipedia/en/1/1d/A_Plague_Tale_cover_art.jpg').exists(), True)
        self.assertEqual(len(game.links), 18)
        self.assertEqual(game.links.get('wikipedia_en'),
                        'https://en.wikipedia.org/wiki/A_Plague_Tale:_Innocence')
        self.assertEqual(game.links.get('wikipedia_ko'),
                        'https://ko.wikipedia.org/wiki/%ED%94%8C%EB%9E%98%EA%B7%B8_%ED%85%8C%EC%9D%BC:_%EC%9D%B4%EB%85%B8%EC%84%BC%EC%8A%A4')
        self.assertEqual(game.developers.count(), 1)
        self.assertEqual(game.developers.get().name, 'Asobo Studio')
        self.assertEqual(game.publishers.count(), 1)
        self.assertEqual(game.publishers.get().name, 'Focus Home Interactive')
        self.assertEqual(game.series.count(), 0)
        self.assertEqual(game.platforms.count(), 1)
        self.assertEqual(game.platforms.get().name, 'Xbox Game Pass')
        self.assertEqual(game.genres.count(), 3)
        self.assertEqual(game.genres.filter(name='stealth').exists(), True)
        self.assertEqual(game.modes.count(), 1)
        self.assertEqual(game.modes.get().name, 'single-player')
        self.assertEqual(game.tags.count(), 9)
        
    def test_multiple_posts(self):
        url = reverse('bot-wikipedia-game-post')
        # force authenticate
        self.client = APIClient()
        self.client.force_authenticate(user=self.testuser)
        resp = self.client.post(url, self.test_data_1, format='json')
        self.assertEqual(resp.status_code, status.HTTP_201_CREATED)
        resp = self.client.post(url, self.test_data_2, format='json')
        self.assertEqual(resp.status_code, status.HTTP_201_CREATED)
        resp = self.client.post(url, self.test_data_3, format='json')
        self.assertEqual(resp.status_code, status.HTTP_201_CREATED)
        resp = self.client.post(url, self.test_data_4, format='json')
        self.assertEqual(resp.status_code, status.HTTP_201_CREATED)
