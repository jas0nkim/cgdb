import logging
from django.db import models
from django.db.utils import IntegrityError
from django.contrib.auth.models import AbstractUser
from django.utils.text import slugify

from django import forms

class MyJSONFormField(forms.JSONField):
    empty_values = []

class MyJSONField(models.JSONField):
    def formfield(self, **kwargs):
        return super().formfield(**{"form_class": MyJSONFormField, **kwargs})

class User(AbstractUser):
    """ extend django user
    """
    pass

class Image(models.Model):
    source_url = models.CharField(max_length=255)
    s3_url = models.CharField(max_length=255, blank=True, null=True)

    class Meta:
        db_table = 'images'

    def __str__(self):
        return self.s3_url

class Mode(models.Model):
    """ mode model
        db table name: modes
    """
    name = models.CharField(max_length=100)
    slug = models.SlugField(max_length = 100, unique=True)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    class Meta:
        db_table = 'modes'
    
    def __str__(self):
        return self.name

    def save(self, force_insert=False, force_update=False, using=None,
            update_fields=None):
        self.slug = slugify(self.name)
        super().save(force_insert, force_update, using, update_fields)

class Genre(models.Model):
    """ genre model
        db table name: genres
    """
    name = models.CharField(max_length=100)
    slug = models.SlugField(max_length = 100, unique=True)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    class Meta:
        db_table = 'genres'
    
    def __str__(self):
        return self.name

    def save(self, force_insert=False, force_update=False, using=None,
            update_fields=None):
        self.slug = slugify(self.name)
        super().save(force_insert, force_update, using, update_fields)

class Series(models.Model):
    """ series model
        db table name: series
    """
    name = models.CharField(max_length=100)
    slug = models.SlugField(max_length = 100, unique=True)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    class Meta:
        db_table = 'series'
        verbose_name_plural = 'Series'
    
    def __str__(self):
        return self.name

    def save(self, force_insert=False, force_update=False, using=None,
            update_fields=None):
        self.slug = slugify(self.name)
        super().save(force_insert, force_update, using, update_fields)

class Publisher(models.Model):
    """ publisher model
        db table name: publishers
        pictures format:
            [
                "link1...",
                "link2...",
                "link3...",
                ...
            ]
    """
    name = models.CharField(max_length=100)
    description = models.TextField(null=True, blank=True)
    slug = models.SlugField(max_length = 100, unique=True)
    pictures = models.JSONField(blank=True, default=list)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    class Meta:
        db_table = 'publishers'
    
    def __str__(self):
        return self.name

    def clean(self, *args, **kwargs):
        if self.pictures is None:
            self.pictures = []

    def save(self, force_insert=False, force_update=False, using=None,
            update_fields=None):
        self.slug = slugify(self.name)
        super().save(force_insert, force_update, using, update_fields)

class Developer(models.Model):
    """ developer model
        db table name: developers
        pictures format:
            [
                "link1...",
                "link2...",
                "link3...",
                ...
            ]
    """
    name = models.CharField(max_length=100)
    description = models.TextField(null=True, blank=True)
    pictures = models.JSONField(blank=True, default=list)
    images = models.ManyToManyField(
                    Image,
                    related_name="developers",
                    related_query_name="developer", blank=True)
    slug = models.SlugField(max_length = 100, unique=True)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    class Meta:
        db_table = 'developers'

    def __str__(self):
        return self.name

    def clean(self, *args, **kwargs):
        if self.pictures is None:
            self.pictures = []

    def save(self, force_insert=False, force_update=False, using=None,
            update_fields=None):
        self.slug = slugify(self.name)
        super().save(force_insert, force_update, using, update_fields)

class Store(models.Model):
    """ store model
        db table name: stores
    """
    name = models.CharField(max_length=100)
    slug = models.SlugField(max_length = 100, unique=True)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    class Meta:
        db_table = 'stores'
    
    def __str__(self):
        return self.name

    def save(self, force_insert=False, force_update=False, using=None,
            update_fields=None):
        self.slug = slugify(self.name)
        super().save(force_insert, force_update, using, update_fields)

