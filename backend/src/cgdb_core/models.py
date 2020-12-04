from django.db import models
from django.contrib.postgres.fields import ArrayField
from django.contrib.auth.models import AbstractUser

class User(AbstractUser):
    """ extend django user
    """
    pass

class Mode(models.Model):
    """ mode model
        db table name: modes
    """
    name = models.CharField(max_length=100)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    class Meta:
        db_table = 'modes'
    
    def __str__(self):
        return self.name


class Genre(models.Model):
    """ genre model
        db table name: genres
    """
    name = models.CharField(max_length=100)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    class Meta:
        db_table = 'genres'
    
    def __str__(self):
        return self.name


class Series(models.Model):
    """ series model
        db table name: series
    """
    name = models.CharField(max_length=100)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    class Meta:
        db_table = 'series'
    
    def __str__(self):
        return self.name


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
    pictures = models.JSONField()
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    class Meta:
        db_table = 'publishers'
    
    def __str__(self):
        return self.name


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
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    class Meta:
        db_table = 'developers'
    
    def __str__(self):
        return self.name


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
    name = models.CharField(max_length=100)
    description = models.TextField()
    pictures = models.JSONField()
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    class Meta:
        db_table = 'platforms'
    
    def __str__(self):
        return self.name


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

    """
    title = models.CharField(max_length=200)
    description = models.TextField()
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
                    related_query_name="game", blank=True)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    class Meta:
        db_table = 'games'
    
    def __str__(self):
        return self.title
