*** Settings ***
Documentation     A test suite with a payload diff test for each API endpoint
Resource          resources.robot
Test Template     Payloads On Both Versions Of The Eth Explorer Should Match


*** Test Cases ***                                                  ${QUERY BUILDER URI}
GET blockchain/v3/{coin}/addresses/{address}/transactions           get/blockchain/v3/{coin}/addresses/{address}/transactions
GET blockchain/v3/{coin}/fees                                       get/blockchain/v3/{coin}/fees
GET blockchain/v3/{coin}/blocks/current                             get/blockchain/v3/{coin}/blocks/current
GET blockchain/v3/{coin}/blocks/{hash}                              get/blockchain/v3/{coin}/blocks/{hash}
GET blockchain/v3/{coin}/blocks/{height}                            get/blockchain/v3/{coin}/blocks/{height}
GET blockchain/v3/{coin}/addresses/{address}/nonce                  get/blockchain/v3/{coin}/addresses/{address}/nonce
POST blockchain/v3/{coin}/addresses/{address}/estimate-gas-limit    post/blockchain/v3/{coin}/addresses/{address}/estimate-gas-limit
GET blockchain/v3/eth/erc20/approvals                               get/blockchain/v3/eth/erc20/approvals
POST blockchain/v3/{coin}/erc20/balances                            post/blockchain/v3/{coin}/erc20/balances
POST blockchain/v3/{coin}/erc20/balance                             post/blockchain/v3/{coin}/erc20/balance
GET blockchain/v3/{coin}/transactions/{tx_hash}                     get/blockchain/v3/{coin}/transactions/{tx_hash}
POST blockchain/v3/{coin}/transactions/send                         post/blockchain/v3/{coin}/transactions/send
GET blockchain/v3/{coin}/explorer/info                              get/blockchain/v3/{coin}/explorer/info
GET blockchain/v3/eth/gastracker/barometer                          get/blockchain/v3/eth/gastracker/barometer
GET blockchain/v3/{coin}/explorer/_health                           get/blockchain/v3/{coin}/explorer/_health


*** Keywords ***
Payloads On Both Versions Of The Eth Explorer Should Match
    [Arguments]    ${QUERY BUILDER URI}
    ${REQUEST PAYLOAD}       Populate Payload With  ${QUERY BUILDER URI}  ${CURDIR}
    ${RESPONSE PAYLOAD 1}    Fetch Payload From  ${STAGING ENDPOINT}  ${REQUEST PAYLOAD}
    ${RESPONSE PAYLOAD 2}    Fetch Payload From  ${PROD ENDPOINT}  ${REQUEST PAYLOAD}
    Compare Two Payloads     ${RESPONSE PAYLOAD 1}  ${RESPONSE PAYLOAD 2}