*** Settings ***
Documentation       This is Test Case for Login Scenario
Resource            ../resources/comon.robot
Resource            ../resources/login.robot
Resource            ../resources/data/env.robot
 
Suite Setup         Set Selenium Speed    .02s
Test Setup          Begin Web Test
Test Teardown       End Web Test

#Run the script:
#robot -d results tests/crm.robot

*** Variables ***


*** Test Cases ***
Should be able to login using valid credential
    [Tags]                  Smoke                   validLogin
    Fill Credential         ${validUsername}        ${validPassword}
    Submit Login
    Verify Products Page


Should get Error Message when Login using Invalid Credential
    [Tags]                  Smoke                   invalidLogin
    Fill Credential         ${inValidUsername}      ${inValidPassword}
    Submit Login
    Verify Error Message    ${errorMsgNotMatch}


Should get Error Message When Login with empty Username Field
    [Tags]                  Smoke                   invalidLogin
    Fill Credential         ${empty}                      ${validPassword}
    Submit Login
    Verify Error Message    ${errorMsgUserEmpty}

Should get Error Message When Login with empty Password Field
    [Tags]                  Smoke                   invalidLogin
    Fill Credential         ${validPassword}        ${empty}
    Submit Login
    Verify Error Message    ${errorMsgPwdEmpty}