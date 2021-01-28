import datetime
from django.utils.text import slugify
from rest_framework import serializers
from .models import (GameReleaseDate,
                    LanguageCode,
                    Mode,
                    Genre,
                    Series,
                    Publisher,
                    Developer,
                    Platform,
                    Game)

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

class SimpleGameSerializer(serializers.ModelSerializer):
    """
    Game model serializer for simply display-only purpose
    """
    class Meta:
        model = Game
        fields = ('title',
                'pictures',
                'slug',)

class PlatformSerializer(serializers.ModelSerializer):
    """
    Platform django model serializer
    """
    games = SimpleGameSerializer(many=True)

    class Meta:
        model = Platform
        fields = ('name',
                'description',
                'verdict',
                'available_countries',
                'internet_requirements',
                'supported_devices',
                'pictures',
                'slug',
                'games',)

class GameReleaseDateSerializer(serializers.ModelSerializer):
    """
    GameReleaseDate django model serializer
    """
    platform = PlatformSerializer()

    class Meta:
        model = GameReleaseDate
        fields = ('game', 'platform', 'release_date',)

class SimplePlatformSerializer(serializers.ModelSerializer):
    """
    Platform model serializer for simply display-only purpose
    """
    slug = serializers.CharField(required=False)
    class Meta:
        model = Platform
        fields = ('name',
                'pictures',
                'slug',)

class GameSerializer(serializers.ModelSerializer):
    """
    Game django model serializer
    """
    platforms = SimplePlatformSerializer(many=True)
    developers = DeveloperSerializer(many=True, required=False)
    publishers = PublisherSerializer(many=True, required=False)
    series = SeriesSerializer(many=True, required=False)
    genres = GenreSerializer(many=True, required=False)
    modes = ModeSerializer(many=True, required=False)
    slug = serializers.CharField(required=False)
    # release_dates = GameReleaseDateSerializer(many=True, required=False)

    class Meta:
        model = Game
        fields = ('title',
                'title_lc',
                'description',
                'description_lc',
                'esrb',
                'pictures',
                'links',
                'developers',
                'publishers',
                'series',
                'platforms',
                'genres',
                'modes',
                'slug',)

    def create(self, validated_data):
        platforms_data = validated_data.pop('platforms')
        developers_data = validated_data.pop('developers')
        publishers_data = validated_data.pop('publishers')
        series_data = validated_data.pop('series')
        genres_data = validated_data.pop('genres')
        modes_data = validated_data.pop('modes')
        # release_dates_data = validated_data.pop('release_dates')

        game = Game.objects.create(**validated_data)
        for platform_data in platforms_data:
            try:
                obj = Platform.objects.get(**platform_data)
            except Platform.DoesNotExist:
                obj = Platform.objects.create(**platform_data)
            game.platforms.add(obj)
        for developer_data in developers_data:
            try:
                obj = Developer.objects.get(**developer_data)
            except Developer.DoesNotExist:
                obj = Developer.objects.create(**developer_data)
            game.developers.add(obj)
        for publisher_data in publishers_data:
            try:
                obj = Publisher.objects.get(**publisher_data)
            except Publisher.DoesNotExist:
                obj = Publisher.objects.create(**publisher_data)
            game.publishers.add(obj)
        for single_series_data in series_data:
            try:
                obj = Series.objects.get(**single_series_data)
            except Series.DoesNotExist:
                obj = Series.objects.create(**single_series_data)
            game.series.add(obj)
        for genre_data in genres_data:
            try:
                obj = Genre.objects.get(**genre_data)
            except Genre.DoesNotExist:
                obj = Genre.objects.create(**genre_data)
            game.genres.add(obj)
        for mode_data in modes_data:
            try:
                obj = Mode.objects.get(**mode_data)
            except Mode.DoesNotExist:
                obj = Mode.objects.create(**mode_data)
            game.modes.add(obj)
        # for release_date in validated_data.get('release_dates'):
        #     if not GameReleaseDate.objects.filter(iso=release_date.get('iso')).exists():
        #         LanguageCode.objects.create(iso=lang_code.get('iso'),
        #                                 language=lang_code.get('language'),
        #                                 language_eng=lang_code.get('language_eng'))
        return game

    def update(self, instance, validated_data):
        platforms_data = validated_data.pop('platforms')
        developers_data = validated_data.pop('developers')
        publishers_data = validated_data.pop('publishers')
        series_data = validated_data.pop('series')
        genres_data = validated_data.pop('genres')
        modes_data = validated_data.pop('modes')

        instance = super().update(instance, validated_data)

        for platform_data in platforms_data:
            if not instance.platforms.all().filter(**platform_data).exists():
                try:
                    obj = Platform.objects.get(**platform_data)
                except Platform.DoesNotExist:
                    obj = Platform.objects.create(**platform_data)
                instance.platforms.add(obj)
        for developer_data in developers_data:
            if not instance.developers.all().filter(**developer_data).exists():
                try:
                    obj = Developer.objects.get(**developer_data)
                except Developer.DoesNotExist:
                    obj = Developer.objects.create(**developer_data)
                instance.developers.add(obj)
        for publisher_data in publishers_data:
            if not instance.publishers.all().filter(**publisher_data).exists():
                try:
                    obj = Publisher.objects.get(**publisher_data)
                except Publisher.DoesNotExist:
                    obj = Publisher.objects.create(**publisher_data)
                instance.publishers.add(obj)
        for single_series_data in series_data:
            if not instance.series.all().filter(**single_series_data).exists():
                try:
                    obj = Series.objects.get(**single_series_data)
                except Series.DoesNotExist:
                    obj = Series.objects.create(**single_series_data)
                instance.series.add(obj)
        for genre_data in genres_data:
            if not instance.genres.all().filter(**genre_data).exists():
                try:
                    obj = Genre.objects.get(**genre_data)
                except Genre.DoesNotExist:
                    obj = Genre.objects.create(**genre_data)
                instance.genres.add(obj)
        for mode_data in modes_data:
            if not instance.modes.all().filter(**mode_data).exists():
                try:
                    obj = Mode.objects.get(**mode_data)
                except Mode.DoesNotExist:
                    obj = Mode.objects.create(**mode_data)
                instance.modes.add(obj)
        return instance

