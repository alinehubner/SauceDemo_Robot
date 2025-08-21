*** Settings ***
Library    SeleniumLibrary
Resource   ../base.resource

*** Variables ***
${LISTA_PRODUTOS}            css:.inventory_list
${ADD_TO_CART_BUTTONS}       css:.inventory_item button[data-test^="add-to-cart"]


*** Keywords ***
Abrir Lista De Produtos
    [Documentation]    Garante que a pagina de produtos está carregada.
    Wait Until Page Contains Element    ${LISTA_PRODUTOS}    15s

Adicionar N Itens Qualquer    ${quantidade}
    ${qtd}=    Convert To Integer    ${quantidade}
    @{add_buttons}=    Get WebElements    ${ADD_TO_CART_BUTTONS}
    FOR    ${i}    IN RANGE    ${qtd}
        Click Element    ${add_buttons[${i}]}
    END
    Capture Page Screenshot


#### Atalhos ####
    
Adicionar Itens    ${quantidade}
    Abrir Lista De Produtos
    Adicionar N Itens Qualquer    ${quantidade}