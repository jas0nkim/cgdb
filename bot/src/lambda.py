import json
from cgdb_bot import tasks

def handler(event, context):
    # response object
    resp = {}
    resp['statusCode'] = 200
    resp['headers'] = {}
    resp['headers']['Content-Type'] = 'application/json'

    # scraper object
    scraper = {}
    scraper['status'] = None
    scraper['message'] = ''

    params = event.get('queryStringParameters')
    if not params:
        scraper['status'] = False
        scraper['message'] = 'queryStringParameters not found'
    else:
        scraper['status'], scraper['message'] = tasks.crawl(params.get('platform'),
                                                            params.get('source'),
                                                            params.get('file'))
    resp['body'] = json.dumps(scraper)
    return resp
