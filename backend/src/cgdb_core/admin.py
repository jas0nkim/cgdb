from django.contrib import admin
from django.contrib.auth.admin import UserAdmin
from .models import (User,
                    Game,
                    Platform,
                    Developer,
                    Publisher,
                    Series,
                    Genre,
                    Mode,
                    Store,
                    GamePrice,
                    Tag,
                    LanguageCode)

@admin.register(User)
class CgdbUserAdmin(UserAdmin):
    pass

@admin.register(Game)
class GameAdmin(admin.ModelAdmin):
    prepopulated_fields = {"slug": ("title",)}

@admin.register(Platform)
class PlatformAdmin(admin.ModelAdmin):
    prepopulated_fields = {"slug": ("name",)}

@admin.register(Developer)
class DeveloperAdmin(admin.ModelAdmin):
    prepopulated_fields = {"slug": ("name",)}

@admin.register(Publisher)
class PublisherAdmin(admin.ModelAdmin):
    prepopulated_fields = {"slug": ("name",)}

@admin.register(Series)
class SeriesAdmin(admin.ModelAdmin):
    prepopulated_fields = {"slug": ("name",)}

@admin.register(Genre)
class GenreAdmin(admin.ModelAdmin):
    prepopulated_fields = {"slug": ("name",)}

@admin.register(Mode)
class ModeAdmin(admin.ModelAdmin):
    prepopulated_fields = {"slug": ("name",)}

@admin.register(Store)
class StoreAdmin(admin.ModelAdmin):
    prepopulated_fields = {"slug": ("name",)}

@admin.register(GamePrice)
class GamePriceAdmin(admin.ModelAdmin):
    pass

@admin.register(Tag)
class TagAdmin(admin.ModelAdmin):
    prepopulated_fields = {"slug": ("tag",)}

@admin.register(LanguageCode)
class LanguageCodeAdmin(admin.ModelAdmin):
    pass
