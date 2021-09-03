import requests
import json
from robot.api.deco import keyword, library

@library
class RequestsHelperLibrary:

    @keyword('Populate Payload With ')
    def populate_payload(self, data_json, test_path):
        query_params = self.return_corresponding_payload_for_uri(test_path, data_json)
        return query_params

    @keyword('Fetch Payload From ')
    def get_payload(self, endpoint, query_object):
        if query_object["method"] == "post":
            response = requests.post(
                url=endpoint+query_object["uri"]+query_object["query_string_params"],
                data=query_object["payload"]
            )
        if query_object["method"] == "get":
            response = requests.get(url=endpoint+query_object["uri"])
        return response

    def return_corresponding_payload_for_uri(self, test_path, data_json):
        # Opening JSON file
        file = open(test_path + '/data.json')
        # returns JSON object as a dict
        data = json.load(file)
        return data[data_json]

