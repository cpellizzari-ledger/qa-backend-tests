*** Settings ***
Documentation     Resource file for the cvs non reg test suite
Library           RequestsHelperLibrary
Library           OperatingSystem
Library           RPA.JSON

*** Variables ***
${ENDPOINT STAGING}        https://countervalue-service.staging.aws.ledger.fr
${ENDPOINT PROD}           https://countervalues.live.ledger.com
${URI SCHEME DAILY}        /daily/{0}/{1}