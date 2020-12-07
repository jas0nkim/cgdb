from rest_framework import serializers
from .models import Mode, Genre, Series, Publisher, Developer, Platform, Game

class ModeSerializer(serializers.ModelSerializer):
    """
    Mode django model serializer
    """
    class Meta:
        model = Mode
        fields = ('name',)

class GenreSerializer(serializers.ModelSerializer):
    """
    Genre django model serializer
    """
    class Meta:
        model = Genre
        fields = ('name',)

class SeriesSerializer(serializers.ModelSerializer):
    """
    Series django model serializer
    """
    class Meta:
        model = Series
        fields = ('name',)

class PublisherSerializer(serializers.ModelSerializer):
    """
    Publisher django model serializer
    """
    class Meta:
        model = Publisher
        fields = ('name',)

class DeveloperSerializer(serializers.ModelSerializer):
    """
    Developer django model serializer
    """
    class Meta:
        model = Developer
        fields = ('name',)

class PlatformSerializer(serializers.ModelSerializer):
    """
    Platform django model serializer
    """
    class Meta:
        model = Platform
        fields = ('name', 'description', 'pictures',)

class GameSerializer(serializers.ModelSerializer):
    """
    Game django model serializer
    """
    developers = DeveloperSerializer(many=True)
    publishers = PublisherSerializer(many=True)
    series = SeriesSerializer(many=True)
    platforms = PlatformSerializer(many=True)
    genres = GenreSerializer(many=True)
    modes = ModeSerializer(many=True, required=False)

    class Meta:
        model = Game
        fields = ('title',
                'description',
                'pictures',
                'links',
                'developers',
                'publishers',
                'series',
                'platforms',
                'genres',
                'modes',)
