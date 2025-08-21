*** Settings ***
Library    SeleniumLibrary
Resource   ../base.resource

*** Variables ***
${PRODUCT_LIST}                css:.inventory_list
${ADD_CART_BUTTON}             css:.inventory_item button[data-test^="add-to-cart"]
${ITENS_CARRINHO}              css:span[data-test="shopping-cart-badge"]
${BOTAO_CARRINHO}              css:a[data-test="shopping-cart-link"]
${CART_ITEM}                   css:.cart_item

*** Keywords ***
Abrir Lista De Produtos
    Wait Until Page Contains Element    ${PRODUCT_LIST}     15s

Adicionar N Itens Qualquer
    [Arguments]    ${qtd}=2
    @{add_buttons}=    Get WebElements    ${ADD_CART_BUTTON}
    FOR    ${i}    IN RANGE    ${qtd}
        Click Element    ${add_buttons[${i}]}
    END
    Set Test Variable    ${QTD_ADICIONADA}    ${qtd}
    Capture Page Screenshot

Obter Quantidade No Carrinho
    ${status}    ${v}=    Run Keyword And Ignore Error    Get Text    ${ITENS_CARRINHO}
    ${v}=    Set Variable If    '${status}'=='FAIL'    0    ${v}
    [RETURN]    ${v}

Abrir Carrinho
    Wait Until Element Is Visible    ${BOTAO_CARRINHO}    10s
    Click Element    ${BOTAO_CARRINHO}
    Wait Until Page Contains Element    ${CART_ITEM}    10s
    Capture Page Screenshot


Validar Quantidade No Badge
    [Arguments]    ${esperado}
    ${valor}=    Obter Quantidade No Carrinho
    Should Be Equal As Integers    ${valor}    ${esperado}


Validar Quantidade No Carrinho
    [Arguments]    ${esperado}
    Abrir Carrinho
    ${qtd}=    Get Element Count    ${CART_ITEM}
    ${esperado_int}=    Convert To Integer    ${esperado}
    Should Be Equal As Integers    ${qtd}    ${esperado_int}


###################################
###### Keywords Concatenadas ######
###################################
Dado que estou na página de produtos
    Abrir Lista De Produtos

Quando adiciono itens ao carrinho
    Adicionar N Itens Qualquer
    Obter Quantidade No Carrinho

Então a quantidade no carrinho deve ser igual à quantidade adicionada
    Abrir Carrinho
    Validar Quantidade No Badge       ${QTD_ADICIONADA}
    Validar Quantidade No Carrinho    ${QTD_ADICIONADA}

###################################
####### Keywords em Gherkin #######
###################################
Adicionar Itens
    Dado que estou na página de produtos
    Quando adiciono itens ao carrinho
    Então a quantidade no carrinho deve ser igual à quantidade adicionada

