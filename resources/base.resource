*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}        chrome


*** Keywords ***
Abrir Browser
    Open Browser    about:blank    firefox
    # Open Browser   about:blank    ${BROWSER}    ${options}
    # Maximize Browser Window

Fechar Browser
    Capture Page Screenshot
    Close Browser
