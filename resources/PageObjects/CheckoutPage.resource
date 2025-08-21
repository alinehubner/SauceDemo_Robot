*** Settings ***
Library    SeleniumLibrary
Resource   ../base.resource

*** Variables ***
${CLICAR_CARRINHO}           css:a[data-test="shopping-cart-link"]
${BOTAO_CHECKOUT}            id=checkout


*** Keywords ***
Abrir Carrinho de Compras
    [Documentation]    Garante que a pagina do carrinho está carregada.
    Wait Until Page Contains Element    ${CLICAR_CARRINHO}     15s
    Click Button                        ${CLICAR_CARRINHO}



Fazer Compras
    Abrir Carrinho de Compras