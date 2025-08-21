*** Settings ***
Library    SeleniumLibrary
Resource   ../base.resource
Resource   ../data/usuarios.resource

*** Variables ***
${LOGIN_PAGE_URL}       https://www.saucedemo.com

${INPUT_LOGIN}          id=user-name
${INPUT_SENHA}          id=password
${BUTTON_LOGIN}         id=login-button

*** Keywords ***
Acessar Pagina de Login
    Go To    ${LOGIN_PAGE_URL}
    Wait Until Element Is Visible    ${INPUT_LOGIN}

Preencher Username
    [Arguments]    ${username}
    Wait Until Element Is Visible    ${INPUT_LOGIN}
    Input Text    ${INPUT_LOGIN}    ${username}

Preencher Password
    [Arguments]    ${password}
    Wait Until Element Is Visible    ${INPUT_SENHA}
    Input Text    ${INPUT_SENHA}    ${password}

Clicar Login
    Wait Until Element Is Visible    ${BUTTON_LOGIN}
    Click Button    ${BUTTON_LOGIN}


#*** Atalhos ***#

Dado que estou na página de login
    Acessar Pagina de Login

E insiro minhas credecinais
    Preencher Username    ${USUARIO_LOGIN}
    Preencher Password    ${USUARIO_SENHA}

Quando eu clicar em "Login"
    Clicar Login

Então eu estarei autenticado
    Wait Until Page Contains    Products