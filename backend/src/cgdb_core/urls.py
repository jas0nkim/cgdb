from django.urls import path, include
from . import views

urlpatterns = [
    path('platforms/',
        views.PlatformPublicViewSet.as_view({'get': 'list'}),
        name='platform-list'),
    path('platforms/<slug:slug>/',
        views.PlatformPublicViewSet.as_view({'get': 'retrieve'}),
        name='platform-detail'),
    path('games/',
        views.GamePublicViewSet.as_view({'get': 'list'}),
        name='game-list'),
    path('games/<slug:slug>/',
        views.GamePublicViewSet.as_view({'get': 'retrieve'}),
        name='game-detail'),
    path('bot/game/',
        views.WikipediaGameBot.as_view(),
        name='bot-game-post')
]
