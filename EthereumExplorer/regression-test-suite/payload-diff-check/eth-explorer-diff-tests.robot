*** Settings ***
Documentation     A test suite with a payload diff test for each API endpoint
Resource          resources.robot
Test Template     Payloads On Both Versions Of The Eth Explorer Should Match


*** Test Cases ***                                               ${QUERY BUILDER URI}
GET blockchain/v3/{coin}/addresses/{address}/transactions        get/blockchain/v3/{coin}/addresses/{address}/transactions


*** Keywords ***
Payloads On Both Versions Of The Eth Explorer Should Match
    [Arguments]    ${QUERY BUILDER URI}
    ${REQUEST PAYLOAD}       Populate Payload With  ${QUERY BUILDER URI}  ${CURDIR}
    ${RESPONSE PAYLOAD 1}    Fetch Payload From  ${STAGING ENDPOINT}  ${REQUEST PAYLOAD}
    ${RESPONSE PAYLOAD 2}    Fetch Payload From  ${PROD ENDPOINT}  ${REQUEST PAYLOAD}
    Compare Two Payloads     ${RESPONSE PAYLOAD 1}  ${RESPONSE PAYLOAD 2}