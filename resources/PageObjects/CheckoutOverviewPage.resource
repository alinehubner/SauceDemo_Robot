*** Settings ***
Library    SeleniumLibrary
Resource   ../base.resource

*** Variables ***
${BUTTON_FINISH}        id=finish

*** Keywords ***
Abrir pagina de Overview
    Wait Until Page Contains    Checkout: Overview

Clicar no botao Finish
    Wait Until Element Is Visible    ${BUTTON_FINISH}
    Capture Page Screenshot
    Click Button    ${BUTTON_FINISH}

###################################
###### Keywords Concatenadas ######
###################################
Dado que estou na página de Overview
    Abrir pagina de Overview

#E confirmo meus itens apresentados

Quando eu clicar em "Finish"
    Clicar no botao Finish

Então eu terei concluido a minha compra
    Wait Until Page Contains    Thank you for your order!
    Capture Page Screenshot
###################################
####### Keywords em Gherkin #######
###################################
Finalizar Compra
    Dado que estou na página de Overview
    #E confirmo meus itens apresentados
    Quando eu clicar em "Finish"
    Então eu terei concluido a minha compra