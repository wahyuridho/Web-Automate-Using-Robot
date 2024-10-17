*** Settings ***
Library                SeleniumLibrary
Resource               ../resources/data/env.robot


*** Keywords ***
Begin Web Test
    open browser              ${baseUrl}    ${browser}


End Web Test
    close browser