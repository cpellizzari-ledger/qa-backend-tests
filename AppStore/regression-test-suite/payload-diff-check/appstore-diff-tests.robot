*** Settings ***
Documentation     A test suite with a payload diff test for each API endpoint
Resource          resources.robot

*** Test Cases ***
Endpoint /display
    ${PAYLOAD 1}    Fetch Payload From ${OLD ENDPOINT}
    ${PAYLOAD 2}    Fetch Payload From ${NEW ENDPOINT}
    Compare Two Payloads    ${PAYLOAD 1}  ${PAYLOAD 2}

