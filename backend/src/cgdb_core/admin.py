from django.contrib import admin
from django.contrib.auth.admin import UserAdmin
from .models import User, Game, Platform, Developer, Publisher, Series, Genre, Mode

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
