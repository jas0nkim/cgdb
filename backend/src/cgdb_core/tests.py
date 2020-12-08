from django.test import TestCase
from django.urls import include, path, reverse
from rest_framework import status
from rest_framework.test import (APITestCase,
                                URLPatternsTestCase,
                                APIClient)
from .models import (Mode,
                    Genre,
                    Series,
                    Publisher,
                    Developer,
                    Platform,
                    Game)

class CoreRetrieveTests(APITestCase, URLPatternsTestCase):
    urlpatterns = [
        path('api/', include('cgdb_core.urls')),
    ]

    def setUp(self):
        """
        Create games, platforms, and others
        """
        mode1 = Mode.objects.create(name="single-player")
        genre1 = Genre.objects.create(name="action-adventure")
        genre2 = Genre.objects.create(name="stealth")
        genre3 = Genre.objects.create(name="survival horror")
        publisher1 = Publisher.objects.create(name="Focus Home Interactive",
                                            description="Focus Home Interactive description",
                                            pictures=[{"high": "https://upload.wikimedia.org/wikipedia/en/7/79/Focus_Home_Interactive_logo_vectoriel.svg"}])
        developer1 = Developer.objects.create(name="Asobo Studio",
                                            description="Asobo Studio description",
                                            pictures=[{"low":"https://en.wikipedia.org/wiki/Asobo_Studio#/media/File:Asobo-logo-gif-300x115.png"}])
        platform1 = Platform.objects.create(name="Xbox Game Pass",
                                            description="Xbox Game Pass description",
                                            pictures={"high": "https://upload.wikimedia.org/wikipedia/commons/8/8c/XBOX_logo_2012.svg"})
        game1 = Game.objects.create(title="A Plague Tale: Innocence",
                                    description="A Plague Tale: Innocence description",
                                    pictures=[{"low":"https://upload.wikimedia.org/wikipedia/en/1/1d/A_Plague_Tale_cover_art.jpg"}],
                                    links={"wikipedia": "https://en.wikipedia.org/wiki/A_Plague_Tale:_Innocence"})
        game1.developers.add(developer1)
        game1.publishers.add(publisher1)
        game1.platforms.add(platform1)
        game1.genres.add(genre1)
        game1.genres.add(genre2)
        game1.genres.add(genre3)
        game1.modes.add(mode1)

    def test_001_retrieve_platform_list(self):
        """
        Test 001:
        retrieve all platforms
        """
        url = reverse('platform-list')
        response = self.client.get(url)
        self.assertEqual(response.status_code, status.HTTP_200_OK)

    def test_002_retrieve_platform_detail(self):
        """
        Test 002:
        retrieve single platform
        """
        url = reverse('platform-detail', args = ('xbox-game-pass',))
        response = self.client.get(url)
        self.assertEqual(response.status_code, status.HTTP_200_OK)

    def test_003_retrieve_games(self):
        """
        Test 003:
        retrieve all games
        """
        url = reverse('game-list')
        response = self.client.get(url)
        self.assertEqual(response.status_code, status.HTTP_200_OK)

    def test_004_retrieve_game_detail(self):
        """
        Test 004:
        retrieve single game
        """
        url = reverse('game-detail', kwargs={'slug': 'a-plague-tale-innocence'})
        response = self.client.get(url)
        self.assertEqual(response.status_code, status.HTTP_200_OK)
