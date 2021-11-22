*** Settings ***
Documentation     Resource file for the Eth Explorer diff test suite
Library           ComparisonLibrary
Library           RequestsHelperLibrary

*** Variables ***
${STAGING ENDPOINT}      https://explorers.api-01.live.ledger-stg.com
${PROD ENDPOINT}         https://explorers.api.vault.ledger.com
