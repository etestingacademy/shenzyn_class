*** Settings ***
Documentation    Suite description
Library     SeleniumLibrary
Resource    ./../testbed_parsers/testbed_parser.robot


*** Variables ***
# Locators
# ${PAGENAME_ELEMENT_ELEMENTYPE}
${HOMEPAGE_COACHLOGIN_LINK}     //button[normalize-space(.)='Coach Login']
${LOGINPAGE_EMAIL_TEXTFIELD}    emailId
${LOGINPAGE_PASSWORD_TEXTFIELD}    password
${LOGINPAGE_SUBMIT_BUTTON}      //button[@type='submit']


*** Keywords ***
Login To Application As Coach
    ${username}     ${password}=    Get Login Credentials   coach_login
    Login To application    ${username}     ${password}

Login To application
    [Arguments]     ${username}     ${password}
    Launch the Application
    click element       ${HOMEPAGE_COACHLOGIN_LINK}
    input text      ${LOGINPAGE_EMAIL_TEXTFIELD}     ${username}
    input password      ${LOGINPAGE_PASSWORD_TEXTFIELD}     ${password}
    click element       ${LOGINPAGE_SUBMIT_BUTTON}

Launch the Application
    open browser    http://${APPLICATION_HOST}/#/home?ref=bm    ${BROWSER}
    set selenium implicit wait      60s
    maximize browser window

