*** Settings ***
Documentation    Suite description
Library     Collections
Library     JSONLibrary
Library     RequestsLibrary
Library     BuiltIn

*** Variables ***
${host_uri}     http://${APPLICATION_HOST_API}
#${api_fetch_tenant_id}      ${host_uri}/tenant/home
${tenant_host}  equip.stage.shenzyn.com

*** Keywords ***
API.Get Tenant Id
    [Arguments]     ${tenant_name}
    ${body}=    Create Dictionary   tenantURL=http://${tenant_host}/#/home?ref=${tenant_name}
    ${headers}=     Create dictionary   Content-Type=application/json
    create session      shengzyn_app    ${host_uri}      verify=False
#    post request
    ${resp}=    post request     shengzyn_app    ${get_tenant_api}    data=${body}    headers=${headers}
#    Log to console      ${resp.json()}
    should be equal as integers     ${resp.status_code}     ${SUCCESS}     Issue in the API execution
    [Return]    ${resp.json()['data']['tenantId']}

API.Login To Application
    [Arguments]     ${user_name}    ${password}     ${tenant_name}
    ${tenant_id}=   API.Get Tenant Id   ${tenant_name}
    ${body}=    Create dictionary       emailId=${user_name}    password=${password}     tenantId=${tenant_id}
    ${headers}=     Create dictionary   Content-Type=application/json
    create session      shengzyn_app    ${host_uri}      verify=False
    #    post request
    ${resp}=    post request     shengzyn_app    ${api_login}    data=${body}    headers=${headers}
#    Log to console      ${resp.json()}
    should be equal as integers     ${resp.status_code}     ${SUCCESS}     Issue in the API execution
    dictionary should contain item  ${resp.json()}      message     Logged in successful
    ${auth_token}=      Set variable    ${resp.json()['data']['authtoken']}
    set suite variable      ${auth_token}

#
#*** Test Cases ***
#Test
#    ${tenant_id}=   API.Get Tenant Id   cc
#    API.Login To Application    arun.i@shenzyn.com      She@1234    ${tenant_id}