class Tag(models.Model):
    tag = models.CharField(max_length=200, unique=True)
    slug = models.SlugField(max_length=200, unique=True)
    created_at = models.DateTimeField(auto_now_add=True)

    class Meta:
        db_table = 'tags'

    def __str__(self):
        return self.tag

    def save(self, force_insert=False, force_update=False, using=None,
            update_fields=None):
        self.slug = slugify(self.tag, allow_unicode=True)
        super().save(force_insert, force_update, using, update_fields)

class Platform(models.Model):
    """ plateform model
        db table name: platforms
        verdict:
            [
                "...",
                "...",
                ...
            ]
        available_countries:
            [
                "US",
                "Canada",
                "South Korea",
                ...
            ]
        supported_devices:
            [
                "Windows 10 PCs",
                "Mac",
                "Android Phones/Tablets",
                ...
            ]
        pictures format:
            [
                "link1...",
                "link2...",
                "link3...",
                ...
            ]
    """
    name = models.CharField(max_length = 100)
    description = models.TextField(null=True, blank=True)
    verdict = models.JSONField(blank=True, default=list)
    available_countries = models.JSONField(blank=True, default=list)
    internet_requirements = models.TextField(null=True, blank=True)
    supported_devices = models.JSONField(blank=True, default=list)
    pictures = models.JSONField(blank=True, default=list)
    images = models.ManyToManyField(
                    Image,
                    related_name="platforms",
                    related_query_name="platform", blank=True)
    stores = models.ManyToManyField(
                    Store,
                    related_name="platforms",
                    related_query_name="platform", blank=True)
    slug = models.SlugField(max_length = 100, unique=True)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    class Meta:
        db_table = 'platforms'
    
    def __str__(self):
        return self.name

    def clean(self, *args, **kwargs):
        if self.verdict is None:
            self.verdict = []
        if self.available_countries is None:
            self.available_countries = []
        if self.supported_devices is None:
            self.supported_devices = []
        if self.pictures is None:
            self.pictures = []

    def save(self, force_insert=False, force_update=False, using=None,
            update_fields=None):
        self.slug = slugify(self.name)
        super().save(force_insert, force_update, using, update_fields)

class Game(models.Model):
    """ game model
        db table name: games
        pictures format:
            [
                "link1...",
                "link2...",
                "link3...",
                ...
            ]
        links format:
            {
                "wikipedia": "link...",
                "facebook": "link...",
                ...
            }
        title_lc format:
            {
                "en": "english title...",
                "ko": "한글 제목...",
                ...
            }
        description_lc format:
            {
                "en": "english description...",
                "ko": "한글 내용...",
                ...
            }

    """
    ESRB_CHOICES = [
        ('NA', 'Not available'),
        ('E', 'Everyone'),
        ('E10+', 'Everyone 10+'),
        ('T', 'Teen'),
        ('M', 'Mature 17+'),
    ]

    title = models.CharField(max_length = 200)
    title_lc = models.JSONField(blank=True, default=dict)
    description = models.TextField(null=True, blank=True)
    description_lc = models.JSONField(blank=True, default=dict)
    esrb = models.CharField(max_length=4, default='NA', choices=ESRB_CHOICES)
    pictures = models.JSONField(blank=True, default=list)
    links = models.JSONField(blank=True, default=dict)
    active = models.BooleanField(default=False)
    images = models.ManyToManyField(
                    Image,
                    related_name="games",
                    related_query_name="game", blank=True)
    developers = models.ManyToManyField(
                    Developer,
                    related_name="games",
                    related_query_name="game")
    publishers = models.ManyToManyField(
                    Publisher,
                    related_name="games",
                    related_query_name="game")
    series = models.ManyToManyField(
                    Series,
                    related_name="games",
                    related_query_name="game", blank=True)
    platforms = models.ManyToManyField(
                    Platform,
                    related_name="games",
                    related_query_name="game")
    genres = models.ManyToManyField(
                    Genre,
                    related_name="games",
                    related_query_name="game")
    modes = models.ManyToManyField(
                    Mode,
                    related_name="games",
                    related_query_name = "game")
    tags = models.ManyToManyField(
                    Tag,
                    related_name = "games",
                    related_query_name="game", blank = True)
    slug = models.SlugField(max_length = 200, unique = True)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    class Meta:
        db_table = 'games'

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.logger = logging.getLogger(__name__)

    def __str__(self):
        return self.title

    def clean(self, *args, **kwargs):
        if self.title_lc is None:
            self.title_lc = {}
        if self.description_lc is None:
            self.description_lc = {}
        if self.pictures is None:
            self.pictures = []
        if self.links is None:
            self.links = {}

    def save(self, force_insert=False, force_update=False, using=None,
            update_fields=None):
        self.slug = slugify(self.title)
        super().save(force_insert, force_update, using, update_fields)
        self._save_tags()

    def _save_tags(self):
        """
        save tags automatically based on 'title_lc'
        """
        for iso in self.title_lc:
            try:
                tag = Tag.objects.get(slug=slugify(self.title_lc.get(iso),
                                                allow_unicode=True))
            except Tag.DoesNotExist:
                tag = Tag(tag=self.title_lc.get(iso))
            if tag.pk is None: # if not saved db yet
                try:
                    tag.save()
                except IntegrityError as err:
                    """
                    known errors:
                    - case sensitive on tag field, but not on slug field
                    """
                    self.logger.error('[%s] - %s', iso, str(err))
                    continue
            if not self.tags.filter(tag=self.title_lc.get(iso)).exists():
                self.tags.add(tag)

