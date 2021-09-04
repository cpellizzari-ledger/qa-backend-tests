*** Settings ***
Documentation     Resource file for the appstore diff test suite
Library           ComparisonLibrary
Library           RequestsHelperLibrary

*** Variables ***
${OLD ENDPOINT}      https://appstore-k8s.staging.aws.ledger.fr
${NEW ENDPOINT}      https://manager.api.live.ledger.com