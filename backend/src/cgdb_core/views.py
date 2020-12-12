from django.shortcuts import render
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
        """
        return Response(request.data)
