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

    def to_representation(self, instance):
        return {
            'name': instance.name,
            'description': instance.description,
            'pictures': instance.pictures,
            'slug': instance.slug,
            'games': [{'title':g.title, 'slug':g.slug} for g in instance.games.all()]
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

    def _inter_language_handler(self, data):
        title_lc = {}
        wikipedia_links = {}
        language_codes = []
        if data.get('language'):
            title_lc[data.get('language')] = data.get('title_lc')
            wikipedia_links[f"wikipedia_{data.get('language')}"] = data.get('link')
        for interlang in data.get('inter_languages'):
            title_lc[interlang.get('iso')] = interlang.get('title_lc')
            wikipedia_links[f"wikipedia_{interlang.get('iso')}"] = interlang.get('url')
            language_codes.append({
                'iso': interlang.get('iso'),
                'language': interlang.get('lang_lc'),
                'language_eng': interlang.get('lang'),
            })
        return title_lc, wikipedia_links, language_codes

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
            try:
                developer = Developer.objects.get(name=developer_name)
                developers.append(DeveloperSerializer(developer,
                                                    data={'name': developer_name}))
            except Developer.DoesNotExist:
                developers.append(DeveloperSerializer(data={'name': developer_name}))
        publishers = []
        for publisher_name in data.get('publishers'):
            try:
                publisher = Publisher.objects.get(name=publisher_name)
                publishers.append(PublisherSerializer(publisher,
                                                    data={'name': publisher_name}))
            except Publisher.DoesNotExist:
                publishers.append(PublisherSerializer(data={'name': publisher_name}))
        series = []
        for series_name in data.get('series'):
            try:
                series_obj = Series.objects.get(name=series_name)
                series.append(SeriesSerializer(series_obj,
                                                data={'name': series_name}))
            except Series.DoesNotExist:
                series.append(SeriesSerializer(data={'name': series_name}))
        platforms = []
        if data.get('platform'):
            try:
                platform = Platform.objects.get(name=data.get('platform'))
                platforms.append(PlatformSerializer(platform,
                                                data={'name': data.get('platform')}))
            except Platform.DoesNotExist:
                platforms.append(
                        PlatformSerializer(data={'name': data.get('platform')}))
        genres = []
        for genre_name in data.get('genres'):
            try:
                genre = Genre.objects.get(name=genre_name)
                genres.append(GenreSerializer(genre,
                                            data={'name': genre_name}))
            except Genre.DoesNotExist:
                genres.append(GenreSerializer(data={'name': genre_name}))
        modes = []
        for mode_name in data.get('modes'):
            try:
                mode = Mode.objects.get(name=mode_name)
                modes.append(ModeSerializer(mode,
                                        data={'name': mode_name}))
            except Mode.DoesNotExist:
                modes.append(ModeSerializer(data={'name': mode_name}))
        title_lc, wikipedia_links, language_codes = self._inter_language_handler(data)
        return {
            'title': title,
            'title_lc': title_lc,
            'description': data.get('description_lc') if language == 'en' else None,
            'description_lc': {
                language: data.get('description_lc'),
            },
            'pictures': data.get('pictures'),
            'links': wikipedia_links,
            'developers': developers,
            'publishers': publishers,
            'series': series,
            'platforms': platforms,
            'genres': genres,
            'modes': modes,
        }

    def to_representation(self, instance):
        """
        Override this to support serialization, for read operations.
        """
        return {
            'title': instance.title,
            'title_lc': instance.title_lc,
            'description': instance.description,
            'description_lc': instance.description_lc,
            'pictures': instance.pictures,
            'links': instance.links,
            'developers': [d.name for d in instance.developers.all()],
            'publishers': [p.name for p in instance.publishers.all()],
            'series': [s.name for s in instance.series.all()],
            'platforms': [{'name': p.name, 'slug':p.slug} for p in instance.platforms.all()],
            'genres': [g.name for g in instance.genres.all()],
            'modes': [m.name for m in instance.modes.all()],
            'slug': instance.slug,
        }

    def create(self, validated_data):
        game = Game.objects.create(title=validated_data.get('title'),
                                title_lc=validated_data.get('title_lc'),
                                description=validated_data.get('description'),
                                description_lc=validated_data.get('description_lc'),
                                pictures=validated_data.get('pictures'),
                                links=validated_data.get('links'),
                            )
        for developer_serializer in validated_data.get('developers'):
            if not developer_serializer.is_valid():
                continue
            game.developers.add(developer_serializer.save())
        for publisher_serializer in validated_data.get('publishers'):
            if not publisher_serializer.is_valid():
                continue
            game.publishers.add(publisher_serializer.save())
        for series_serializer in validated_data.get('series'):
            if not series_serializer.is_valid():
                continue
            game.series.add(series_serializer.save())
        for platform_serializer in validated_data.get('platforms'):
            if not platform_serializer.is_valid():
                continue
            game.platforms.add(platform_serializer.save())
        for genre_serializer in validated_data.get('genres'):
            if not genre_serializer.is_valid():
                continue
            game.genres.add(genre_serializer.save())
        for mode_serializer in validated_data.get('modes'):
            if not mode_serializer.is_valid():
                continue
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
            if not developer_serializer.is_valid():
                continue
            if developer_serializer.instance:
                developer_name = developer_serializer.instance.name
            else:
                developer_name = developer_serializer.validated_data.get('name')
            if not instance.developers.all().filter(name=developer_name).exists():
                instance.developers.add(developer_serializer.save())
        for publisher_serializer in validated_data.get('publishers'):
            if not publisher_serializer.is_valid():
                continue
            if publisher_serializer.instance:
                publisher_name = publisher_serializer.instance.name
            else:
                publisher_name = publisher_serializer.validated_data.get('name')
            if not instance.publishers.all().filter(name=publisher_name).exists():
                instance.publishers.add(publisher_serializer.save())
        for series_serializer in validated_data.get('series'):
            if not series_serializer.is_valid():
                continue
            if series_serializer.instance:
                series_name = series_serializer.instance.name
            else:
                series_name = series_serializer.validated_data.get('name')
            if not instance.series.all().filter(name=series_name).exists():
                instance.series.add(series_serializer.save())
        for platform_serializer in validated_data.get('platforms'):
            if not platform_serializer.is_valid():
                continue
            if platform_serializer.instance:
                platform_name = platform_serializer.instance.name
            else:
                platform_name = platform_serializer.validated_data.get('name')
            if not instance.platforms.all().filter(name=platform_name).exists():
                instance.platforms.add(platform_serializer.save())
        for genre_serializer in validated_data.get('genres'):
            if not genre_serializer.is_valid():
                continue
            if genre_serializer.instance:
                genre_name = genre_serializer.instance.name
            else:
                genre_name = genre_serializer.validated_data.get('name')
            if not instance.genres.all().filter(name=genre_name).exists():
                instance.genres.add(genre_serializer.save())
        for mode_serializer in validated_data.get('modes'):
            if not mode_serializer.is_valid():
                continue
            if mode_serializer.instance:
                mode_name = mode_serializer.instance.name
            else:
                mode_name = mode_serializer.validated_data.get('name')
            if not instance.modes.all().filter(name=mode_name).exists():
                instance.modes.add(mode_serializer.save())
        return instance
