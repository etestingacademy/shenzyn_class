*** Settings ***
Documentation    Suite description
Force Tags     API
Suite Setup     Log To Console      Things to execute once before all suites In API
Suite Teardown  Log To Console      Things to execute once after all suites in API

#*** Variables ***
#
## Return Codes
#${SUCCESS}      200
#${ADDON_SUCCESS}    201
#${UNAUTHORIZED_ACCESS}  407
#${INTERNAL_SERVER_ERROR}    500
#${FORBIDDEN_ACCESS}     403
