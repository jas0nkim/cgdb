from django.contrib import admin
from django.contrib.auth.admin import UserAdmin

from cgdb_core.serializers import GameSerializer
from .models import *

@admin.register(User)
class CgdbUserAdmin(UserAdmin):
    pass

class GameGenreInline(admin.TabularInline):
    model = Game.genres.through

class GameDeveloperInline(admin.TabularInline):
    model = Game.developers.through

class GamePublisherInline(admin.TabularInline):
    model = Game.publishers.through

class GameSeriesInline(admin.TabularInline):
    model = Game.series.through

class GameModeInline(admin.TabularInline):
    model = Game.modes.through

@admin.register(Game)
class GameAdmin(admin.ModelAdmin):
    inlines = [
        GameGenreInline,
        GameDeveloperInline,
        GamePublisherInline,
        GameSeriesInline,
        GameModeInline,
    ]

    prepopulated_fields = {"slug": ("title",)}
    search_fields = ['title__icontains',]
    list_filter = ('platforms',)
    exclude = ('genres', 'developers', 'publishers', 'series', 'modes',)

@admin.register(Platform)
class PlatformAdmin(admin.ModelAdmin):
    prepopulated_fields = {"slug": ("name",)}

@admin.register(Developer)
class DeveloperAdmin(admin.ModelAdmin):
    inlines = [
        GameDeveloperInline,
    ]

    prepopulated_fields = {"slug": ("name",)}
    search_fields = ['name__icontains',]

@admin.register(Publisher)
class PublisherAdmin(admin.ModelAdmin):
    inlines = [
        GamePublisherInline,
    ]

    prepopulated_fields = {"slug": ("name",)}
    search_fields = ['name__icontains',]

@admin.register(Series)
class SeriesAdmin(admin.ModelAdmin):
    inlines = [
        GameSeriesInline,
    ]

    prepopulated_fields = {"slug": ("name",)}
    search_fields = ['name__icontains',]

@admin.register(Genre)
class GenreAdmin(admin.ModelAdmin):
    inlines = [
        GameGenreInline,
    ]

    prepopulated_fields = {"slug": ("name",)}
    search_fields = ['name__icontains',]

@admin.register(Mode)
class ModeAdmin(admin.ModelAdmin):
    inlines = [
        GameModeInline,
    ]

    prepopulated_fields = {"slug": ("name",)}
    search_fields = ['name__icontains',]

@admin.register(Store)
class StoreAdmin(admin.ModelAdmin):
    prepopulated_fields = {"slug": ("name",)}

@admin.register(GamePrice)
class GamePriceAdmin(admin.ModelAdmin):
    pass

@admin.register(GameReleaseDate)
class GameReleaseDateAdmin(admin.ModelAdmin):
    pass

@admin.register(GameFreeOnSubscription)
class GameFreeOnSubscriptionAdmin(admin.ModelAdmin):
    search_fields = ['game__title__icontains',]

@admin.register(Tag)
class TagAdmin(admin.ModelAdmin):
    prepopulated_fields = {"slug": ("tag",)}
    search_fields = ['tag__icontains',]

@admin.register(LanguageCode)
class LanguageCodeAdmin(admin.ModelAdmin):
    pass
