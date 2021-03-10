import logging
from twisted.internet.error import DNSLookupError
from twisted.internet.error import TimeoutError as TOError, TCPTimedOutError
from scrapy.spidermiddlewares.httperror import HttpError
from .wikipedia import WikipediaParser, WikipediaStadiaGamesParser
from .reddit import RedditStadiaWikiParser
from .steampowered import SteampoweredParser

def general_resp_error_handler(failure):
    """
    Scrapy Request general error handler
    """
    # in case you want to do something special for some errors,
    # you may need the failure's type:
    logger = logging.getLogger(__name__)

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
                    request.cb_kwargs['main_url'],
                    failure.getErrorMessage())
    elif failure.check(TOError, TCPTimedOutError):
        request = failure.request
        logger.error('ScrapyRequestError, TimeoutError, TCPTimedOutError: %s - %s',
                    request.cb_kwargs['main_url'],
                    failure.getErrorMessage())
    else:
        request = failure.request
        logger.error('ScrapyRequestError: %s - %s',
                    request.cb_kwargs['main_url'],
                    failure.getErrorMessage())

def parse_wikipedia_game_article(response, english_title=None):
    """
    parse en.wikipedia.org article page
    """
    logger = logging.getLogger(__name__)
    parser = WikipediaParser()
    return parser.parse_game_article(response, english_title=english_title)

def parse_wikipedia_stadia_games(response):
    """
    parse list of stadia games page
    """
    logger = logging.getLogger(__name__)
    parser = WikipediaStadiaGamesParser()
    return parser.parse_stadia_games(response)

def parse_reddit_stadia_wiki(response, wiki_type):
    """
    parse subreddit r/Stadia/wiki/ pages
    """
    logger = logging.getLogger(__name__)
    parser = RedditStadiaWikiParser()
    if wiki_type == 'games':
        return parser.parse_games_page(response, wiki_type)
    elif wiki_type == 'pro_games':
        return parser.parse_pro_games_page(response, wiki_type)
    elif wiki_type in ['ratings', 'genres', 'developers',
                    'publishers', 'modes']:
        return parser.parse_game_stats_home_page(response, wiki_type)
    else:
        return []

def parse_reddit_game_stat_detail(response, stat_type, stat_detail):
    """
    parse subreddit r/Stadia/wiki/gamestatistics/xxx/xxx pages
    """
    logger = logging.getLogger(__name__)
    parser = RedditStadiaWikiParser()
    return parser.parse_game_stats_detail_page(response,
                                            stat_type, stat_detail)

def parse_steamstore_searchresults(response, title):
    """
    parse stormpowered store search result page
    """
    logger = logging.getLogger(__name__)
    return SteampoweredParser().parse_search_results_page(response, title)

def parse_steamstore_game_detail(response, title=None):
    """
    parse stormpowered store game detail page
    """
    logger = logging.getLogger(__name__)
    return SteampoweredParser().parse_game_detail_page(response, title)
