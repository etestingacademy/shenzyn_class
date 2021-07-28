*** Settings ***
Documentation    Tests relate to Notes feature
Resource    ./../../utilities/page/authentication_page.robot
Resource    ./../../utilities/page/notes_page.robot
#            Resource
#Test Teardown   Close All Browsers
Test Setup      API.Login To Application    arunxxx jsjs

*** Test Cases ***
Creating notes
#    [Tags]  Smoke
    API.Add Notes   ${auth_token}   title   desc

#Edit Notes
#
#Delete Notes