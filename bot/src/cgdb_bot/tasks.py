import csv
import requests
from os import path
from requests.exceptions import ConnectionError
from twisted.internet import defer
from scrapy.crawler import CrawlerRunner
from scrapy.utils.project import get_project_settings
from scrapy.utils.log import configure_logging
from cgdb_bot.spiders.wikipedia import (WikipediaGameSpider,
                                        WikipediaStadiaSpider)
from cgdb_bot.spiders.metacritic import MetacriticSpider
from cgdb_bot.spiders.reddit import RedditStadiaSpider
from cgdb_bot.spiders.steampowered import SteampoweredSpider
from crochet import setup as crochet_setup
from .settings import API_SERVER_HOST, CRAWL_ARG_DELIMITER

ALLOWED_PLATFORMS = ('XboxGamePass', 'Stadia', 'Luna',)
ALLOWED_SOURCES = ('Steam', 'Metacritic', 'Wikipedia', 'Reddit', 'SMW')

# for missing game pictures, manual metacritic url insert
_metacritic_urls = [
    'https://www.metacritic.com/game/playstation-4/gunsport',
    'https://www.metacritic.com/game/switch/kemono-heroes',
]

def crawl(platform, source, file):
    if not platform:
        print("Please enter -p or --platform")
        return False
    if platform not in ALLOWED_PLATFORMS:
        print(f"Platform must be one of fillowings: {', '.join(ALLOWED_PLATFORMS)}")
        return False
    # avoid celery scrapy error: twisted.internet.error.ReactorNotRestartable https://stackoverflow.com/a/50140913
    crochet_setup()
    if platform == 'Stadia':
        if source == 'Wikipedia':
            return _crawl_stadia_wikipedia()
        elif source == 'Steam':
            return _crawl_stadia_steam()
        elif source == 'Metacritic':
            return _crawl_stadia_metacritic()
        elif source == 'SMW':
            return _crawl_stadia_smw()
        else:
            return _crawl_stadia_reddit()
    else:
        if not file:
            print("Please enter -f or --file")
            return False
        if not path.exists(file):
            print(f"File ({file}) does not exists. Please enter correct file.")
            return False
        return _crawl_from_file(file=file, platform=platform)

def _crawl_from_file(file, platform):
    titles = []
    urls = []
    with open(file) as f:
        csv_reader = csv.reader(f, delimiter='|', quotechar='"')
        line_num = 0
        for row in csv_reader:
            line_num += 1
            """
            row[0]: title
            row[1]: platform
            row[2]: wikipedia article url
            """
            try:
                if row[2]:
                    urls.append(row[2])
                    continue
                if row[0]:
                    titles.append(row[0])
            except IndexError as err:
                print(f'IndexError: {str(err)}, on line {line_num} of {file}')
                return False
    configure_logging()
    runner = CrawlerRunner(get_project_settings())
    runner.crawl(WikipediaGameSpider,
                titles=CRAWL_ARG_DELIMITER.join(titles),
                urls=CRAWL_ARG_DELIMITER.join(urls),
                platform=platform,
                postdata='True')
    return True

def _crawl_stadia_reddit():
    configure_logging()
    runner = CrawlerRunner(get_project_settings())

    @defer.inlineCallbacks
    def crawl():
        yield runner.crawl(RedditStadiaSpider,
                            type='games', postdata='True')
        yield runner.crawl(RedditStadiaSpider,
                            type='pro_games', postdata='True')
        yield runner.crawl(RedditStadiaSpider,
                            type='allstats', postdata='True')

    crawl()
    return True

def _crawl_stadia_wikipedia():
    configure_logging()
    runner = CrawlerRunner(get_project_settings())
    runner.crawl(WikipediaStadiaSpider, platform='Stadia', postdata='True')
    return True

def _fetch_all_stadia_games():
    try:
        resp = requests.get(f"{API_SERVER_HOST}/api/games/?platform=3")
    except ConnectionError as err:
        print(f"ConnectionError: {str(err)}")
        return []
    return resp.json()

def _crawl_stadia_steam():
    configure_logging()
    runner = CrawlerRunner(get_project_settings())
    runner.crawl(SteampoweredSpider,
                titles=CRAWL_ARG_DELIMITER.join(
                            game.get('title') for game in _fetch_all_stadia_games()
                        ),
                platform='Stadia',
                postdata='True')
    return True

def _crawl_stadia_metacritic():
    # for missing Gunsport. manual url insert
    configure_logging()
    runner = CrawlerRunner(get_project_settings())
    runner.crawl(MetacriticSpider,
                urls=CRAWL_ARG_DELIMITER.join(_metacritic_urls),
                platform='Stadia',
                postdata='True')
    return True

def _crawl_stadia_smw():
    """
    crawl Stadia games from Steam, Metacritic, and Wikipedia all together
    """
    configure_logging()
    runner = CrawlerRunner(get_project_settings())
    runner.crawl(SteampoweredSpider,
                titles=CRAWL_ARG_DELIMITER.join(
                            game.get('title') for game in _fetch_all_stadia_games()
                        ),
                platform='Stadia',
                postdata='True')
    runner.crawl(MetacriticSpider,
                        urls=CRAWL_ARG_DELIMITER.join(_metacritic_urls),
                        platform='Stadia',
                        postdata='True')
    runner.crawl(WikipediaStadiaSpider, platform='Stadia', postdata='True')
    return True
