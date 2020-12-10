import logging
from twisted.internet.error import DNSLookupError
from twisted.internet.error import TimeoutError, TCPTimedOutError
from scrapy.exceptions import IgnoreRequest
from scrapy.spidermiddlewares.httperror import HttpError

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
    elif failure.check(TimeoutError, TCPTimedOutError):
        request = failure.request
        logger.error('ScrapyRequestError, TimeoutError: %s - %s',
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
    def parse_game_article(self, response):
        """
        parse game article page
        """
        pass