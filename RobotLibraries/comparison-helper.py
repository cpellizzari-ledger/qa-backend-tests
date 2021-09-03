from deepdiff import DeepDiff, DeepSearch
from robot.api.deco import keyword, library

@library
class DiffPayloads:

    @keyword('Compare Two Payloads')
    def compare_payloads(self, old_payload, new_payload):
        ddiff = DeepDiff(old_payload, new_payload)
        return ddiff

