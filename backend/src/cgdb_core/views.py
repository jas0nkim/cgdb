from django.shortcuts import render
from rest_framework.viewsets import ReadOnlyModelViewSet
from .models import Platform, Game
from .serializers import PlatformSerializer, GameSerializer

class PlatformPublicViewSet(ReadOnlyModelViewSet):
    queryset = Platform.objects.all()
    serializer_class = PlatformSerializer

class GamePublicViewSet(ReadOnlyModelViewSet):
    queryset = Game.objects.all()
    serializer_class = GameSerializer