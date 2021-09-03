from deepdiff import DeepDiff, DeepSearch
from robot.api.deco import keyword, library

@library
class ComparisonLibrary:

    @keyword('Compare Two Payloads')
    def compare_payloads(self, old_payload, new_payload):
        # Need to return errors from ddiff and log them to the report
        ddiff = DeepDiff(old_payload, new_payload)
        return ddiff

