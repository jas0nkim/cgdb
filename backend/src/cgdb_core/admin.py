from django.contrib import admin
from django.contrib.auth.admin import UserAdmin
from . import models

@admin.register(models.User)
class CgdbUserAdmin(UserAdmin):
    pass

class GameGenreInline(admin.TabularInline):
    model = models.Game.genres.through

class GameDeveloperInline(admin.TabularInline):
    model = models.Game.developers.through

class GamePublisherInline(admin.TabularInline):
    model = models.Game.publishers.through

class GameSeriesInline(admin.TabularInline):
    model = models.Game.series.through

class GameModeInline(admin.TabularInline):
    model = models.Game.modes.through

class GameTagInline(admin.TabularInline):
    model = models.Game.tags.through

class GameImageInline(admin.TabularInline):
    model = models.Game.images.through

@admin.register(models.Game)
class GameAdmin(admin.ModelAdmin):
    inlines = [
        GameImageInline,
        GameGenreInline,
        GameDeveloperInline,
        GamePublisherInline,
        GameSeriesInline,
        GameModeInline,
        GameTagInline,
    ]

    prepopulated_fields = {"slug": ("title",)}
    search_fields = ['title__icontains',]
    list_filter = ('platforms', 'active',)
    exclude = (
        'genres',
        'developers',
        'publishers',
        'series',
        'modes',
        'tags',
        'images',
    )
    list_display = ['title', 'active', 'created_at',]

@admin.register(models.Platform)
class PlatformAdmin(admin.ModelAdmin):
    prepopulated_fields = {"slug": ("name",)}

@admin.register(models.Developer)
class DeveloperAdmin(admin.ModelAdmin):
    inlines = [
        GameDeveloperInline,
    ]

    prepopulated_fields = {"slug": ("name",)}
    search_fields = ['name__icontains',]

@admin.register(models.Publisher)
class PublisherAdmin(admin.ModelAdmin):
    inlines = [
        GamePublisherInline,
    ]

    prepopulated_fields = {"slug": ("name",)}
    search_fields = ['name__icontains',]

@admin.register(models.Series)
class SeriesAdmin(admin.ModelAdmin):
    inlines = [
        GameSeriesInline,
    ]

    prepopulated_fields = {"slug": ("name",)}
    search_fields = ['name__icontains',]

@admin.register(models.Genre)
class GenreAdmin(admin.ModelAdmin):
    inlines = [
        GameGenreInline,
    ]

    prepopulated_fields = {"slug": ("name",)}
    search_fields = ['name__icontains',]

@admin.register(models.Mode)
class ModeAdmin(admin.ModelAdmin):
    inlines = [
        GameModeInline,
    ]

    prepopulated_fields = {"slug": ("name",)}
    search_fields = ['name__icontains',]

@admin.register(models.Store)
class StoreAdmin(admin.ModelAdmin):
    prepopulated_fields = {"slug": ("name",)}

@admin.register(models.GamePrice)
class GamePriceAdmin(admin.ModelAdmin):
    pass

@admin.register(models.GameReleaseDate)
class GameReleaseDateAdmin(admin.ModelAdmin):
    pass

@admin.register(models.GameFreeOnSubscription)
class GameFreeOnSubscriptionAdmin(admin.ModelAdmin):
    search_fields = ['game__title__icontains',]
    list_display = ['game', 'platform', 'entered', 'left']

@admin.register(models.Tag)
class TagAdmin(admin.ModelAdmin):
    prepopulated_fields = {"slug": ("tag",)}
    search_fields = ['tag__icontains',]

@admin.register(models.LanguageCode)
class LanguageCodeAdmin(admin.ModelAdmin):
    pass

@admin.register(models.Image)
class ImageAdmin(admin.ModelAdmin):
    pass
