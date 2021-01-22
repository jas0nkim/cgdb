import requests
from scrapy.http import HtmlResponse, Request

def build_response(url, headers=None):
    """
    build Scrapy HtmlResponse object
    """
    resp = requests.get(url, headers=headers)
    return HtmlResponse(url,
                    status=resp.status_code,
                    request=Request(url, encoding=resp.encoding),
                    body=resp.content)
