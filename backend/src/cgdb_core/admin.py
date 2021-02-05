from django.contrib import admin
from django.contrib.auth.admin import UserAdmin
from .models import *

@admin.register(User)
class CgdbUserAdmin(UserAdmin):
    pass

@admin.register(Game)
class GameAdmin(admin.ModelAdmin):
    prepopulated_fields = {"slug": ("title",)}
    search_fields = ['title__icontains']

@admin.register(Platform)
class PlatformAdmin(admin.ModelAdmin):
    prepopulated_fields = {"slug": ("name",)}

@admin.register(Developer)
class DeveloperAdmin(admin.ModelAdmin):
    prepopulated_fields = {"slug": ("name",)}
    search_fields = ['name__icontains']

@admin.register(Publisher)
class PublisherAdmin(admin.ModelAdmin):
    prepopulated_fields = {"slug": ("name",)}
    search_fields = ['name__icontains']

@admin.register(Series)
class SeriesAdmin(admin.ModelAdmin):
    prepopulated_fields = {"slug": ("name",)}
    search_fields = ['name__icontains']

@admin.register(Genre)
class GenreAdmin(admin.ModelAdmin):
    prepopulated_fields = {"slug": ("name",)}
    search_fields = ['name__icontains']

@admin.register(Mode)
class ModeAdmin(admin.ModelAdmin):
    prepopulated_fields = {"slug": ("name",)}
    search_fields = ['name__icontains']

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
    search_fields = ['game__title__icontains']

@admin.register(Tag)
class TagAdmin(admin.ModelAdmin):
    prepopulated_fields = {"slug": ("tag",)}
    search_fields = ['tag__icontains']

@admin.register(LanguageCode)
class LanguageCodeAdmin(admin.ModelAdmin):
    pass
