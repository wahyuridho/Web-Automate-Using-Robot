*** Settings ***
Library                             SeleniumLibrary
Resource                            ../resources/data/login.locator.robot


*** Keywords ***
Fill Credential
    [Arguments]                     ${username}                ${password}
    Input Text                      ${usernameField}           ${username}
    Input Text                      ${passwordField}           ${password}

Submit Login
    Click Button                    ${submitBtn}                  

Verify Products Page
    Wait Until Page Contains        Products

Verify Error Message
    [Arguments]                     ${errorMessage}
    Element Should Be Visible       ${clsError}
    Element Text Should Be          ${errorMsg}         ${errorMessage}