*** Settings ***
Documentation    Suite to verify Authorization of application With API
Resource    ./../../utilities/api/authentication_api.robot
Resource    ./../../utilities/api/api_vars.robot
#Suite Teardown
*** Test Cases ***
PQR-1: Coach Valid Login
    [Tags]      Smoke
    [Template]      Verify Valid Login Credentials With API
        arun.i@shenzyn.com      She@1234     cc

PQR-2: Coach InValid Login
    [Tags]      Smoke
    [Template]      Verify InValid Login Credentials With API
        arun.i@shenzyn.com      She@12345     cc

#ABC-1 : Coach InValid Login
#    [Template]      Verify InValid Login Credentials
#        arun.i232@shenzyn.com      Shenzyn@123
#        arun.i2@shenzyn.com     Shenzyn1


*** Keywords ***
Verify Valid Login Credentials With API
    [Arguments]     ${u_name}   ${passwd}   ${tenant_name}
    API.Login To Application    ${u_name}   ${passwd}   ${tenant_name}

Verify InValid Login Credentials With API
    [Arguments]     ${u_name}   ${passwd}   ${tenant_name}
    ${status}=  run keyword and return status   API.Login To Application    ${u_name}   ${passwd}   ${tenant_name}
    should not be true      ${status}    Login Possible with Incorrect credentials

#Verify Trainees tab visible
#    [Arguments]     ${condition}
##    sleep   5s
#    run keyword if     ${condition}     element should be visible       //div[@role="tab" and contains(text(),'Trainees')]      Trainees tab is not visible
#    ...     ELSE    element should not be visible       //div[@role="tab" and contains(text(),'Trainees')]      Trainees tab is not visible