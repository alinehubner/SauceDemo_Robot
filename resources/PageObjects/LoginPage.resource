*** Settings ***
Library    SeleniumLibrary
Resource   ../base.resource

*** Variables ***
${INPUT_USERNAME}    css=[data-test="username"]
${INPUT_PASSWORD}    css=[data-test="password"]
${BTN_LOGIN}         css=[data-test="login-button"]
${TXT_ERROR}         css=[data-test="error"]

*** Keywords ***
Preencher Uername
    [Arguments]    ${username}
    Wait Until Element Is Visible    ${INPUT_USERNAME}
    Input Text    ${INPUT_USERNAME}    ${username}

Preencher Password
    [Arguments]    ${password}
    Wait Until Element Is Visible    ${INPUT_PASSWORD}
    Input Text    ${INPUT_PASSWORD}    ${password}

Clicar Login
    Wait Until Element Is Visible    ${BTN_LOGIN}
    Click Button    ${BTN_LOGIN}