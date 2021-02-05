import datetime
from os import stat
from django.utils.text import slugify
from rest_framework import serializers
from rest_framework.exceptions import ValidationError
from .models import (GameFreeOnSubscription, GameReleaseDate,
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

class LanguageCodeSerializer(serializers.ModelSerializer):
    class Meta:
        model = LanguageCode
        fields = ('iso',
                'language',
                'language_eng',)

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
    release_date = serializers.DateField(input_formats=['%Y %b %d',])

    class Meta:
        model = GameReleaseDate
        fields = ('game', 'platform', 'release_date',)

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
    # game_release_dates = GameReleaseDateSerializer(many=True, required=False)
    slug = serializers.CharField(required=False)

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
                # 'game_release_dates'
                'slug',)

    def create(self, validated_data):
        platforms_data = validated_data.pop('platforms', [])
        developers_data = validated_data.pop('developers', [])
        publishers_data = validated_data.pop('publishers', [])
        series_data = validated_data.pop('series', [])
        genres_data = validated_data.pop('genres', [])
        modes_data = validated_data.pop('modes', [])

        instance = Game.objects.create(**validated_data)

        for platform_data in platforms_data:
            name = platform_data.pop('name')
            try:
                obj = Platform.objects.get(slug=slugify(name))
            except Platform.DoesNotExist:
                obj = Platform.objects.create(
                                        name=name,
                                        **platform_data)
            instance.platforms.add(obj)
        for developer_data in developers_data:
            name = developer_data.pop('name')
            try:
                obj = Developer.objects.get(slug=slugify(name))
            except Developer.DoesNotExist:
                obj = Developer.objects.create(
                                        name=name,
                                        **developer_data)
            instance.developers.add(obj)
        for publisher_data in publishers_data:
            name = publisher_data.pop('name')
            try:
                obj = Publisher.objects.get(slug=slugify(name))
            except Publisher.DoesNotExist:
                obj = Publisher.objects.create(
                                        name=name,
                                        **publisher_data)
            instance.publishers.add(obj)
        for single_series_data in series_data:
            name = single_series_data.pop('name')
            try:
                obj = Series.objects.get(slug=slugify(name))
            except Series.DoesNotExist:
                obj = Series.objects.create(
                                        name=name,
                                        **single_series_data)
            instance.series.add(obj)
        for genre_data in genres_data:
            name = genre_data.pop('name')
            try:
                obj = Genre.objects.get(slug=slugify(name))
            except Genre.DoesNotExist:
                obj = Genre.objects.create(
                                        name=name,
                                        **genre_data)
            instance.genres.add(obj)
        for mode_data in modes_data:
            name = mode_data.pop('name')
            try:
                obj = Mode.objects.get(slug=slugify(name))
            except Mode.DoesNotExist:
                obj = Mode.objects.create(
                                        name=name,
                                        **mode_data)
            instance.modes.add(obj)
        return instance

    def update(self, instance, validated_data):
        platforms_data = validated_data.pop('platforms', [])
        developers_data = validated_data.pop('developers', [])
        publishers_data = validated_data.pop('publishers', [])
        series_data = validated_data.pop('series', [])
        genres_data = validated_data.pop('genres', [])
        modes_data = validated_data.pop('modes', [])

        instance = super().update(instance, validated_data)

        for platform_data in platforms_data:
            name = platform_data.pop('name')
            if not instance.platforms.all().filter(
                                            slug=slugify(name)).exists():
                try:
                    obj = Platform.objects.get(slug=slugify(name))
                except Platform.DoesNotExist:
                    obj = Platform.objects.create(
                                            name=name,
                                            **platform_data)
                instance.platforms.add(obj)
        for developer_data in developers_data:
            name = developer_data.pop('name')
            if not instance.developers.all().filter(
                                            slug=slugify(name)).exists():
                try:
                    obj = Developer.objects.get(slug=slugify(name))
                except Developer.DoesNotExist:
                    obj = Developer.objects.create(
                                            name=name,
                                            **developer_data)
                instance.developers.add(obj)
        for publisher_data in publishers_data:
            name = publisher_data.pop('name')
            if not instance.publishers.all().filter(
                                            slug=slugify(name)).exists():
                try:
                    obj = Publisher.objects.get(slug=slugify(name))
                except Publisher.DoesNotExist:
                    obj = Publisher.objects.create(
                                            name=name,
                                            **publisher_data)
                instance.publishers.add(obj)
        for single_series_data in series_data:
            name = single_series_data.pop('name')
            if not instance.series.all().filter(
                                            slug=slugify(name)).exists():
                try:
                    obj = Series.objects.get(slug=slugify(name))
                except Series.DoesNotExist:
                    obj = Series.objects.create(
                                            name=name,
                                            **single_series_data)
                instance.series.add(obj)
        for genre_data in genres_data:
            name = genre_data.pop('name')
            if not instance.genres.all().filter(
                                            slug=slugify(name)).exists():
                try:
                    obj = Genre.objects.get(slug=slugify(name))
                except Genre.DoesNotExist:
                    obj = Genre.objects.create(
                                            name=name,
                                            **genre_data)
                instance.genres.add(obj)
        for mode_data in modes_data:
            name = mode_data.pop('name')
            if not instance.modes.all().filter(
                                            slug=slugify(name)).exists():
                try:
                    obj = Mode.objects.get(slug=slugify(name))
                except Mode.DoesNotExist:
                    obj = Mode.objects.create(
                                            name=name,
                                            **mode_data)
                instance.modes.add(obj)
        return instance

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
        data['links'] = links
        data['platforms'] = [self._convert_str_to_dict(data['platform'])]
        data['developers'] = [self._convert_str_to_dict(v) for v in data['developers']]
        data['publishers'] = [self._convert_str_to_dict(v) for v in data['publishers']]
        data['series'] = [self._convert_str_to_dict(v) for v in data['series']]
        data['genres'] = [self._convert_str_to_dict(v) for v in data['genres']]
        data['modes'] = [self._convert_str_to_dict(v) for v in data['modes']]
        return data

    def to_internal_value(self, data):
        return super().to_internal_value(self._handle_post_data(data))