class LanguageCodeSerializer(serializers.ModelSerializer):
    class Meta:
        model = LanguageCode
        fields = ('iso',
                'language',
                'language_eng',)

class WikipediaGameSerializer(GameSerializer):
    """
    Game django model serializer (POST from wikipedia bot)
    """
    def _create_language_code(self, interlang_data):
        """
        insert language code into db
        """
        if not LanguageCode.objects.filter(
                                        iso=interlang_data.get('iso')
                                    ).exists():
            LanguageCode.objects.create(iso=interlang_data.get('iso'),
                                language=interlang_data.get('lang_lc'),
                                language_eng=interlang_data.get('lang'))

    def _convert_str_to_dict(self, value):
        """
        string to dict { 'name': string value }
        """
        return { 'name': value }

    def _handle_post_data(self, data):
        """
        set title, title_lc, description, description_lc, platforms,
        developers, publishers, series, genres, modes, links
        """
        title = data.get('english_title')
        title_lc = {}
        description = None
        description_lc = {}
        links = {}
        if data.get('language'):
            title_lc[data.get('language')] = data.get('title_lc')
            links[f"wikipedia_{data.get('language')}"] = data.get('link')
            if data.get('language') == 'en':
                description = data.get('description_lc')
            description_lc[data.get('language')] = data.get('description_lc')
        for interlang in data.get('inter_languages'):
            title_lc[interlang.get('iso')] = interlang.get('title_lc')
            links[f"wikipedia_{interlang.get('iso')}"] = interlang.get('url')
            self._create_language_code(interlang)

        data['title'] = title
        data['title_lc'] = title_lc
        data['description'] = description
        data['description_lc'] = description_lc
        data['platforms'] = [self._convert_str_to_dict(data['platform'])]
        data['developers'] = [self._convert_str_to_dict(v) for v in data['developers']]
        data['publishers'] = [self._convert_str_to_dict(v) for v in data['publishers']]
        data['series'] = [self._convert_str_to_dict(v) for v in data['series']]
        data['genres'] = [self._convert_str_to_dict(v) for v in data['genres']]
        data['modes'] = [self._convert_str_to_dict(v) for v in data['modes']]
        data['links'] = links
        return data

    def to_internal_value(self, data):
        return super().to_internal_value(self._handle_post_data(data))

class GameSearchSerializer(serializers.ModelSerializer):
    """
    Game django model serializer for Game Search
    """
    platforms = SimplePlatformSerializer(many=True)

    class Meta:
        model = Game
        fields = ('title',
                'title_lc',
                'slug',
                'pictures',
                'platforms')
