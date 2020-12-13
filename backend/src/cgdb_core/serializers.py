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

    def to_internal_value(self, data):
        return {
            'name': data.get('name'),
            'description': data.get('description') if data.get('description')
                                                else None,
            'pictures': data.get('pictures') if data.get('pictures')
                                                else [],
        }

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
                'title_lc',
                'description',
                'description_lc',
                'pictures',
                'links',
                'developers',
                'publishers',
                'series',
                'platforms',
                'genres',
                'modes',)

    def to_internal_value(self, data):
        """
        Override this to support deserialization, for write operations.
        """
        title = data.get('english_title')
        if not title:
            raise serializers.ValidationError({'title': 'Missing title (English)'})
        language = data.get('language')
        if not language:
            raise serializers.ValidationError({'language': 'Missing language'})
        developers = []
        for developer_name in data.get('developers'):
            developers.append(DeveloperSerializer(data={'name': developer_name}))
        publishers = []
        for publisher_name in data.get('publishers'):
            publishers.append(PublisherSerializer(data={'name': publisher_name}))
        series = []
        for series_name in data.get('series'):
            series.append(SeriesSerializer(data={'name': series_name}))
        platforms = []
        if data.get('platform'):
            platforms.append(PlatformSerializer(data={'name': data.get('platform')}))
        genres = []
        for genre_name in data.get('genres'):
            genres.append(GenreSerializer(data={'name': genre_name}))
        modes = []
        for mode_name in data.get('modes'):
            modes.append(ModeSerializer(data={'name': mode_name}))

        return {
            'title': title,
            'title_lc': {
                language: data.get('title_lc'),
            },
            'description': data.get('description_lc') if language == 'en' else None,
            'description_lc': {
                language: data.get('description_lc'),
            },
            'pictures': data.get('pictures'),
            'links': {'wikipedia': data.get('link')},
            'developers': developers,
            'publishers': publishers,
            'series': series,
            'platforms': platforms,
            'genres': genres,
            'modes': modes,
        }

    # def to_representation(self, instance):
    #     """
    #     Override this to support serialization, for read operations.
    #     """
    #     pass

    def create(self, validated_data):
        game = Game.objects.create(title=validated_data.get('title'),
                                title_lc=validated_data.get('title_lc'),
                                description=validated_data.get('description'),
                                description_lc=validated_data.get('description_lc'),
                                pictures=validated_data.get('pictures'),
                                links=validated_data.get('links'),
                            )
        for developer_serializer in validated_data.get('developers'):
            if developer_serializer.is_valid():
                game.developers.add(developer_serializer.save())
        for publisher_serializer in validated_data.get('publishers'):
            if publisher_serializer.is_valid():
                game.publishers.add(publisher_serializer.save())
        for series_serializer in validated_data.get('series'):
            if series_serializer.is_valid():
                game.series.add(series_serializer.save())
        for platform_serializer in validated_data.get('platforms'):
            if platform_serializer.is_valid():
                game.platforms.add(platform_serializer.save())
        for genre_serializer in validated_data.get('genres'):
            if genre_serializer.is_valid():
                game.genres.add(genre_serializer.save())
        for mode_serializer in validated_data.get('modes'):
            if mode_serializer.is_valid():
                game.modes.add(mode_serializer.save())
        return game

    def update(self, instance, validated_data):
        instance.title = validated_data.get('title', instance.title)
        instance.title_lc = validated_data.get('title_lc', instance.title_lc)
        instance.description = validated_data.get('description', instance.description)
        instance.description_lc = validated_data.get('description_lc',
                                                    instance.description_lc)
        instance.pictures = validated_data.get('pictures', instance.pictures)
        instance.links = validated_data.get('links', instance.links)
        instance.save()

        for developer_serializer in validated_data.get('developers'):
            if developer_serializer.is_valid() and not instance.developers.all().filter(name=developer_serializer.validated_data.get('name')).exists():
                instance.developers.add(developer_serializer.save())
        for publisher_serializer in validated_data.get('publishers'):
            if publisher_serializer.is_valid() and not instance.publishers.all().filter(name=publisher_serializer.validated_data.get('name')).exists():
                instance.publishers.add(publisher_serializer.save())
        for series_serializer in validated_data.get('series'):
            if series_serializer.is_valid() and not instance.series.all().filter(name=series_serializer.validated_data.get('name')).exists():
                instance.series.add(series_serializer.save())
        for platform_serializer in validated_data.get('platforms'):
            if platform_serializer.is_valid() and not instance.platforms.all().filter(name=platform_serializer.validated_data.get('name')).exists():
                instance.platforms.add(platform_serializer.save())
        for genre_serializer in validated_data.get('genres'):
            if genre_serializer.is_valid() and not instance.genres.all().filter(name=genre_serializer.validated_data.get('name')).exists():
                instance.genres.add(genre_serializer.save())
        for mode_serializer in validated_data.get('modes'):
            if mode_serializer.is_valid() and not instance.modes.all().filter(name=mode_serializer.validated_data.get('name')).exists():
                instance.modes.add(mode_serializer.save())
        return instance
