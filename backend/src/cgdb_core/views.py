import logging
from django.contrib.postgres.search import SearchVector
from django.db.utils import DataError
from rest_framework import status
from rest_framework.viewsets import ReadOnlyModelViewSet
from rest_framework.response import Response
from rest_framework.views import APIView
from rest_framework.permissions import AllowAny
from .models import Platform, Game
from .serializers import PlatformSerializer, GameSerializer, GameSearchSerializer

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
        ).filter(searchv__icontains=search_term).distinct('title')

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
        title = request.data.get('english_title')
        if not title:
            return Response({"error": "English title not found"},
                        status=status.HTTP_406_NOT_ACCEPTABLE)
        serializer = None
        ok_status = status.HTTP_200_OK
        try:
            game = Game.objects.get(title=title)
            serializer = GameSerializer(game, data=request.data)
        except Game.DoesNotExist:
            serializer = GameSerializer(data=request.data)
            ok_status = status.HTTP_201_CREATED
        if not serializer.is_valid():
            return Response(serializer.errors, status=status.HTTP_406_NOT_ACCEPTABLE)
        try:
            serializer.save()
        except DataError as err:
            self.logger.error('%s - %s', request.data.get('link'), str(err))
            return Response(serializer.errors,
                        status=status.HTTP_500_INTERNAL_SERVER_ERROR)
        return Response(serializer.data, status=ok_status)
