from django.db import models
from django.contrib.postgres.fields import ArrayField
from django.contrib.auth.models import AbstractUser
from django.utils.text import slugify

class User(AbstractUser):
    """ extend django user
    """
    pass

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

    def save(self, *args, **kwargs):
        self.slug = slugify(self.name)
        super(Mode, self).save(*args, **kwargs)


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

    def save(self, *args, **kwargs):
        self.slug = slugify(self.name)
        super(Genre, self).save(*args, **kwargs)


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

    def save(self, *args, **kwargs):
        self.slug = slugify(self.name)
        super(Series, self).save(*args, **kwargs)


class Publisher(models.Model):
    """ publisher model
        db table name: publishers
        pictures format:
            {
                "high": "link...",
                "mid": "link...",
                "low": "link..."
            }
    """
    name = models.CharField(max_length=100)
    description = models.TextField()
    slug = models.SlugField(max_length = 100, unique=True)
    pictures = models.JSONField()
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    class Meta:
        db_table = 'publishers'
    
    def __str__(self):
        return self.name

    def save(self, *args, **kwargs):
        self.slug = slugify(self.name)
        super(Publisher, self).save(*args, **kwargs)


class Developer(models.Model):
    """ developer model
        db table name: developers
        pictures format:
            {
                "high": "link...",
                "mid": "link...",
                "low": "link..."
            }
    """
    name = models.CharField(max_length=100)
    description = models.TextField()
    pictures = models.JSONField()
    slug = models.SlugField(max_length = 100, unique=True)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    class Meta:
        db_table = 'developers'

    def __str__(self):
        return self.name

    def save(self, *args, **kwargs):
        self.slug = slugify(self.name)
        super(Developer, self).save(*args, **kwargs)


class Tag(models.Model):
    tag = models.CharField(max_length=200, unique=True)
    slug = models.SlugField(max_length=200, unique=True)
    created_at = models.DateTimeField(auto_now_add=True)

    class Meta:
        db_table = 'tags'

    def __str__(self):
        return self.tag

    def save(self, *args, **kwargs):
        self.slug = slugify(self.tag, allow_unicode=True)
        super(Tag, self).save(*args, **kwargs)


class Platform(models.Model):
    """ plateform model
        db table name: platforms
        pictures format:
            {
                "high": "link...",
                "mid": "link...",
                "low": "link..."
            }
    """
    name = models.CharField(max_length = 100)
    description = models.TextField()
    pictures = models.JSONField()
    slug = models.SlugField(max_length = 100, unique=True)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    class Meta:
        db_table = 'platforms'
    
    def __str__(self):
        return self.name

    def save(self, *args, **kwargs):
        self.slug = slugify(self.name)
        super(Platform, self).save(*args, **kwargs)


class Game(models.Model):
    """ game model
        db table name: games
        pictures format:
            [
                {
                    "high": "link...",
                    "mid": "link...",
                    "low": "link..."
                },
                {
                    "high": "link...",
                    "mid": "link...",
                    "low": "link..."
                },
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
                "ko": "한글 제목..."
            }
        description_lc format:
            {
                "en": "english description...",
                "ko": "한글 내용..."
            }

    """
    title = models.CharField(max_length = 200)
    title_lc = models.JSONField()
    description = models.TextField()
    description_lc = models.JSONField()
    pictures = ArrayField(models.JSONField(), size=10)
    links = models.JSONField()
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

    def __str__(self):
        return self.title

    def save(self, *args, **kwargs):
        self.slug = slugify(self.title)
        super(Game, self).save(*args, **kwargs)
        self._save_tags()

    def _save_tags(self):
        """
        save tags automatically based on 'title_lc'
        """
        for iso in self.title_lc:
            self.tags.get_or_create(tag=self.title_lc.get(iso))


class LanguageCode(models.Model):
    iso = models.CharField(max_length=5)
    language = models.CharField(max_length=100, blank=True, null=True)
    language_eng = models.CharField(max_length=100)

    class Meta:
        db_table = 'language_codes'

    def __str__(self):
        return f'{self.language_eng} ({self.iso})'
