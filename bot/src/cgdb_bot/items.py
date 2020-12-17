# Define here the models for your scraped items
#
# See documentation in:
# https://docs.scrapy.org/en/latest/topics/items.html

import json
from dataclasses import dataclass, field, asdict
from typing import List

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