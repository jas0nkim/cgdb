from rest_framework import serializers
from .models import Platform, Game

class PlatformSerializer(serializers.ModelSerializer):
    """
    Platform django model serializer
    """

    class Meta:
        model = Platform
        fields = ['name', 'description', 'pictures']

class GameSerializer(serializers.ModelSerializer):
    """
    Game django model serializer
    """

    class Meta:
        model = Game
        fields = ['title',
                'description',
                'pictures',
                'links',
                'developers',
                'publishers',
                'series',
                'platforms',
                'genres',
                'modes',]
