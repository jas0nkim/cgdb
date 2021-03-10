import csv
from datetime import datetime
import treq
from twisted.internet.defer import inlineCallbacks
from twisted.internet.error import DNSLookupError
from twisted.internet.error import TimeoutError as TOError, TCPTimedOutError
from scrapy.spidermiddlewares.httperror import HttpError
from scrapy import Spider
from cgdb_bot import items, settings

class BaseCgdbSpider(Spider):

    def item_scraped(self, item, response, spider):
        """
        Send the scraped item to the API server
        """
        if not spider._postdata:
            return None
        if isinstance(item, items.RedditStadiaWikiGame):
            api_endpoint = '/api/bot/reddit/stadia/game/'
        elif isinstance(item, items.RedditStadiaWikiGamePro):
            api_endpoint = '/api/bot/reddit/stadia/gamepro/'
        elif isinstance(item, items.RedditStadiaStatDetail):
            api_endpoint = '/api/bot/reddit/stadia/gamestats/'
        elif isinstance(item, items.WikipediaGameItem):
            api_endpoint = '/api/bot/game/'
        else:
            spider.logger.error(f"Invalid item passed to item_scraped (Scrapy Signal) - {type(item).__name__}")

        _logger = spider.logger
        @inlineCallbacks
        def _cb(resp):
            content = yield resp.content()
            if resp.code >= 400:
                _logger.error("API post request error [HTTP:%d] %s %s %s",
                            resp.code,
                            resp.request.absoluteURI,
                            item.asjson(),
                            str(content)[0:2000])

        d = treq.post(f'{settings.API_SERVER_HOST}{api_endpoint}',
                    item.asjson().encode('ascii'),
                    headers={
                        'Authorization': f'Token {settings.AUTH_TOKEN}',
                        'Content-Type': ['application/json'],
                    })
        d.addCallback(_cb)
        # The next item will be scraped only after
        # deferred (d) is fired
        return d

    def spider_opened(self, spider):
        dropped_items_file = f'{settings.DATA_ROOT}/dropped_items/{datetime.now().strftime("%Y%m%d%H%M%S")}.csv'
        spider._dropped_items_file = open(dropped_items_file, 'a')

    def spider_closed(self, spider, reason):
        spider._dropped_items_file.close()

    def item_dropped(self, item, response, exception, spider):
        """
        Record dropped items/links
        """
        dropped_item_writer = csv.writer(spider._dropped_items_file,
                            delimiter='|',
                            quotechar='"',
                            quoting=csv.QUOTE_MINIMAL)
        dropped_item_writer.writerow([response.url, spider._platform, str(exception)])

    def resp_error_handler(self, failure):
        """
        Scrapy Request general error handler
        """
        # in case you want to do something special for some errors,
        # you may need the failure's type:

        if failure.check(HttpError):
            # these exceptions come from HttpError spider middleware
            # you can get the non-200 response
            response = failure.value.response
            self.logger.error('ScrapyRequestError, HttpError: %s - %s - %s',
                        response.url,
                        failure.getErrorMessage(),
                        response.text)
        elif failure.check(DNSLookupError):
            # this is the original request
            request = failure.request
            self.logger.error('ScrapyRequestError, DNSLookupError: %s - %s',
                        request.cb_kwargs['main_url'],
                        failure.getErrorMessage())
        elif failure.check(TOError, TCPTimedOutError):
            request = failure.request
            self.logger.error('ScrapyRequestError, TimeoutError, TCPTimedOutError: %s - %s',
                        request.cb_kwargs['main_url'],
                        failure.getErrorMessage())
        else:
            request = failure.request
            self.logger.error('ScrapyRequestError: %s - %s',
                        request.cb_kwargs['main_url'],
                        failure.getErrorMessage())
