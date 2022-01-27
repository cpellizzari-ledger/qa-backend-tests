*** Settings ***
Documentation     A test suite that ensures each listed fiat currency has a ticker in most used coins
Resource          resources.robot
Test Template     Tickers should all return non empty

*** Test Cases ***                      ${CURRENCY TICKER}
Check ETH ticker                        eth
Check BTC ticker                        btc




*** Keywords ***
Tickers should all return non empty
    [Arguments]    ${CURRENCY TICKER}
    ${JSON FILE}  Load JSON from file  ${CURDIR}/data.json
    ${CURRENCY LIST}    Get values from JSON     ${JSON FILE}  $.supported_currencies[*]
    Run ticker against list  ${ENDPOINT STAGING}  ${ENDPOINT PROD}  ${CURRENCY TICKER}  ${CURRENCY LIST}  ${URI SCHEME DAILY}