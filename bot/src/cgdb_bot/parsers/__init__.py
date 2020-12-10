import logging
from twisted.internet.error import DNSLookupError
from twisted.internet.error import TimeoutError as TOError, TCPTimedOutError
from scrapy.exceptions import IgnoreRequest
from scrapy.spidermiddlewares.httperror import HttpError
from cgdb_bot.items import WikipediaGameItem
from cgdb_bot.exceptions import NoHtmlElementFound

def parse_wikipedia_game_article(response):
    """
    parse en.wikipedia.org article page
    """
    logger = logging.getLogger(__name__)
    parser = WikipediaParser()
    try:
        return parser.parse_game_article(response)
    except IgnoreRequest as err:
        logger.exception('IgnoreRequest: %s', str(err))
        return None

def resp_error_handler(failure):
    """
    Scrapy Request general error handler
    """
    logger = logging.getLogger(__name__)

    # in case you want to do something special for some errors,
    # you may need the failure's type:

    if failure.check(HttpError):
        # these exceptions come from HttpError spider middleware
        # you can get the non-200 response
        response = failure.value.response
        logger.error('ScrapyRequestError, HttpError: %s - %s - %s',
                    response.url,
                    failure.getErrorMessage(),
                    response.text)
    elif failure.check(DNSLookupError):
        # this is the original request
        request = failure.request
        logger.error('ScrapyRequestError, DNSLookupError: %s - %s',
                    request.url,
                    failure.getErrorMessage())
    elif failure.check(TOError, TCPTimedOutError):
        request = failure.request
        logger.error('ScrapyRequestError, TimeoutError, TCPTimedOutError: %s - %s',
                    request.url,
                    failure.getErrorMessage())
    else:
        logger.error('ScrapyRequestError: %s - %s',
                    request.url,
                    failure.getErrorMessage())


class WikipediaParser:
    """
    Wikipedia page parser
    """

    def __init__(self):
        self.logger = logging.getLogger(__name__)

    def parse_game_article(self, response):
        """
        parse game article page
        """
        if response.status != 200:
            # broken link or inactive
            self.logger.error("Link not working: HTTP status code - %s", response.status)
            raise IgnoreRequest

        """
        TODO: if this page is an 'English' Wikipedia site, get links of other languages, and request those links
        """
        yield self._parse_game_article_en_template(response)

    def _parse_game_article_en_template(self, response):
        wiki_game_item = WikipediaGameItem()
        wiki_game_item['title'] = self._extract_title(response)
        wiki_game_item['description'] = self._extract_description(response)
        wiki_game_item['pictures'] = self._extract_pictures(response)
        wiki_game_item['developers'] = self._extract_developers(response)
        wiki_game_item['publishers'] = self._extract_publishers(response)
        wiki_game_item['series'] = self._extract_series(response)
        wiki_game_item['genres'] = self._extract_genres(response)
        wiki_game_item['modes'] = self._extract_modes(response)
        return wiki_game_item

    def _extract_title(self, response):
        title = response.css('#firstHeading > i::text').get()
        try:
            if title is None:
                raise NoHtmlElementFound("No title found")
            return title
        except NoHtmlElementFound as err:
            self.logger.exception("%s - %s", str(err), response.url)
            return None

    def _extract_description(self, response):
        # get all texts inside the first <p> in <div class="mw-parser-output">,
        # but exclude class="mw-empty-elt"
        description_pieces = response.xpath("""//div[@id="mw-content-text"]
                                        /div[@class="mw-parser-output"]
                                        /p[not(contains(@class, "mw-empty-elt"))][1]
                                        //text()""").getall()
        try:
            if len(description_pieces) < 1:
                raise NoHtmlElementFound("No description found")
            return ''.join(description_pieces).strip('\n')
        except NoHtmlElementFound as err:
            self.logger.exception("%s - %s", str(err), response.url)
            return None

    def _extract_pictures(self, response):
        pictures = []
        image_link = response.xpath('//meta[@property="og:image"]/@content').get()
        try:
            if image_link is None:
                raise NoHtmlElementFound("No pictures found")
            pictures.append(image_link)
            return pictures
        except NoHtmlElementFound as err:
            self.logger.exception("%s - %s", str(err), response.url)
            return pictures

    def _extract_developers(self, response):
        return self._extract_from_info_table(response, lookup='Developer(s)')

    def _extract_publishers(self, response):
        return self._extract_from_info_table(response, lookup='Publisher(s)')

    def _extract_series(self, response):
        return self._extract_from_info_table(response, lookup='Series',
                                            loglevel='warning')

    def _extract_genres(self, response):
        return self._extract_from_info_table(response, lookup='Genre(s)',
                                            lowercase=True)

    def _extract_modes(self, response):
        return self._extract_from_info_table(response, lookup='Mode(s)',
                                            lowercase=True)

    def _extract_from_info_table(self, response, lookup=None, loglevel='exception',
                                lowercase=False):
        td = response.xpath(f"""//table[@class="infobox hproduct"]/tbody
                            /tr[th//text()[contains(., "{lookup}")]]/td""")
        ret = []
        if len(td.xpath('./*[contains(@class, "NavFrame")]')) > 0:
            ret = td.xpath('./*[not(contains(@class, "NavFrame"))]//text()').getall()
        else:
            ret = td.xpath('.//text()').getall()
        try:
            if len(ret) < 1:
                raise NoHtmlElementFound(f"No {lookup} found")
            # remove all ', ' in the list
            while ', ' in ret:
                ret.remove(', ')
            if lowercase:
                ret = [x.lower() for x in ret]
            return ret
        except NoHtmlElementFound as err:
            getattr(self.logger, loglevel)("%s - %s", str(err), response.url)
            return ret
