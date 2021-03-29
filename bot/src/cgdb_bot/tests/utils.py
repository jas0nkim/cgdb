import requests
from requests.api import head
from scrapy.http import HtmlResponse, Request

def build_response(url, headers=None):
    """
    build Scrapy HtmlResponse object
    """
    user_agent_headers={
        'user-agent': 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36'
    }
    if not headers:
        headers = user_agent_headers
    else:
        headers = {**user_agent_headers, **headers}
    resp = requests.get(url, headers=headers)
    return HtmlResponse(url,
                    status=resp.status_code,
                    request=Request(url, encoding=resp.encoding),
                    body=resp.content)
