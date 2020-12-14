from django.urls import include, path, reverse
from rest_framework import status
from rest_framework.test import APITestCase, URLPatternsTestCase
from cgdb_core.models import (Mode,
                    Genre,
                    Series,
                    Publisher,
                    Developer,
                    Platform,
                    Game)

class RetrieveTests(APITestCase, URLPatternsTestCase):
    urlpatterns = [
        path('api/', include('cgdb_core.urls')),
    ]

    def setUp(self):
        """
        Create games, platforms, and others
        """
        self.mode1 = Mode.objects.create(name="single-player")
        self.genre1 = Genre.objects.create(name="action-adventure")
        self.genre2 = Genre.objects.create(name="stealth")
        self.genre3 = Genre.objects.create(name="survival horror")
        self.publisher1 = Publisher.objects.create(name="Focus Home Interactive",
                                            description="Focus Home Interactive description",
                                            pictures=["https://upload.wikimedia.org/wikipedia/en/7/79/Focus_Home_Interactive_logo_vectoriel.svg"])
        self.developer1 = Developer.objects.create(name="Asobo Studio",
                                            description="Asobo Studio description",
                                            pictures=["https://en.wikipedia.org/wiki/Asobo_Studio#/media/File:Asobo-logo-gif-300x115.png"])
        self.platform1 = Platform.objects.create(name="Xbox Game Pass",
                                            description="Xbox Game Pass description",
                                            pictures=["https://upload.wikimedia.org/wikipedia/commons/8/8c/XBOX_logo_2012.svg"])
        self.game1 = Game.objects.create(title="A Plague Tale: Innocence",
                                    title_lc={"en":"A Plague Tale: Innocence","ko":"플래그 테일: 이노센스"},
                                    description="A Plague Tale: Innocence description",
                                    description_lc={"en":"A Plague Tale: Innocence description","ko":"플래그 테일: 이노센스 내용"},
                                    pictures=["https://upload.wikimedia.org/wikipedia/en/1/1d/A_Plague_Tale_cover_art.jpg"],
                                    links={"wikipedia": "https://en.wikipedia.org/wiki/A_Plague_Tale:_Innocence"})
        self.game1.developers.add(self.developer1)
        self.game1.publishers.add(self.publisher1)
        self.game1.platforms.add(self.platform1)
        self.game1.genres.add(self.genre1)
        self.game1.genres.add(self.genre2)
        self.game1.genres.add(self.genre3)
        self.game1.modes.add(self.mode1)

    def test_mode_slug_generated(self):
        """
        Mode slug has been generated correctly?
        """
        self.assertEqual(self.mode1.slug, "single-player")

    def test_genre_slug_generated(self):
        """
        Genre slug has been generated correctly?
        """
        self.assertEqual(self.genre3.slug, "survival-horror")

    def test_publisher_slug_generated(self):
        """
        Publisher slug has been generated correctly?
        """
        self.assertEqual(self.publisher1.slug, "focus-home-interactive")

    def test_developer_slug_generated(self):
        """
        Developer slug has been generated correctly?
        """
        self.assertEqual(self.developer1.slug, "asobo-studio")

    def test_platform_slug_generated(self):
        """
        Platform slug has been generated correctly?
        """
        self.assertEqual(self.platform1.slug, "xbox-game-pass")

    def test_game_slug_generated(self):
        """
        Game slug has been generated correctly?
        """
        self.assertEqual(self.game1.slug, "a-plague-tale-innocence")

    def test_game_tags_generated(self):
        """
        Game tags have been generated correctly?
        """
        tags = self.game1.tags.all()
        self.assertEqual(tags.count(), 2)
        tag1 = tags.get(tag="A Plague Tale: Innocence")
        self.assertNotEqual(tag1, None)
        self.assertEqual(tag1.slug, "a-plague-tale-innocence")
        tag2 = tags.get(tag="플래그 테일: 이노센스")
        self.assertNotEqual(tag2, None)
        self.assertEqual(tag2.tag, "플래그 테일: 이노센스")
        self.assertEqual(tag2.slug, "플래그-테일-이노센스")

    def test_retrieve_platform_list(self):
        """
        retrieve all platforms
        """
        url = reverse('platform-list')
        response = self.client.get(url)
        self.assertEqual(response.status_code, status.HTTP_200_OK)

    def test_retrieve_platform_detail(self):
        """
        retrieve single platform
        """
        url = reverse('platform-detail', args = ('xbox-game-pass',))
        response = self.client.get(url)
        self.assertEqual(response.status_code, status.HTTP_200_OK)

    def test_retrieve_games(self):
        """
        retrieve all games
        """
        url = reverse('game-list')
        response = self.client.get(url)
        self.assertEqual(response.status_code, status.HTTP_200_OK)

    def test_retrieve_game_detail(self):
        """
        retrieve single game
        """
        url = reverse('game-detail', kwargs={'slug': 'a-plague-tale-innocence'})
        response = self.client.get(url)
        self.assertEqual(response.status_code, status.HTTP_200_OK)
