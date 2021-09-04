import requests
import json
from robot.api.deco import keyword, library
from robot.api import logger


@library
class RequestsHelperLibrary:

    @keyword('Populate Payload With ')
    def populate_payload(self, data_json, test_path):
        query_params = self._return_corresponding_payload_for_uri(test_path, data_json)
        return query_params

    @keyword('Fetch Payload From ')
    def get_payload(self, endpoint, query_object):
        # Formatting the url for variables
        if "uri_params" in query_object:
            # "*" allows us to iterate through an array. Neat little trick ;)
            uri = query_object["uri"].format(*query_object["uri_params"])
        else:
            uri = query_object["uri"]
        if query_object["method"] == "post":
            response = requests.post(
                url=endpoint+uri+query_object["query_string_params"],
                data=query_object["payload"]
            )
            logger.info("Call on endpoint : " + uri)
        if query_object["method"] == "get":
            response = requests.get(url=endpoint+uri)
            logger.info("Call on endpoint : " + uri)
        # if the response_code is any of 4**, 5**
        if not str(response.status_code).startswith('20'):
            logger.error("Output : " + response.text)
            raise ValueError('Could not perform the request on endpoint ' + endpoint)
        return response.json()

    def _return_corresponding_payload_for_uri(self, test_path, data_json):
        file = open(test_path + '/data.json')
        # returns JSON object as a dict
        data = json.load(file)
        return data[data_json]
