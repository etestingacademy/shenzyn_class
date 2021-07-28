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
    ${chrome_options} =     Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${chrome_options}   add_argument    headless
    Call Method    ${chrome_options}   add_argument    disable-gpu
    Call Method    ${chrome_options}   add_argument    --no-sandbox
    Call Method    ${chrome_options}   add_argument    --ignore-certificate-errors
#    ${options}=     Call Method     ${chrome_options}    to_capabilities
    create webdriver    Chrome  chrome_options=${chrome_options}
    go to    http://${APPLICATION_HOST}/#/home?ref=bm
    set selenium implicit wait      60s
    maximize browser window

