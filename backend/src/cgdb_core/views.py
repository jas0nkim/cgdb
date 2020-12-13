from django.db.utils import IntegrityError
from rest_framework import status
from rest_framework.viewsets import ReadOnlyModelViewSet
from rest_framework.response import Response
from rest_framework.views import APIView
from rest_framework.permissions import AllowAny
from .models import Platform, Game
from .serializers import PlatformSerializer, GameSerializer

class PlatformPublicViewSet(ReadOnlyModelViewSet):
    queryset = Platform.objects.all()
    serializer_class = PlatformSerializer
    lookup_field = 'slug'

class GamePublicViewSet(ReadOnlyModelViewSet):
    queryset = Game.objects.all()
    serializer_class = GameSerializer
    lookup_field = 'slug'

class WikipediaGameBot(APIView):
    permission_classes = [AllowAny]

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
        try:
            game = Game.objects.get(title=title)
            serializer = GameSerializer(game, data=request.data)
        except Game.DoesNotExist:
            serializer = GameSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_200_OK)
        return Response(serializer.errors, status=status.HTTP_406_NOT_ACCEPTABLE)
