from deepdiff import DeepDiff, DeepSearch
from robot.api.deco import keyword, library
from robot.api import logger
from pprint import pprint

@library
class ComparisonLibrary:

    @keyword('Compare Two Payloads')
    def compare_payloads(self, old_payload, new_payload):
        ddiff = DeepDiff(old_payload, new_payload, ignore_order=True)
        if ddiff:
            try:
                logger.error("Output : " + pprint(str(ddiff.to_json()), indent=2))
            except Exception as e:
                print(e)
            raise ValueError('Payloads do not match!')
        return ddiff

