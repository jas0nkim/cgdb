import logging
from cgdb_bot.items import MetacriticGameItem, ErrorItem
from cgdb_bot.settings import (STEAMPOWERED_PRESET_COOKIES,
                            STEAMPOWERED_TITLE_REMOVE_CHARS,
                            STEAMPOWERED_TITLE_SEARCH_MAX_LOOKUP)
from cgdb_bot.utils import clean_url

class MetacriticParser:
    """
    Metacritic page parser
    """
    def __init__(self):
        self.logger = logging.getLogger(__name__)

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
            yield MetacriticGameItem(
                        title=self._extract_title(response),
                        description=self._extract_description(response),
                        pictures=self._extract_pictures(response),
                        developers=self._extract_developers(response),
                        genres=self._extract_genres(response),
                        rating=self._extract_rating(response),
                        link=clean_url(response.url),
                    )

    def _extract_title(self, response):
        title = response.xpath('//div[contains(@class,"product_title")]//h1/text()').get()
        if title:
            return title.strip()
        else:
            self.logger.error('No Title found - %s', response.url)
            return None

    def _extract_description(self, response):
        description = response.xpath("""//div[contains(@class,"main_details")]
                                /ul[contains(@class,"summary_details")]
                                /li[contains(@class,"product_summary")]
                                /span[contains(@class,"data")]
                                //span[contains(@class,"blurb_expanded")]
                                /text()[normalize-space(.)]""").getall()
        if description:
            return '\n\n'.join([d.replace('\r','') for d in description ])
        else:
            self.logger.warning('No Description found - %s', response.url)
            return None

    def _extract_pictures(self, response):
        _metacritic_placeholder_image = "https://static.metacritic.com/images/products/games/98w-game.jpg"
        pictures = []
        image_url = response.xpath('//meta[@property="og:image"]/@content').get()
        if image_url and image_url != _metacritic_placeholder_image:
            # remove query string from the url
            pictures.append(clean_url(image_url))
            return pictures
        else:
            self.logger.warning('No Pictures found - %s', response.url)
            return []

    def _extract_developers(self, response):
        developers = response.xpath("""//div[contains(@class,"side_details")]
                                /ul[contains(@class,"summary_details")]
                                /li[contains(@class,"developer")]
                                /span[contains(@class,"data")]
                                /a/text()[normalize-space(.)]""").getall()
        if not developers:
            self.logger.warning('No Developers found - %s', response.url)
        return developers

    def _extract_genres(self, response):
        genres = response.xpath("""//div[contains(@class,"side_details")]
                                /ul[contains(@class,"summary_details")]
                                /li[contains(@class,"product_genre")]
                                /span[contains(@class,"data")]
                                /text()[normalize-space(.)]""").getall()
        if not genres:
            self.logger.warning('No Genres found - %s', response.url)
        return [g.strip().lower() for g in genres]

    def _extract_rating(self, response):
        rating = response.xpath("""//div[contains(@class,"side_details")]
                                /ul[contains(@class,"summary_details")]
                                /li[contains(@class,"product_rating")]
                                /span[contains(@class,"data")]
                                /text()[normalize-space(.)]""").get()
        if not rating:
            self.logger.warning('No Rating found - %s', response.url)
        return rating
