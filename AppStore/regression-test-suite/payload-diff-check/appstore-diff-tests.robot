*** Settings ***
Documentation     A test suite with a payload diff test for each API endpoint
Resource          resources.robot
Test Template     Payloads On Both Versions Of The API Should Match

*** Test Cases ***                      ${QUERY BUILDER URI}
GET /api/applications                   get/api/applications
POST /api/applications                  post/api/applications
GET /api/applications/{id}              get/api/applications/{id}
POST /api/get_apps                      post/api/get_apps
GET /api/application_versions           get/api/application_versions
POST /api/application_versions          post/api/application_versions
GET /api/application_versions/{id}      get/api/application_versions/{id}
POST /api/get_device_version            post/api/get_device_version
GET /api/device_versions                get/api/device_versions
POST /api/device_versions               post/api/device_versions
GET /api/device_versions/{p1}           get/api/device_versions/{p1}
GET /api/devices                        get/api/devices
POST /api/devices                       post/api/devices
GET /api/devices/{id}                   get/api/devices/{id}
POST /api/get_firmware_version          post/api/get_firmware_version
POST /api/get_latest_firmware           post/api/get_latest_firmware
POST /api/get_osu_version               post/api/get_osu_version
GET /api/firmwares                      get/api/firmwares
POST /api/firmwares                     post/api/firmwares
GET /api/firmwares/{id}                 get/api/firmwares/{id}
GET /api/firmware_final_versions        get/api/firmware_final_versions
POST /api/firmware_final_versions       post/api/firmware_final_versions
GET /api/firmware_final_versions/{id}   get/api/firmware_final_versions/{id}
GET /api/firmware_osu_versions/{id}     get/api/firmware_osu_versions/{id}
GET /api/firmware_osu_versions          get/api/firmware_osu_versions
POST /api/firmware_osu_versions         post/api/firmware_osu_versions
GET /api/health                         get/api/health
GET /api/mcu/{id}                       get/api/mcu/{id}
GET /api/mcu                            get/api/mcu
POST /api/mcu                           post/api/mcu
GET /api/mcu_versions/{id}              get/api/mcu_versions/{id}
GET /api/mcu_versions                   get/api/mcu_versions
POST /api/mcu_versions                  post/api/mcu_versions
POST /api/mcu_versions_bootloader       post/api/mcu_versions_bootloader


*** Keywords ***
Payloads On Both Versions Of The API Should Match
    [Arguments]    ${QUERY BUILDER URI}
    ${REQUEST PAYLOAD}       Populate Payload With  ${QUERY BUILDER URI}
    ${RESPONSE PAYLOAD 1}    Fetch Payload From  ${REQUEST PAYLOAD}
    ${RESPONSE PAYLOAD 2}    Fetch Payload From  ${REQUEST PAYLOAD}
    Compare Two Payloads     ${RESPONSE PAYLOAD 1}  ${RESPONSE PAYLOAD 2}

