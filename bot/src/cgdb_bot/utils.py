from urllib.parse import urljoin, urlparse
from cgdb_bot.settings import (WIKIPEDIA_ARTICLE_URL_FORMAT,
                            STEAMPOWERED_SEARCH_RESULT_URL_FORMAT)

api_endpoint = {
    'RedditStadiaWikiGame': '/api/bot/reddit/stadia/game/',
    'RedditStadiaWikiGamePro': '/api/bot/reddit/stadia/gamepro/',
    'RedditStadiaStatDetail': '/api/bot/reddit/stadia/gamestats/',
    'WikipediaGameItem': '/api/bot/wikipedia/stadia/game/',
    'SteampoweredGameItem': '/api/bot/steampowered/stadia/game/',
}

def to_bool(string):
    return string.lower() in ['true', '1', 't', 'y', 'yes', 'yeah', 'yup', 'certainly', 'uh-huh']

def get_wikipedia_article_url(title):
    return WIKIPEDIA_ARTICLE_URL_FORMAT.format(underscored_title=title.strip().replace(' ', '_'))

def get_steampowered_search_result_url(title):
    return STEAMPOWERED_SEARCH_RESULT_URL_FORMAT.format(title=title.strip().replace(' ', '+'))

def clean_url(url):
    return urljoin(url, urlparse(url).path)