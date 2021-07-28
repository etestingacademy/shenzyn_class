*** Settings ***
Documentation    Suite to verify Authorization of application
Resource    ./../../utilities/page/authentication_page.robot
Test Teardown   Close All Browsers
#Test Setup

#Suite Teardown
*** Test Cases ***
ABC-1 : Coach Valid Login
    [Tags]      Smoke
    [Template]      Verify Valid Login Credentials
        arun.i@shenzyn.com      Shenzyn@123

ABC-1 : Coach InValid Login
    [Template]      Verify InValid Login Credentials
        arun.i232@shenzyn.com      Shenzyn@123
        arun.i2@shenzyn.com     Shenzyn1
#####
#Gherkin

#Scenario:Verify Valid Coach Login
#    [Tags]      Smoke
#    Given I am able to login to coach
##    And  There is no browser crash
##    Given Login To Application As Coach
#    Then I Verify If Trainees tab is visible    True
##    And I Verify Notes tab is visible

#("^I login to the application "${username}" & "${password}" $")
#public verifyLogin(username,password)
#{
# launchBrowser()
# setupURL()
#
#}

*** Keywords ***
Verify Valid Login Credentials
    [Arguments]     ${u_name}   ${passwd}
    Login To Application    ${u_name}   ${passwd}
    Verify Trainees tab visible     True

Verify InValid Login Credentials
    [Arguments]     ${u_name}   ${passwd}
    Login To Application    ${u_name}   ${passwd}
    Verify Trainees tab visible     False