class RedditStadiaGameSerializer(GameSerializer):
    """
    Game django model serializer (POST from reddit bot)
    """
    _platform = 'Stadia'
    _release_date = None

    def _handle_post_data(self, data):
        """
        set extra values into POST data: title_lc, links, platforms
        """
        links = {}
        if data.get('stadia_link'):
            links['stadia'] = data.get('stadia_link')

        data['title_lc'] = {'en': data.get('title')}
        data['links'] = links
        data['platforms'] = [{'name': self._platform}]
        self._release_date = data.get('release_date')
        return data

    def to_internal_value(self, data):
        return super().to_internal_value(self._handle_post_data(data))

    def create(self, validated_data):
        instance = super().create(validated_data)

        # insert or update game release date info
        try:
            platform = Platform.objects.get(slug=slugify(self._platform))
        except Platform.DoesNotExist:
            raise ValidationError("Platform, Stadia, not exists in DB")
        grds = GameReleaseDateSerializer(data={
            'game': instance.pk,
            'platform': platform.pk,
            'release_date': self._release_date,
        })
        if not grds.is_valid():
            raise ValidationError(grds.errors)
        else:
            grds.save()

        return instance

    def update(self, instance, validated_data):
        instance = super().update(instance, validated_data)

        # insert or update game release date info
        try:
            platform = Platform.objects.get(slug=slugify(self._platform))
        except Platform.DoesNotExist:
            raise ValidationError("Platform, Stadia, not exists in DB")
        grds = GameReleaseDateSerializer(data={
            'game': instance.pk,
            'platform': platform.pk,
            'release_date': self._release_date,
        })
        if not grds.is_valid():
            raise ValidationError(grds.errors)
        else:
            grds.save()

        return instance

