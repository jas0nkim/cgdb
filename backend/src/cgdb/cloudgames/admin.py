from django.contrib import admin
from .models import Game, Platform, Developer, Publisher, Series, Genre, Mode

@admin.register(Game)
class GameAdmin(admin.ModelAdmin):
    pass

@admin.register(Platform)
class PlatformAdmin(admin.ModelAdmin):
    pass

@admin.register(Developer)
class DeveloperAdmin(admin.ModelAdmin):
    pass

@admin.register(Publisher)
class PublisherAdmin(admin.ModelAdmin):
    pass

@admin.register(Series)
class SeriesAdmin(admin.ModelAdmin):
    pass

@admin.register(Genre)
class GenreAdmin(admin.ModelAdmin):
    pass

@admin.register(Mode)
class ModeAdmin(admin.ModelAdmin):
    pass
