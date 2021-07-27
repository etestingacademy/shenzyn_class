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


*** Keywords ***
Verify Valid Login Credentials
    [Arguments]     ${u_name}   ${passwd}
    Login To Application    ${u_name}   ${passwd}
    Verify Trainees tab visible     True

Verify InValid Login Credentials
    [Arguments]     ${u_name}   ${passwd}
    Login To Application    ${u_name}   ${passwd}
    Verify Trainees tab visible     False

Verify Trainees tab visible
    [Arguments]     ${condition}
#    sleep   5s
    run keyword if     ${condition}     element should be visible       //div[@role="tab" and contains(text(),'Trainees')]      Trainees tab is not visible
    ...     ELSE    element should not be visible       //div[@role="tab" and contains(text(),'Trainees')]      Trainees tab is not visible