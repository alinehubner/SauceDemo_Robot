*** Settings ***
Library    SeleniumLibrary
Resource   ../base.resource
Resource   ../data/dados.resource


*** Variables ***
${INPUT_FIRST_NAME}        id=first-name
${INPUT_LAST_NAME}         id=last-name
${INPUT_POSTAL_CODE}       id=postal-code
${BUTTON_CONTINUE}         id=continue

*** Keywords ***
Preencher FirstName
    Wait Until Element Is Visible        ${INPUT_FIRST_NAME} 
    Input Text    ${INPUT_FIRST_NAME}     ${FIRST_NAME}

Preencher LastName
    Wait Until Element Is Visible        ${INPUT_LAST_NAME} 
    Input Text    ${INPUT_LAST_NAME}     ${LAST_NAME}

Preencher Zip code
    Wait Until Element Is Visible        ${INPUT_POSTAL_CODE} 
    Input Text    ${INPUT_POSTAL_CODE}   ${POSTAL_CODE}

Clicar no botao continue
    Wait Until Element Is Visible    ${BUTTON_CONTINUE}
    Capture Page Screenshot
    Click Button    ${BUTTON_CONTINUE}

###################################
###### Keywords Concatenadas ######
###################################
Dado que estou na página de Checkout
    Wait Until Page Contains             Checkout: Your Information

E insiro meus dados
    Preencher FirstName
    Preencher LastName
    Preencher Zip code

Quando eu clicar em "Continue"
    Clicar no botao continue

Então eu terei preenchido o formulario de identificacao
    Wait Until Page Contains    Checkout: Overview

###################################
####### Keywords em Gherkin #######
###################################
Inserir dados de Informacao
    Dado que estou na página de Checkout
    E insiro meus dados
    Quando eu clicar em "Continue"
    Então eu terei preenchido o formulario de identificacao
