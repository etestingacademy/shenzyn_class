*** Settings ***
Documentation    Keywords for Notes feature
Library     SeleniumLibrary

*** Variables ***
${HOMEPAGE_NOTES_TAB_LINK}   //div[@role="tab" and contains(text(),'Notes')]


*** Keywords ***
Navigate to Notes tab
     Click Element   ${HOMEPAGE_NOTES_TAB_LINK}

Add Notes
    [Arguments]     ${title_notes}      ${desc_notes}
#    mouse over      //div[@class='title__wrapper d-flex']
#    mouse down      //div[@class='title__wrapper d-flex']
    click element    css=.ant-form-item-children > .ant-btn
