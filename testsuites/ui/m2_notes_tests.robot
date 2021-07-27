*** Settings ***
Documentation    Tests relate to Notes feature
Resource    ./../../utilities/page/authentication_page.robot
Resource    ./../../utilities/page/notes_page.robot
#            Resource
#Test Teardown   Close All Browsers

*** Test Cases ***
Creating notes
    [Tags]  Smoke
    Login To Application As Coach
    Navigate to Notes tab
    Add Notes       Demo    Demo Description
#    Verify Notes added successfully