class RedditStadiaGameProSerializer(serializers.Serializer):
    _platform = 'Stadia'

    # some titles in pro games are not matching with titles in games:
    #   'pro games': 'games', ...
    _game_title_map = {
        'Destiny 2: The Collection': 'Destiny 2',
        'Farming Simulator 19 Platinum Edition': 'Farming Simulator 19',
        "PlayerUnknown's Battlegrounds - Pioneer Edition": "PLAYERUNKNOWN'S BATTLEGROUNDS",
        'Crayta: Premium Edition': 'Crayta',
        'SUPER BOMBERMAN R ONLINE Premium Edition': 'SUPER BOMBERMAN R ONLINE',
        'HITMAN - The Complete First Season': 'HITMAN',
        'Lara Croft: Temple of Osiris': 'Lara Croft and the Temple of Osiris',
        'Hello Neighbor: Hide & Seek': 'Hello Neighbor: Hide and Seek',
    }

    entered_titles = serializers.ListField(
        child=serializers.CharField(max_length=200),
        allow_empty=True,
    )
    left_titles = serializers.ListField(
        child=serializers.CharField(max_length=200),
        allow_empty=True,
    )
    event_date = serializers.DateField(input_formats=['%Y %b',])

    class Meta:
        fields = ('entered_titles',
                'left_titles',
                'event_date',)

    def create(self, validated_data):
        try:
            platform = Platform.objects.get(slug=slugify(self._platform))
        except Platform.DoesNotExist:
            raise ValidationError("Platform, Stadia, not exists in DB")

        # insert entered games in 'game_free_on_subscriptions'
        for entered_title in validated_data.get('entered_titles'):
            if entered_title in self._game_title_map:
                entered_title = self._game_title_map[entered_title]
            game = None
            try:
                game = Game.objects.get(slug=slugify(entered_title))
            except Game.DoesNotExist:
                raise ValidationError(f"Entering Stadia pro game title, {entered_title} - {validated_data.get('event_date')}, not exists in DB (table: games)")

            try:
                _inst = GameFreeOnSubscription.objects.get(
                                game=game,
                                platform=platform,
                                entered=validated_data.get('event_date'))
            except GameFreeOnSubscription.DoesNotExist:
                _inst = GameFreeOnSubscription.objects.create(
                                game=game,
                                platform=platform,
                                entered=validated_data.get('event_date'))
        # update left games in 'game_free_on_subscriptions'
        for left_title in validated_data.get('left_titles'):
            if left_title in self._game_title_map:
                left_title = self._game_title_map[left_title]
            game = None
            try:
                game = Game.objects.get(slug=slugify(left_title))
            except Game.DoesNotExist:
                raise ValidationError(f"Leaving Stadia pro game title, {left_title} - {validated_data.get('event_date')}, not exists in DB (table: games)")

            gfos = None
            try:
                gfos = GameFreeOnSubscription.objects.get(
                                game=game,
                                platform=platform,
                                entered__lt=validated_data.get('event_date'),
                                left__isnull=True,)
            except GameFreeOnSubscription.DoesNotExist:
                pass
            else:
                gfos.left = validated_data.get('event_date')
                gfos.save()

        return validated_data

    def update(self, instance, validated_data):
        return super().update(instance, validated_data)

class RedditStadiaGameStatSerializer(serializers.Serializer):
    _platform = 'Stadia'
    STAT_TYPE_CHOICES = [
        ('ratings', 'ratings'),
        ('genres', 'genres'),
        ('developers', 'developers'),
        ('publishers', 'publishers'),
        ('modes', 'modes'),
    ]

    # some titles in game stats are not matching with titles in games:
    #   'game stats': 'games', ...
    _game_title_map = {}

    title = serializers.CharField(max_length=200)
    stat_type = serializers.ChoiceField(choices=STAT_TYPE_CHOICES)
    stat_detail = serializers.CharField(max_length=200)

    class Meta:
        fields = ('title',
                'stat_type',
                'stat_detail',)

    def create(self, validated_data):
        try:
            platform = Platform.objects.get(name=self._platform)
        except Platform.DoesNotExist:
            raise ValidationError("Platform, Stadia, not exists in DB")

        title = validated_data.get('title')
        if title in self._game_title_map:
            title = self._game_title_map[title]
        stat_type = validated_data.get('stat_type')
        stat_detail = validated_data.get('stat_detail')

        game = None
        try:
            game = Game.objects.get(slug=slugify(title), platforms__name=self._platform)
        except Game.DoesNotExist:
            raise ValidationError(f"Stadia game title, {title} - {stat_type}, not exists in DB (table: games)")

        # store stats into game
        if stat_type == 'ratings':
            game.esrb = stat_detail
            game.save()
        elif stat_type == 'genres':
            if not game.genres.all().filter(slug=slugify(stat_detail)).exists():
                try:
                    obj = Genre.objects.get(slug=slugify(stat_detail))
                except Genre.DoesNotExist:
                    obj = Genre.objects.create(name=stat_detail)
                game.genres.add(obj)
        elif stat_type == 'developers':
            if not game.developers.all().filter(slug=slugify(stat_detail)).exists():
                try:
                    obj = Developer.objects.get(slug=slugify(stat_detail))
                except Developer.DoesNotExist:
                    obj = Developer.objects.create(name=stat_detail)
                game.developers.add(obj)
        elif stat_type == 'publishers':
            if not game.publishers.all().filter(slug=slugify(stat_detail)).exists():
                try:
                    obj = Publisher.objects.get(slug=slugify(stat_detail))
                except Publisher.DoesNotExist:
                    obj = Publisher.objects.create(name=stat_detail)
                game.publishers.add(obj)
        elif stat_type == 'modes':
            if not game.modes.all().filter(slug=slugify(stat_detail)).exists():
                try:
                    obj = Mode.objects.get(slug=slugify(stat_detail))
                except Mode.DoesNotExist:
                    obj = Mode.objects.create(name=stat_detail)
                game.modes.add(obj)
        else:
            raise ValidationError(f"Invalid Stats type passed: {stat_type}")

        return validated_data

    def update(self, instance, validated_data):
        return super().update(instance, validated_data)
