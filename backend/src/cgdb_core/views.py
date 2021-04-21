import logging
import datetime
from django.contrib.postgres.search import SearchVector, SearchQuery
from django.db.utils import DataError
from django.db.models import Q
from django.utils.text import slugify
from rest_framework import status
from rest_framework.viewsets import ReadOnlyModelViewSet
from rest_framework.response import Response
from rest_framework.views import APIView
from rest_framework.permissions import IsAuthenticated, AllowAny
from rest_framework.decorators import api_view, permission_classes
from celery import Celery
from kombu.exceptions import OperationalError
from cgdb.settings import RABBITMQ_HOST, RABBITMQ_PORT, RABBITMQ_USER, RABBITMQ_PASS
from .models import Genre, Platform, Game
from . import serializers
from . import utils

celery_app = Celery('producer',
                broker=f'amqp://{RABBITMQ_USER}:{RABBITMQ_PASS}@{RABBITMQ_HOST}:{RABBITMQ_PORT}',
                backend='rpc://')

@api_view(['GET'])
@permission_classes([AllowAny])
def crawl(request, platform, source):
    logger = logging.getLogger(__name__)
    result = None
    error_message = None
    try:
        result = celery_app.send_task('bots.crawl', kwargs={'platform': platform, 'source': source})
    except OperationalError as err:
        error_message = f'Sending task raised OperationalError: {str(err)}'
        logger.error(error_message)
    if not result:
        return Response({"error": error_message},
                status=status.HTTP_406_NOT_ACCEPTABLE)
    return Response({"task_id": str(result)}, status=status.HTTP_200_OK)

class PlatformPublicViewSet(ReadOnlyModelViewSet):
    queryset = Platform.objects.all()
    serializer_class = serializers.PlatformSerializer
    lookup_field = 'slug'

class GamePublicViewSet(ReadOnlyModelViewSet):
    queryset = Game.objects.all()
    serializer_class = serializers.GameSerializer
    lookup_field = 'slug'

class GameSearchViewSet(ReadOnlyModelViewSet):
    serializer_class = serializers.GameSearchSerializer

    def get_queryset(self):
        search_term = self.kwargs['term']
        return Game.objects.filter(active=True).annotate(
            searchv=SearchVector('tags__tag'),
        ).filter(
            Q(searchv=SearchQuery(search_term, search_type='websearch')) |
            Q(searchv__icontains=search_term)
        ).distinct('title')

class FilteredGamesViewSet(ReadOnlyModelViewSet):
    serializer_class = serializers.GameSearchSerializer

    def get_queryset(self):
        querydict = self.request.query_params
        platforms = querydict.getlist('platform')
        subscriptions = querydict.getlist('subscription')
        esrbs = querydict.getlist('esrb')
        genres = querydict.getlist('genre')

        qs = Game.objects.all().filter(active=True)
        if platforms:
            qs = qs.filter(platforms__in=platforms)
        if subscriptions:
            qs = qs.filter(
                    game_free_on_subscription__platform__in=platforms
                ).filter(
                    game_free_on_subscription__entered__lte=datetime.date.today()
                ).exclude(
                    game_free_on_subscription__left__lte=datetime.date.today()
                )
        if esrbs:
            qs = qs.filter(esrb__in=esrbs)
        if genres:
            qs = qs.filter(genres__in=genres)
        return qs.order_by('slug').distinct('slug')

class GameGenresViewSet(ReadOnlyModelViewSet):
    serializer_class = serializers.GenreSerializer

    def get_queryset(self):
        return Genre.objects.all().order_by('name')

class WikipediaGameBot(APIView):
    permission_classes = (IsAuthenticated,)
    serializer_class = serializers.WikipediaGameSerializer
    _title_map = utils.STADIA_GAME_TITLE_MAP_FROM_WIKIPEDIA_TO_REDDIT

    def __init__(self, **kwargs):
        super().__init__(**kwargs)
        self.logger = logging.getLogger(__name__)

    def _get_english_title(self, data):
        _title = data.get('english_title')
        if data.get('platform') == 'Stadia' and _title in self._title_map:
            return self._title_map[_title]
        return _title

    def post(self, request):
        """
        HTTP POST request
        create/update game, platform, developer, genre, mode, publisher, series, tags
        """
        # since request object in DRF is immutable
        _request_data = request.data.copy()
        title = _request_data['english_title'] = self._get_english_title(_request_data)
        if not title:
            return Response({"error": "English title not found"},
                        status=status.HTTP_406_NOT_ACCEPTABLE)
        serializer = None
        ok_status = status.HTTP_200_OK
        try:
            game = Game.objects.get(slug=slugify(title))
            serializer = self.serializer_class(game, data=_request_data)
        except Game.DoesNotExist:
            serializer = self.serializer_class(data=_request_data)
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

class WikipediaStadiaGameBot(WikipediaGameBot):
    serializer_class = serializers.WikipediaStadiaGameSerializer

class RedditStadiaGameBot(APIView):
    permission_classes = (IsAuthenticated,)
    serializer_class = serializers.RedditStadiaGameSerializer

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
            serializer = self.serializer_class(game, data=_request_data)
        except Game.DoesNotExist:
            serializer = self.serializer_class(data=_request_data)
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
    permission_classes = (IsAuthenticated,)
    serializer_class = serializers.RedditStadiaGameProSerializer

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
        serializer = self.serializer_class(data=_request_data)
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
    permission_classes = (IsAuthenticated,)
    serializer_class = serializers.RedditStadiaGameStatSerializer

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
        serializer = self.serializer_class(data=_request_data)
        if not serializer.is_valid():
            return Response(serializer.errors, status=status.HTTP_406_NOT_ACCEPTABLE)
        try:
            serializer.save()
        except DataError as err:
            self.logger.error('Reddit Stadia Game Stats (%s - %s) - %s', title, stat_type, str(err))
            return Response(err,
                        status=status.HTTP_500_INTERNAL_SERVER_ERROR)
        return Response(serializer.data, status=status.HTTP_200_OK)

class GameBot(APIView):
    permission_classes = (IsAuthenticated,)

    def __init__(self, **kwargs):
        super().__init__(**kwargs)
        self.logger = logging.getLogger(__name__)

    def _get_title(self, data):
        return data['title']

    def post(self, request):
        """
        HTTP POST request
        create/update game, platform, developer, genre, publisher, series, tags
        """
        # since request object in DRF is immutable
        _request_data = request.data.copy()
        title = self._get_title(_request_data)
        if not title:
            return Response({"error": "Title not found"},
                        status=status.HTTP_406_NOT_ACCEPTABLE)
        serializer = None
        ok_status = status.HTTP_200_OK
        try:
            game = Game.objects.get(slug=slugify(title))
            serializer = self.serializer_class(game, data=_request_data)
        except Game.DoesNotExist:
            serializer = self.serializer_class(data=_request_data)
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


class SteampoweredGameBot(GameBot):
    serializer_class = serializers.SteampoweredGameSerializer

class SteampoweredStadiaGameBot(GameBot):
    serializer_class = serializers.SteampoweredStadiaGameSerializer

class MetacriticGameBot(GameBot):
    serializer_class = serializers.MetacriticGameSerializer

class MetacriticStadiaGameBot(GameBot):
    serializer_class = serializers.MetacriticStadiaGameSerializer
    _title_map = utils.STADIA_GAME_TITLE_MAP_FROM_METACRITIC_TO_REDDIT

    def _get_title(self, data):
        _title = data.get('title')
        if _title in self._title_map:
            return self._title_map[_title]
        else:
            return _title
