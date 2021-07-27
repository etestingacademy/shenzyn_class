*** Settings ***
Documentation    Set of keywords to parse the testbed data
Library     OperatingSystem
Library     JSONLibrary
Library     Collections

*** Keywords ***
Get Login Credentials
    [Arguments]     ${profile}
    ${test_data_file}=  join path   ${CURDIR}/../../config     testbed_data.json
    ${test_data_file_content}=      Load JSON From File     ${test_data_file}
    ${username}=    Get From Dictionary     ${test_data_file_content['${profile}']}     username
    ${password}=    Get From Dictionary     ${test_data_file_content['${profile}']}     password
    [Return]    ${username}     ${password}

#*** Test Cases ***
#Test
#    ${uname}    ${passwd}=      Get Login Credentials   coach_login
#    Log to console      ${uname} : ${passwd}
