import logging
from urllib.parse import urljoin, urlparse
from scrapy import Request
from cgdb_bot.items import SteampoweredGameItem

class SteampoweredParser:
    """
    Steampowered page parser
    """
    def __init__(self):
        self.logger = logging.getLogger(__name__)
        self.meta_data = {}

    def parse_search_results_page(self, response, title):
        """
        parse search results page and link to game detail page
        """
        if response.status != 200:
            # broken link or inactive
            error_msg = f"Search result page not working: HTTP status code - {response.status} - {response.url}"
            self.logger.error(error_msg)
            yield SteampoweredGameItem(title=title,
                                    link=response.url,
                                    _err=error_msg)
        if title != self._extract_title_from_search():
            error_msg = f"Unable to find - {title} - from search screen - {response.url}"
            self.logger.error(error_msg)
            yield SteampoweredGameItem(title=title,
                                    link=response.url,
                                    _err=error_msg)        
        url = self._extract_detail_link_from_search_page()
        if not url:
            error_msg = f"Unable to find detail page link - {title} - from search screen - {response.url}"
            self.logger.error(error_msg)
            yield SteampoweredGameItem(title=title,
                                    link=response.url,
                                    _err=error_msg)
        yield Request(url,
                callback=self.parse_game_detail_page,
                cb_kwargs={'title': title})

    def _extract_title_from_search_page(response):
        return response.xpath("""//*[@id="search_resultsRows"]
                                //a[1]
                                //div[contains(@class, "search_name")]
                                /span[contains(@class, "title")]/text()"""
                            ).get()
    def _extract_detail_link_from_search_page(response):
        return response.xpath("""//*[@id="search_resultsRows"]
                                //a[1]/@href""").get()

    def parse_game_detail_page(self, response, title=None):
        """
        parse game detail page
        """
        if response.status != 200:
            # broken link or inactive
            error_msg = f"Link not working: HTTP status code - {response.status} - {response.url}"
            self.logger.error(error_msg)
            yield SteampoweredGameItem(title=title,
                                    link=response.url,
                                    _err=error_msg)

        yield SteampoweredGameItem(
                    title=self._extract_title(response),
                    description=self._extract_description(response),
                    pictures=self._extract_pictures(response),
                    developers=self._extract_developers(response),
                    publishers=self._extract_publishers(response),
                    franchise=self._extract_franchise(response),
                    genres=self._extract_genres(response),
                    release_date=self._extract_release_date(response),
                    link=response.url,
                )

    def _extract_title(self, response):
        if not self.meta_data:
            self.meta_data = self._extract_meta_data(response)
        if 'title' in self.meta_data and len(self.meta_data['title']) > 0:
            return self.meta_data['title'][0]
        else:
            self.logger.error('No Title found - %s', response.url)
            return None

    def _extract_description(self, response):
        description = response.xpath('//div[contains(@class,"game_description_snippet")]/text()').get()
        if description:
            return description.strip()
        else:
            self.logger.warning('No Description found - %s', response.url)
            return None

    def _extract_pictures(self, response):
        pictures = []
        image_url = response.xpath('//meta[@property="og:image"]/@content').get()
        if image_url:
            # remove query string from the url
            pictures.append(urljoin(image_url, urlparse(image_url).path))
            return pictures
        else:
            self.logger.warning('No Pictures found - %s', response.url)
            return []

    def _extract_developers(self, response):
        if not self.meta_data:
            self.meta_data = self._extract_meta_data(response)
        if 'developers' in self.meta_data and len(self.meta_data['developers']) > 0:
            return self.meta_data['developers']
        else:
            self.logger.warning('No Developers found - %s', response.url)
            return []

    def _extract_publishers(self, response):
        if not self.meta_data:
            self.meta_data = self._extract_meta_data(response)
        if 'publishers' in self.meta_data and len(self.meta_data['publishers']) > 0:
            return self.meta_data['publishers']
        else:
            self.logger.warning('No Publishers found - %s', response.url)
            return []

    def _extract_franchise(self, response):
        if not self.meta_data:
            self.meta_data = self._extract_meta_data(response)
        if 'franchise' in self.meta_data and len(self.meta_data['franchise']) > 0:
            return self.meta_data['franchise'][0]
        else:
            self.logger.warning('No Franchise found - %s', response.url)
            return None

    def _extract_genres(self, response):
        if not self.meta_data:
            self.meta_data = self._extract_meta_data(response)
        if 'genres' in self.meta_data and len(self.meta_data['genres']) > 0:
            return self.meta_data['genres']
        else:
            self.logger.warning('No Genres found - %s', response.url)
            return []

    def _extract_release_date(self, response):
        if not self.meta_data:
            self.meta_data = self._extract_meta_data(response)
        if 'release_date' in self.meta_data and len(self.meta_data['release_date']) > 0:
            return self.meta_data['release_date'][0]
        else:
            self.logger.warning('No Release Date found - %s', response.url)
            return None

    def _extract_meta_data(self, response):
        lookup_keys = {'Title:': 'title',
                    'Genre:': 'genres',
                    'Developer:': 'developers',
                    'Publisher:': 'publishers',
                    'Franchise:': 'franchise',
                    'Release Date:': 'release_date',}
        data = response.xpath("""//div[contains(@class,"game_meta_data")]
                        //div[contains(@class,"game_details")]
                        //div[contains(@class,"details_block")][1]
                        //text()[normalize-space(.)]""").getall()
        i = 0
        meta_data = {}
        current_meta_data_key = None
        while i < len(data):
            if data[i] in lookup_keys:
                if lookup_keys[data[i]] not in meta_data:
                    current_meta_data_key = lookup_keys[data[i]]
                    meta_data[current_meta_data_key] = []
            else:
                trimmed = data[i].rstrip(',').lstrip(',').strip()
                if current_meta_data_key and trimmed:
                    if current_meta_data_key == 'genres':
                        trimmed = trimmed.lower()
                    meta_data[current_meta_data_key].append(trimmed)
            i += 1
        return meta_data
                
