import os
from pathlib import Path
from datetime import datetime

# Scrapy settings for cgdb_bot project
#
# For simplicity, this file contains only settings considered important or
# commonly used. You can find more settings consulting the documentation:
#
#     https://docs.scrapy.org/en/latest/topics/settings.html
#     https://docs.scrapy.org/en/latest/topics/downloader-middleware.html
#     https://docs.scrapy.org/en/latest/topics/spider-middleware.html

BOT_NAME = 'cgdb_bot'

SPIDER_MODULES = ['cgdb_bot.spiders']
NEWSPIDER_MODULE = 'cgdb_bot.spiders'


# Crawl responsibly by identifying yourself (and your website) on the user-agent
#USER_AGENT = 'cgdb_bot (+http://www.yourdomain.com)'

# Obey robots.txt rules
ROBOTSTXT_OBEY = True

# Configure maximum concurrent requests performed by Scrapy (default: 16)
#CONCURRENT_REQUESTS = 32

# Configure a delay for requests for the same website (default: 0)
# See https://docs.scrapy.org/en/latest/topics/settings.html#download-delay
# See also autothrottle settings and docs
DOWNLOAD_DELAY = 3
# The download delay setting will honor only one of:
#CONCURRENT_REQUESTS_PER_DOMAIN = 16
#CONCURRENT_REQUESTS_PER_IP = 16

# Disable cookies (enabled by default)
#COOKIES_ENABLED = False

# Disable Telnet Console (enabled by default)
#TELNETCONSOLE_ENABLED = False

# Override the default request headers:
#DEFAULT_REQUEST_HEADERS = {
#   'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8',
#   'Accept-Language': 'en',
#}

# Enable or disable spider middlewares
# See https://docs.scrapy.org/en/latest/topics/spider-middleware.html
#SPIDER_MIDDLEWARES = {
#    'cgdb_bot.middlewares.CgdbBotSpiderMiddleware': 543,
#}

# Enable or disable downloader middlewares
# See https://docs.scrapy.org/en/latest/topics/downloader-middleware.html
DOWNLOADER_MIDDLEWARES = {
   # 'cgdb_bot.middlewares.CgdbBotDownloaderMiddleware': 543,
   'cgdb_bot.middlewares.RandomUserAgentMiddleware': 510,
}

# Enable or disable extensions
# See https://docs.scrapy.org/en/latest/topics/extensions.html
#EXTENSIONS = {
#    'scrapy.extensions.telnet.TelnetConsole': None,
#}

# Configure item pipelines
# See https://docs.scrapy.org/en/latest/topics/item-pipeline.html
ITEM_PIPELINES = {
   'cgdb_bot.pipelines.WikipediaGamePipeline': 300,
}

# Enable and configure the AutoThrottle extension (disabled by default)
# See https://docs.scrapy.org/en/latest/topics/autothrottle.html
#AUTOTHROTTLE_ENABLED = True
# The initial download delay
#AUTOTHROTTLE_START_DELAY = 5
# The maximum download delay to be set in case of high latencies
#AUTOTHROTTLE_MAX_DELAY = 60
# The average number of requests Scrapy should be sending in parallel to
# each remote server
#AUTOTHROTTLE_TARGET_CONCURRENCY = 1.0
# Enable showing throttling stats for every response received:
#AUTOTHROTTLE_DEBUG = False

# Enable and configure HTTP caching (disabled by default)
# See https://docs.scrapy.org/en/latest/topics/downloader-middleware.html#httpcache-middleware-settings
#HTTPCACHE_ENABLED = True
#HTTPCACHE_EXPIRATION_SECS = 0
#HTTPCACHE_DIR = 'httpcache'
#HTTPCACHE_IGNORE_HTTP_CODES = []
#HTTPCACHE_STORAGE = 'scrapy.extensions.httpcache.FilesystemCacheStorage'

SRC_DIR = os.path.dirname(
               os.path.dirname(
                  os.path.dirname(os.path.abspath(__file__))))
DATA_ROOT = os.getenv('DATA_ROOT', f'{SRC_DIR}/.data')

FEEDS = {
   Path(f'{DATA_ROOT}/scraped_items/%(name)s/%(time)s-part-%(batch_id)d.json'): {
      'format': 'json',
      'batch_item_count': 100,
      'encoding': 'utf8',
      'store_empty': False,
      'fields': None,
      'indent': 4,
      'item_export_kwargs': {
         'export_empty_fields': True,
      },
      'overwrite': False,
   }
}

LOG_FILE = Path(f'{DATA_ROOT}/logs/{datetime.now().strftime("%Y%m%d%H%M%S")}.log')
LOG_LEVEL = 'DEBUG'

CRAWL_ARG_DELIMITER = '||'

API_SERVER_HOST = os.getenv('API_SERVER_HOST', 'http://localhost')

WIKIPEDIA_SEARCH_URL_FORMAT = 'https://www.wikipedia.org/search-redirect.php?family=wikipedia&language=en&search={urlencoded}&language=en&go=Go'
WIKIPEDIA_ENGLISH_DOMAIN = 'https://en.wikipedia.org'
WIKIPEDIA_STADIA_GAMES_URL = 'https://en.wikipedia.org/wiki/List_of_Stadia_games'
WIKIPEDIA_ARTICLE_URL_FORMAT = 'https://en.wikipedia.org/wiki/{underscored_title}'
WIKIPEDIA_LOCAL_TITLE_SPLIT_CHAR = '–'
WIKIPEDIA_NOT_SUPPORTED_LANGUAGE_CODES = ['en-simple',]

REDDIT_DOMAIN = 'https://www.reddit.com'

REDDIT_STADIA_POST_DELAY = 1
AUTH_TOKEN = os.getenv('AUTH_TOKEN')