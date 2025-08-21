*** Settings ***
Library    SeleniumLibrary
Resource   ../base.resource

*** Variables ***
${LISTA_PRODUTOS}            css:.inventory_list
${BOTOES_ADICIONAR}          css:.inventory_item button[data-test^="add-to-cart"]
${ITENS_CARRINHO}            css:span[data-test="shopping-cart-badge"]
${BTN_CARRINHO}              css:a[data-test="shopping-cart-link"]
${CART_ITEM}                 css:.cart_item

*** Keywords ***
Abrir Lista De Produtos
    Wait Until Page Contains Element    ${LISTA_PRODUTOS}    15s

# Adicionar N Itens Qualquer
#     @{add_buttons}=    Get WebElements    ${BOTOES_ADICIONAR}
#     FOR    ${i}    IN RANGE    3
#         Click Element    ${add_buttons[${i}]}
#     END
#     Capture Page Screenshot

Adicionar N Itens Qualquer
    [Arguments]    ${qtd}=3
    @{add_buttons}=    Get WebElements    ${BOTOES_ADICIONAR}
    FOR    ${i}    IN RANGE    ${qtd}
        Click Element    ${add_buttons[${i}]}
    END
    Set Suite Variable    ${QTD_ADICIONADA}    ${qtd}
    Capture Page Screenshot



Obter Quantidade No Carrinho
    ${status}    ${v}=    Run Keyword And Ignore Error    Get Text    ${ITENS_CARRINHO}
    ${v}=    Set Variable If    '${status}'=='FAIL'    0    ${v}
    RETURN    ${v}

Abrir Carrinho
    Wait Until Element Is Visible    ${BTN_CARRINHO}    10s
    Click Element    ${BTN_CARRINHO}
    #Wait Until Page Contains Element    ${CART_ITEM}    10s
    Capture Page Screenshot


Validar Quantidade No Badge    ${esperado}
    ${valor}=    Obter Quantidade No Carrinho
    Should Be Equal As Integers    ${valor}    ${esperado}


Validar Quantidade No Carrinho    ${esperado}
    Abrir Carrinho
    ${qtd}=    Get Element Count    ${CART_ITEM}
    Should Be Equal As Integers    ${qtd}    ${esperado}


############################
######### Atalhos ##########

##  Testes no formato BDD ##
Dado que estou na página de produtos
    Abrir Lista De Produtos

Quando adiciono itens ao carrinho
    Adicionar N Itens Qualquer    3

Então a quantidade no carrinho deve ser igual à quantidade adicionada
    Abrir Carrinho
    Validar Quantidade No Badge       ${QTD_ADICIONADA}
    Validar Quantidade No Carrinho    ${QTD_ADICIONADA}

### Caso de teste em Gherkin ###
Adicionar Itens
    Dado que estou na página de produtos
    Quando adiciono itens ao carrinho
    Então a quantidade no carrinho deve ser igual à quantidade adicionada






