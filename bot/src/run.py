import sys
import getopt
from os import path
import csv
from twisted.internet import reactor, defer
from scrapy.crawler import CrawlerRunner, CrawlerProcess
from scrapy.utils.project import get_project_settings
from scrapy.utils.log import configure_logging
from cgdb_bot.spiders.wikipedia import (WikipediaGameSpider,
                                        WikipediaStadiaSpider)
from cgdb_bot.spiders.reddit import RedditStadiaSpider
from cgdb_bot.settings import CRAWL_ARG_DELIMITER

ALLOWED_PLATFORMS = ('xCloud', 'Stadia', 'Luna',)

def run(file, platform):
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
                sys.exit(2)
    process = CrawlerProcess(get_project_settings())
    process.crawl(WikipediaGameSpider,
                titles=CRAWL_ARG_DELIMITER.join(titles),
                urls=CRAWL_ARG_DELIMITER.join(urls),
                platform=platform,
                postdata='True')
    process.start()

def run_stadia():
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
        yield runner.crawl(WikipediaStadiaSpider, postdata='True')
        reactor.stop()

    crawl()
    reactor.run() # the script will block here until the last crawl call is finished

def main(argv):
    try:
        opts, args = getopt.getopt(argv, 'hf:p:', ['file=', 'platform=', 'help'])
    except getopt.GetoptError as err:
        print(err)
        usage()
        sys.exit(2)
    file = None
    platform = None
    for opt, arg in opts:
        if opt in ('-h', '--help'):
            usage()
            sys.exit()
        elif opt in ('-f', '--file'):
            file = str(arg)
        elif opt in ('-p', '--platform'):
            platform = str(arg)
    if not platform:
        print("Please enter -p or --platform")
        usage()
        sys.exit(2)
    if platform not in ALLOWED_PLATFORMS:
        print(f"Platform must be one of fillowings: {', '.join(ALLOWED_PLATFORMS)}")
        usage()
        sys.exit(2)
    if platform == 'Stadia':
        run_stadia()
    else:
        if not file:
            print("Please enter -f or --file")
            usage()
            sys.exit(2)
        if not path.exists(file):
            print(f"File ({file}) does not exists. Please enter correct file.")
            usage()
            sys.exit(2)
        run(file=file, platform=platform)

def usage():
    print(f"""Run scrapy for crawling Wikipedia artlcles for games

Usage:
    run.py -p PLATFORM [-f FILE]

Options:
    -p, --platform PLATFORM         Give a platform where games belong to 
                                    ({', '.join(ALLOWED_PLATFORMS)})
    -f, --file FILE                 CSV file has list of game titles to
                                    crawl
                                    (Required for platforms: xCloud, Luna)
""")

if __name__ == "__main__":
    main(sys.argv[1:])
