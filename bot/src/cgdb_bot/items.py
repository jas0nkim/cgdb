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
    english_title: str
    language: str
    title_lc: str
    description_lc: str
    pictures: List[str] = field(metadata={'values':'picture_links'})
    developers: List[str]
    publishers: List[str]
    series: List[str]
    genres: List[str]
    modes: List[str]
    link: str
    platform: str = None

    def asjson(self):
        return json.dumps(asdict(self))