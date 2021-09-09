from deepdiff import DeepDiff
from robot.api.deco import keyword, library
from robot.api import logger
from pprint import pprint


@library
class ComparisonLibrary:

    @keyword("Compare Two Payloads")
    def compare_payloads(self, old_payload, new_payload):

        ddiff = DeepDiff(old_payload, new_payload, ignore_order=True)
        if "get" in [*old_payload.values()]:
            if ddiff:
                try:
                    logger.error(pprint(str(ddiff.to_json()), indent=2))
                except Exception as e:
                    print(e)
                raise ValueError("Payloads do not match!")
            logger.info("Payloads match")
            return ddiff
        # Obviously for POST calls, values (id, date) will be different
        # We want to ignore the differences and look only at type changes
        if "post" in [*old_payload.values()]:
            if "type_changes" in ddiff:
                try:
                    logger.error(pprint(str(ddiff.to_json()), indent=2))
                except Exception as e:
                    print(e)
                raise ValueError("Payloads do not match!")
            logger.info("Payloads match")
            return ddiff


