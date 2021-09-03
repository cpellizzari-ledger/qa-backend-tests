import requests
import json
from robot.api.deco import keyword, library

@library
class RequestsHelperLibrary:

    @keyword('Populate Payload With ')
    def populate_payload(self, data_path):
        # Opening JSON file
        file = open('data.json')
        # returns JSON object as a dict
        data = json.load(file)
        file.close()
        return data[data_path]

    @keyword('Fetch Payload From ')
    def get_payload(self, url):
        response = requests.get(url)
        return response
