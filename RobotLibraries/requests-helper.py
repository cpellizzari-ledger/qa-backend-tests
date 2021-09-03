import requests
from robot.api.deco import keyword, library

@library
class RequestPayloads:

    @keyword('Fetch Payload From ')
    def get_payload(self, url):
        response = requests.get(url)
        return response
