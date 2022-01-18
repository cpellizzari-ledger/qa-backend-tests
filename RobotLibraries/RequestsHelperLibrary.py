import requests
import json
from robot.api.deco import keyword, library
from robot.api import logger
import os


@library
class RequestsHelperLibrary:

    @keyword("Run ticker against list")
    def compare_tickers_and_currencies(self, endpoint_staging, endpoint_prod, ticker, currency_list, uri_scheme):
        test_fail = []
        for currency in currency_list:
            url_call = endpoint_staging + uri_scheme.format(ticker, currency)
            response = requests.get(
                url=url_call
            )
            if not response.json() or "code" in response.json():
                url_call_prod = endpoint_prod + uri_scheme.format(ticker, currency)
                response_prod = requests.get(
                    url=url_call_prod
                )
                if response_prod.json() != response.json():
                    test_fail.append("Problem on staging with following pair : " + ticker + "/" + currency)
        if test_fail:
            logger.info(test_fail)
            raise ValueError("Problem with ticker " + ticker)

    @keyword("Populate Payload With ")
    def populate_payload(self, data_json, test_path):
        query_params = self._return_corresponding_payload_for_uri(data_json, test_path)
        return query_params

    @keyword("Fetch Payload From ")
    def get_payload(self, endpoint, query_object):
        # Getting auth token from environment variables
        headers = {"Authorization": os.environ['APPSTORE_AUTH'],
                   "Content-Type": "application/json"}
        # Adding headers from request payload
        if "headers" in query_object:
            headers.update(query_object["headers"])
        # Formatting the url for variables
        if "uri_params" in query_object:
            # "*" allows us to iterate through an array. Neat little trick ;)
            uri = query_object["uri"].format(*query_object["uri_params"])
        else:
            uri = query_object["uri"]
        if query_object["method"] == "post":
            data = json.dumps(query_object["payload"])
            response = requests.post(
                url=endpoint+uri+query_object["query_string_params"],
                headers=headers,
                data=data
            )
            logger.info("Call on endpoint : " + uri)
            logger.info(response.text)
        if query_object["method"] == "get":
            response = requests.get(url=endpoint+uri+query_object["query_string_params"],
                                    headers=headers,
                                    timeout=None)
            logger.info("Call on endpoint : " + uri)
            logger.info(response.text)
        # if the response_code is any of 4**, 5**
        if not str(response.status_code).startswith('20'):
            logger.error("Output : " + response.text)
            raise ValueError("Could not perform the request on endpoint " + endpoint)
        return response

    def _return_corresponding_payload_for_uri(self, data_json, test_path):
        file = open(test_path + "/data.json")
        # returns JSON object as a dict
        data = json.load(file)
        return data[data_json]
