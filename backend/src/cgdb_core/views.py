import logging
from django.contrib.postgres.search import SearchVector, SearchQuery
from django.db.utils import DataError
from django.db.models import Q
from django.utils.text import slugify
from rest_framework import status
from rest_framework.viewsets import ReadOnlyModelViewSet
from rest_framework.response import Response
from rest_framework.views import APIView
from rest_framework.permissions import AllowAny
from rest_framework.exceptions import ValidationError
from .models import Platform, Game
from .serializers import (PlatformSerializer,
                        GameSerializer,
                        WikipediaGameSerializer,
                        RedditStadiaGameSerializer,
                        GameSearchSerializer,
                        RedditStadiaGameProSerializer,
                        RedditStadiaGameStatSerializer,)

class PlatformPublicViewSet(ReadOnlyModelViewSet):
    queryset = Platform.objects.all()
    serializer_class = PlatformSerializer
    lookup_field = 'slug'

class GamePublicViewSet(ReadOnlyModelViewSet):
    queryset = Game.objects.all()
    serializer_class = GameSerializer
    lookup_field = 'slug'

class SearchViewSet(ReadOnlyModelViewSet):
    serializer_class = GameSearchSerializer

    def get_queryset(self):
        search_term = self.kwargs['term']
        return Game.objects.annotate(
            searchv=SearchVector('tags__tag'),
        ).filter(
            Q(searchv=SearchQuery(search_term, search_type='websearch')) |
            Q(searchv__icontains=search_term)
        ).distinct('title')

class AllGamesViewSet(SearchViewSet):
    def get_queryset(self):
        return Game.objects.all()

class WikipediaGameBot(APIView):
    permission_classes = [AllowAny]

    def __init__(self, **kwargs):
        super().__init__(**kwargs)
        self.logger = logging.getLogger(__name__)

    def post(self, request):
        """
        HTTP POST request
        create/update game, platform, developer, genre, mode, publisher, series, tags
        """
        # since request object in DRF is immutable
        _request_data = request.data.copy()
        title = request.data.get('english_title')
        if not title:
            return Response({"error": "English title not found"},
                        status=status.HTTP_406_NOT_ACCEPTABLE)
        serializer = None
        ok_status = status.HTTP_200_OK
        try:
            game = Game.objects.get(slug=slugify(title))
            serializer = WikipediaGameSerializer(game, data=_request_data)
        except Game.DoesNotExist:
            serializer = WikipediaGameSerializer(data=_request_data)
            ok_status = status.HTTP_201_CREATED
        if not serializer.is_valid():
            return Response(serializer.errors, status=status.HTTP_406_NOT_ACCEPTABLE)
        try:
            serializer.save()
        except DataError as err:
            self.logger.error('%s - %s', _request_data.get('link'), str(err))
            return Response(err,
                        status=status.HTTP_500_INTERNAL_SERVER_ERROR)
        return Response(serializer.data, status=ok_status)

class RedditStadiaGameBot(APIView):
    permission_classes = [AllowAny]

    def __init__(self, **kwargs):
        super().__init__(**kwargs)
        self.logger = logging.getLogger(__name__)

    def post(self, request):
        """
        HTTP POST request
        create/update Stadia game title, link, release date
        """
        # since request object in DRF is immutable
        _request_data = request.data.copy()
        title = _request_data.get('title')
        if not title:
            return Response({"error": "Stadia game title not found"},
                        status=status.HTTP_406_NOT_ACCEPTABLE)
        serializer = None
        ok_status = status.HTTP_200_OK
        try:
            game = Game.objects.get(slug=slugify(title))
            serializer = RedditStadiaGameSerializer(game, data=_request_data)
        except Game.DoesNotExist:
            serializer = RedditStadiaGameSerializer(data=_request_data)
            ok_status = status.HTTP_201_CREATED
        if not serializer.is_valid():
            return Response(serializer.errors, status=status.HTTP_406_NOT_ACCEPTABLE)
        try:
            serializer.save()
        except DataError as err:
            self.logger.error('Reddit Stadia Game (%s) - %s', title, str(err))
            return Response(err,
                        status=status.HTTP_500_INTERNAL_SERVER_ERROR)
        return Response(serializer.data, status=ok_status)

class RedditStadiaGameProBot(APIView):
    permission_classes = [AllowAny]

    def __init__(self, **kwargs):
        super().__init__(**kwargs)
        self.logger = logging.getLogger(__name__)

    def post(self, request):
        """
        HTTP POST request
        entered/left Stadia game titles of a month
        """
        # since request object in DRF is immutable
        _request_data = request.data.copy()
        event_date = _request_data.get('event_date')
        if not event_date:
            return Response({"error": "Event date not found"},
                        status=status.HTTP_406_NOT_ACCEPTABLE)
        serializer = RedditStadiaGameProSerializer(data=_request_data)
        if not serializer.is_valid():
            return Response(serializer.errors, status=status.HTTP_406_NOT_ACCEPTABLE)
        try:
            serializer.save()
        except DataError as err:
            self.logger.error('Reddit Stadia Pro Game (%s) - %s', event_date, str(err))
            return Response(err,
                        status=status.HTTP_500_INTERNAL_SERVER_ERROR)
        return Response(serializer.data, status=status.HTTP_200_OK)

class RedditStadiaGameStatsBot(APIView):
    permission_classes = [AllowAny]

    def __init__(self, **kwargs):
        super().__init__(**kwargs)
        self.logger = logging.getLogger(__name__)

    def post(self, request):
        """
        HTTP POST request
        Stadia game stats: ratings, genres, developers, publishers, modes
        """
        # since request object in DRF is immutable
        _request_data = request.data.copy()
        title = _request_data.get('title')
        stat_type = _request_data.get('stat_type')
        if not title:
            return Response({"error": "Game title not found"},
                        status=status.HTTP_406_NOT_ACCEPTABLE)
        if not stat_type:
            return Response({"error": "Game stats type not found"},
                        status=status.HTTP_406_NOT_ACCEPTABLE)
        serializer = RedditStadiaGameStatSerializer(data=_request_data)
        if not serializer.is_valid():
            return Response(serializer.errors, status=status.HTTP_406_NOT_ACCEPTABLE)
        try:
            serializer.save()
        except DataError as err:
            self.logger.error('Reddit Stadia Game Stats (%s - %s) - %s', title, stat_type, str(err))
            return Response(err,
                        status=status.HTTP_500_INTERNAL_SERVER_ERROR)
        return Response(serializer.data, status=status.HTTP_200_OK)
