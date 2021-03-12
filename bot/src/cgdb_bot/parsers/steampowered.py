import logging
from cgdb_bot.items import SteampoweredGameItem, ErrorItem
from cgdb_bot.settings import (STEAMPOWERED_PRESET_COOKIES,
                            STEAMPOWERED_TITLE_REMOVE_CHARS)
from cgdb_bot.utils import clean_url

class SteampoweredParser:
    """
    Steampowered page parser
    """
    def __init__(self):
        self.logger = logging.getLogger(__name__)
        self.meta_data = {}

    def _clean_title(self, title):
        if isinstance(title, str):
            title = ''.join(t for t in title
                            if t not in STEAMPOWERED_TITLE_REMOVE_CHARS)
        return title

    def _lookup_title(self, response, given_title):
        found = False
        no_row = 1
        max_title_lookup = 3
        while no_row <= max_title_lookup:
            extracted_title = self._clean_title(
                                self._extract_title_from_search_page(
                                                            response,
                                                            no_row))
            if not extracted_title or given_title.lower() != extracted_title.lower():
                no_row += 1
            else:
                found = True
                break
        return (found, no_row)

    def parse_search_results_page(self, response, title):
        """
        parse search results page and link to game detail page
        """
        if response.status != 200:
            # broken link or inactive
            error_msg = f"Search result page not working: HTTP status code - {response.status} - {response.url}"
            self.logger.error(error_msg)
            yield ErrorItem(title=title,
                            link=response.url,
                            message=error_msg)
        else:
            title_found, no_row = self._lookup_title(response, title)
            if not title_found:
                error_msg = f"Unable to find - {title} - from search screen - {response.url}"
                self.logger.error(error_msg)
                yield ErrorItem(title=title,
                                link=response.url,
                                message=error_msg)
            else:
                extracted_url = self._extract_detail_link_from_search_page(
                                                                response,
                                                                no_row)

                if not extracted_url:
                    error_msg = f"Unable to find detail page link - {title} - from search screen - {response.url}"
                    self.logger.error(error_msg)
                    yield ErrorItem(title=title,
                                    link=response.url,
                                    message=error_msg)
                else:
                    yield response.follow(extracted_url,
                                callback=self.parse_game_detail_page,
                                cb_kwargs={'title': title},
                                cookies=STEAMPOWERED_PRESET_COOKIES)

    def _extract_title_from_search_page(self, response, no_row=1):
        return response.xpath(f"""//*[@id="search_resultsRows"]
                                //a[{no_row}]
                                //div[contains(@class, "search_name")]
                                /span[contains(@class, "title")]/text()"""
                            ).get()

    def _extract_detail_link_from_search_page(self, response, no_row=1):
        return response.xpath(f"""//*[@id="search_resultsRows"]
                                //a[{no_row}]/@href""").get()

    def parse_game_detail_page(self, response, title=None):
        """
        parse game detail page
        """
        if response.status != 200:
            # broken link or inactive
            error_msg = f"Link not working: HTTP status code - {response.status} - {response.url}"
            self.logger.error(error_msg)
            yield ErrorItem(title=title,
                            link=response.url,
                            message=error_msg)
        else:
            yield SteampoweredGameItem(
                        title=self._clean_title(
                                    self._extract_title(response)),
                        description=self._extract_description(response),
                        pictures=self._extract_pictures(response),
                        developers=self._extract_developers(response),
                        publishers=self._extract_publishers(response),
                        franchise=self._extract_franchise(response),
                        genres=self._extract_genres(response),
                        release_date=self._extract_release_date(response),
                        link=clean_url(response.url),
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
            pictures.append(clean_url(image_url))
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
                
