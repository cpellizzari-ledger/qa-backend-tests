*** Settings ***
Documentation     A test suite that ensures each listed fiat currency has a ticker in most used coins
Resource          resources.robot
Test Template     Tickers should all return non empty

*** Test Cases ***                      ${CURRENCY TICKER}
Check ETH ticker                        eth
Check BTC ticker                        btc
Check BNB ticker                        bnb
Check USDT ticker                       usdt
Check USDC ticker                       usdc
Check XRP ticker                        xrp
Check DOT ticker                        dot
Check DOGE ticker                       doge
Check SHIB ticker                       shib
Check BUSD ticker                       busd
Check WBTC ticker                       wbtc
Check ALGO ticker                       algo
Check LTC ticker                        ltc
Check LINK ticker                       link
Check TRON ticker                       trx
Check BCH ticker                        bch
Check MANA ticker                       mana
Check STELLAR ticker                    xlm
Check FTX Token ticker                  ftt
Check Cosmos Token ticker               atom
Check Eth Classic Token ticker          etc
Check Tezos Token ticker                xtz



*** Keywords ***
Tickers should all return non empty
    [Arguments]    ${CURRENCY TICKER}
    ${JSON FILE}  Load JSON from file  ${CURDIR}/data.json
    ${CURRENCY LIST}    Get values from JSON     ${JSON FILE}  $.supported_currencies[*]
    Run ticker against list  ${ENDPOINT STAGING}  ${ENDPOINT PROD}  ${CURRENCY TICKER}  ${CURRENCY LIST}  ${URI SCHEME DAILY}