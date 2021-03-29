# Define here the models for your scraped items
#
# See documentation in:
# https://docs.scrapy.org/en/latest/topics/items.html

import json
from dataclasses import dataclass, field, asdict
from typing import List
from cgdb_bot.settings import WIKIPEDIA_LOCAL_TITLE_SPLIT_CHAR

@dataclass
class WikipediaGameItem:
    """
    Scraped data from Wikipedia Game page
    """
    english_title: str = None
    language: str = None
    title_lc: str = None
    description_lc: str = None
    pictures: List[str] = field(default_factory=list, metadata={'values':'picture_links'})
    developers: List[str] = field(default_factory=list)
    publishers: List[str] = field(default_factory=list)
    series: List[str] = field(default_factory=list)
    genres: List[str] = field(default_factory=list)
    modes: List[str] = field(default_factory=list)
    link: str = None
    inter_languages: List[dict] = field(default_factory=list)
    platform: str = None

    def asjson(self):
        return json.dumps(asdict(self))

@dataclass
class RedditStadiaWikiGame:
    """
    Scraped data from Reddit Stadia Wiki Games List page
    """
    title: str = None
    stadia_link: str = None
    release_date: str = None

    def asjson(self):
        return json.dumps(asdict(self))

@dataclass
class RedditStadiaWikiGamePro:
    """
    Scraped Stadia Pro Games data from Reddit Wiki page
    """
    entered_titles: str = None
    left_titles: str = None
    event_date: str = None

    def asjson(self):
        return json.dumps(asdict(self))

@dataclass
class RedditStadiaStatDetail:
    """
    Scraped Stadia Game Statistics item from Wiki page
    """
    title: str = None
    stat_type: str = None
    stat_detail: str = None

    def asjson(self):
        return json.dumps(asdict(self))

@dataclass
class SteampoweredGameItem:
    """
    Scraped data from Steampowered Game page
    """
    title: str = None
    description: str = None
    pictures: List[str] = field(default_factory=list, metadata={'values':'picture_links'})
    developers: List[str] = field(default_factory=list)
    publishers: List[str] = field(default_factory=list)
    franchise: str = None
    genres: List[str] = field(default_factory=list)
    release_date: str = None
    link: str = None
    platform: str = None

    def asjson(self):
        return json.dumps(asdict(self))

@dataclass
class MetacriticGameItem:
    """
    Scraped data from Metacritic Game page
    """
    title: str = None
    description: str = None
    pictures: List[str] = field(default_factory=list, metadata={'values':'picture_links'})
    developers: List[str] = field(default_factory=list)
    genres: List[str] = field(default_factory=list)
    rating: str = None
    link: str = None
    platform: str = None

    def asjson(self):
        return json.dumps(asdict(self))

@dataclass
class ErrorItem:
    """
    Any error on parsing
    """
    title: str = None
    link: str = None
    message: str = None

    def asjson(self):
        return json.dumps(asdict(self))
