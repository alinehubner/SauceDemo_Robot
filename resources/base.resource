*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}        chrome


*** Keywords ***
Abrir Browser
    Open Browser   about:blank    ${BROWSER}
    Maximize Browser Window

Fechar Browser
    Capture Page Screenshot
    Close Browser
