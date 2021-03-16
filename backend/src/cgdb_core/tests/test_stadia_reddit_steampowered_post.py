import os
import json
from pathlib import Path
from django.urls import include, path, reverse
from django.contrib.auth import get_user_model
from rest_framework import status
from rest_framework.test import APITestCase, URLPatternsTestCase, APIClient
from cgdb_core.models import Game

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
        cls._data_wikipedia_games = _json.get('wikipedia_games')
        cls._data_steampowered_games = _json.get('steampowered_games')
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
        url = reverse('bot-wikipedia-stadia-game-post')
        response = self.client.post(url, data={}, format='json')
        self.assertEqual(response.status_code, status.HTTP_401_UNAUTHORIZED)
        url = reverse('bot-steampowered-stadia-game-post')
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

    def _post_steampowered_game(self, resp_status=0):
        url = reverse('bot-steampowered-stadia-game-post')
        # force authenticate
        self.client = APIClient()
        self.client.force_authenticate(user=self.testuser)
        for data in self._data_steampowered_games:
            response = self.client.post(url, data, format='json')
            if response.status_code != resp_status:
                print(response.content)
            self.assertEqual(response.status_code, resp_status)

    def test_post_reddit_data_steampowered_data(self):
        self._post_stadia_games(status.HTTP_201_CREATED)
        self._post_stadia_pro_games(status.HTTP_200_OK)
        self._post_stadia_game_stats(status.HTTP_200_OK)
        self._post_wikipedia_game(status.HTTP_201_CREATED)
        self._post_steampowered_game(status.HTTP_200_OK)

        # Cake Bash
        game = Game.objects.get(title='Cake Bash')
        self.assertEqual(game.genres.all().count(), 3)
        self.assertTrue(game.genres.all().filter(name='party').exists())
        self.assertTrue(game.genres.all().filter(name='kids & family').exists())
        self.assertTrue(game.genres.all().filter(name='indie').exists())
        self.assertFalse(game.genres.all().filter(name='action').exists())
        self.assertFalse(game.genres.all().filter(name='casual').exists())
        self.assertEqual(game.developers.all().count(), 1)
        self.assertTrue(game.developers.all().filter(name='High Tea Frog').exists())
        self.assertEqual(game.publishers.all().count(), 1)
        self.assertTrue(game.publishers.all().filter(name='Coatsink').exists())
        self.assertEqual(game.series.all().count(), 0)
        self.assertEqual(game.modes.all().count(), 5)
        self.assertTrue(game.modes.all().filter(name='cross platform multiplayer').exists())
        self.assertEqual(len(game.pictures), 1)
        self.assertIn('https://cdn.cloudflare.steamstatic.com/steam/apps/971690/capsule_616x353.jpg', game.pictures)
        self.assertEqual(len(game.links), 2)
        self.assertIn('stadia', game.links)
        self.assertIn('steampowered', game.links)
        self.assertEqual(game.description, "Fight to be the tastiest cake in Cake Bash! A frantic four player party game where adorable drawn-to-life cakes beat the crumbs out of each other.")

        # Assassin's Creed Syndicate
        game = Game.objects.get(title="Assassin's Creed Syndicate")
        self.assertEqual(len(game.pictures), 1)
        self.assertEqual(game.description, "London, 1868. In the heart of the Industrial Revolution, lead your underworld organization and grow your influence to fight those who exploit the less privileged in the name of...")
        self.assertEqual(game.genres.all().count(), 2)
        self.assertTrue(game.genres.all().filter(name='action').exists())
        self.assertTrue(game.genres.all().filter(name='adventure').exists())
        self.assertEqual(game.developers.all().count(), 1)
        self.assertTrue(game.developers.all().filter(name='Ubisoft').exists())
        self.assertEqual(game.publishers.all().count(), 1)
        self.assertTrue(game.publishers.all().filter(name='Ubisoft').exists())
        self.assertEqual(game.series.all().count(), 0)
        self.assertEqual(len(game.links), 2)
        self.assertIn('stadia', game.links)
        self.assertIn('steampowered', game.links)
        self.assertEqual(len(game.pictures), 1)
        self.assertIn('https://cdn.akamai.steamstatic.com/steam/apps/368500/capsule_616x353.jpg', game.pictures)

        # Dirt 5
        # Dirt 5 titls should not be changed to DIRT 5 even after updated
        # with steampowered data
        with self.assertRaises(Game.DoesNotExist) as context:
            Game.objects.get(title='DIRT 5')
        game = Game.objects.get(title='Dirt 5')
        self.assertEqual(game.description, "DIRT 5 is a fun, amplified, off-road arcade racing experience created by Codemasters. Blaze a trail on routes across the world, covering gravel, ice, snow and sand, with a roster of cars ranging from rally icons to trucks, to GT heroes.")
        self.assertEqual(len(game.pictures), 2)
        self.assertIn('https://upload.wikimedia.org/wikipedia/en/2/2d/Dirt_5_cover_art.jpg', game.pictures)
        self.assertIn('https://cdn.cloudflare.steamstatic.com/steam/apps/1038250/capsule_616x353.jpg', game.pictures)
        self.assertEqual(len(game.links), 11)
        self.assertIn('wikipedia_en', game.links)
        self.assertIn('steampowered', game.links)
        self.assertEqual(game.developers.all().count(), 0)
        self.assertFalse(game.developers.all().filter(name='Codemasters Cheshire').exists())
        self.assertFalse(game.developers.all().filter(name='Codemasters').exists())
        self.assertEqual(game.publishers.all().count(), 0)
        self.assertFalse(game.publishers.all().filter(name='Codemasters').exists())
        self.assertEqual(game.series.all().count(), 1)
        self.assertFalse(game.series.all().filter(name='Codemasters').exists())
        self.assertTrue(game.series.all().filter(name='Dirt').exists())
