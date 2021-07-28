*** Settings ***
Documentation    Suite description
Resource    ./../../utilities/page/authentication_page.robot

*** Keywords ***
I am able to login to coach
    Login To Application As Coach

I Verify If Trainees tab is visible
    [Arguments]     ${condition}
#    sleep   5s
    run keyword if     ${condition}     element should be visible       //div[@role="tab" and contains(text(),'Trainees')]      Trainees tab is not visible
    ...     ELSE    element should not be visible       //div[@role="tab" and contains(text(),'Trainees')]      Trainees tab is not visible