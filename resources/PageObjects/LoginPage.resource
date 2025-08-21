*** Settings ***
Library    SeleniumLibrary
Resource   ../base.resource

*** Variables ***
${INPUT_USERNAME}    id=user-name
${INPUT_PASSWORD}    id="password"
${LOGIN_BUTTON}      id="login-button"

*** Keywords ***
Preencher Username
    [Arguments]    ${username}
    Wait Until Element Is Visible    ${INPUT_USERNAME}
    Input Text    ${INPUT_USERNAME}    ${username}

Preencher Password
    [Arguments]    ${password}
    Wait Until Element Is Visible    ${INPUT_PASSWORD}
    Input Text    ${INPUT_PASSWORD}    ${password}

Clicar Login
    Wait Until Element Is Visible    ${LOGIN_BUTTON}
    Click Button    ${LOGIN_BUTTON}