import sys
import getopt
from cgdb_bot import tasks

def main(argv):
    try:
        opts, args = getopt.getopt(argv,
                        'hf:p:s:',
                        ['file=', 'platform=', 'source=', 'help'])
    except getopt.GetoptError as err:
        print(err)
        usage()
        sys.exit(2)
    file = None
    platform = None
    source = None
    for opt, arg in opts:
        if opt in ('-h', '--help'):
            usage()
            sys.exit()
        elif opt in ('-f', '--file'):
            file = str(arg)
        elif opt in ('-p', '--platform'):
            platform = str(arg)
        elif opt in ('-s', '--source'):
            source = str(arg)
    if not tasks.crawl(platform, source, file):
        usage()
        sys.exit(2)

def usage():
    print(f"""Run scrapy for crawling game information from Wikipedia, Steam, Metacritic, and so on.

Usage:
    run.py -p PLATFORM -s SOURCE [-f FILE]

Options:
    -p, --platform PLATFORM         Give a platform where games belong to 
                                    ({', '.join(tasks.ALLOWED_PLATFORMS)})
    -s, --source SOURCE             Sourcing the game information from
                                    ({', '.join(tasks.ALLOWED_SOURCES)})
    -f, --file FILE                 CSV file has list of game titles to
                                    crawl
                                    (Required for platforms: Xbox Game Pass, Luna)
""")

if __name__ == "__main__":
    main(sys.argv[1:])
