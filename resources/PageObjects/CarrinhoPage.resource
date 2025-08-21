*** Settings ***
Library        SeleniumLibrary
Library        Collections
Resource       ../base.resource
Resource       ../resources/PageObjects/LojaPage.resource

*** Variables ***
@{NOMES_PRODUTOS_CARRINHO}
${CHECKOUT_BUTTON}                 id=checkout


*** Keywords ***
Contar Itens do Carrinho
    @{elementos}=    Get WebElements    xpath=//div[@class="cart_item"]//a/div
 
    ${ITENS_CARRINHO}=    Create List
    FOR    ${el}    IN    @{elementos}
        ${titulo}=    Get Text    ${el}
        Append To List    ${ITENS_CARRINHO}    ${titulo}
    END
    Log To Console    Itens principal: ${nomes_produtos}
    Log To Console    Itens carrinho: ${ITENS_CARRINHO}

    Lists Should Be Equal    ${nomes_produtos}    ${ITENS_CARRINHO}

Clicar no Botao checkout
    Wait Until Element Is Visible    ${CHECKOUT_BUTTON}
    Capture Page Screenshot
    Click Button    ${CHECKOUT_BUTTON}
    Wait Until Page Contains    Checkout: Your Information

