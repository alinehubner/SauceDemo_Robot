*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BASE_URL}       https://www.saucedemo.com
${BROWSER}        chrome
${SEL_TIMEOUT}    10s


*** Keywords ***
Abrir Browser
    Open Browser    ${BASE_URL}    ${BROWSER}
    Set Selenium Timeout    ${SEL_TIMEOUT}
    Maximize Browser Window

Fechar Browser
    Close All Browsers