class GamePrice(models.Model):
    """ game price model
        db table name: game_prices
    """
    game = models.ForeignKey(Game,
                        on_delete=models.CASCADE,
                        related_name='game_prices',
                        related_query_name='game_price')
    store = models.ForeignKey(Store,
                        on_delete=models.CASCADE,
                        related_name='game_prices',
                        related_query_name='game_price')
    price = models.DecimalField(max_digits=8, decimal_places=2, default=0.00)
    price_with_subscription = models.DecimalField(
                                    max_digits=8,
                                    decimal_places=2,
                                    default=0.00)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    class Meta:
        db_table = 'game_prices'

    def __str__(self):
        return f"{self.game} price @{self.store}"

class GameReleaseDate(models.Model):
    """ game release model
        db table name: game_release_dates
    """
    game = models.ForeignKey(Game,
                        on_delete=models.CASCADE,
                        related_name='game_release_dates',
                        related_query_name='game_release_date')
    platform = models.ForeignKey(Platform,
                        on_delete=models.CASCADE,
                        related_name='game_release_dates',
                        related_query_name='game_release_date')
    release_date = models.DateField(default=None)

    class Meta:
        db_table = 'game_release_dates'

    def __str__(self):
        return f"{self.game} released on {self.release_date} @{self.platform}"

class GameFreeOnSubscription(models.Model):
    """ game release model
        db table name: game_free_on_subscriptions
    """
    game = models.ForeignKey(Game,
                        on_delete=models.CASCADE,
                        related_name='game_free_on_subscriptions',
                        related_query_name='game_free_on_subscription')
    platform = models.ForeignKey(Platform,
                        on_delete=models.CASCADE,
                        related_name='game_free_on_subscriptions',
                        related_query_name='game_free_on_subscription')
    entered = models.DateField(default=None)
    left = models.DateField(default=None, null=True, blank=True)

    class Meta:
        db_table = 'game_free_on_subscriptions'

    def __str__(self):
        return f"{self.game} w/ {self.platform} subscription"

class LanguageCode(models.Model):
    iso = models.CharField(max_length=10, unique=True)
    language = models.CharField(max_length=255, blank=True, null=True)
    language_eng = models.CharField(max_length=100)

    class Meta:
        db_table = 'language_codes'

    def __str__(self):
        return f'{self.language_eng} ({self.iso})'
