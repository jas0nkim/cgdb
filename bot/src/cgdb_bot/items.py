# Define here the models for your scraped items
#
# See documentation in:
# https://docs.scrapy.org/en/latest/topics/items.html

import json
from dataclasses import dataclass, field, asdict
from typing import List

@dataclass(init=True)
class WikipediaGameItem:
    """
    Scraped data from Wikipedia Game page
    """
    title: str
    description: str
    pictures: List[str] = field(metadata={'values':'picture_links'})
    developers: List[str]
    publishers: List[str]
    series: List[str]
    genres: List[str]
    modes: List[str]

    def asjson(self, stream=False, ascii=False):
        if stream:
            return json.dump(asdict(self), ensure_ascii=ascii)
        return json.dumps(asdict(self), ensure_ascii=ascii)