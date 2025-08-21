*** Settings ***
Library    SeleniumLibrary
Library    Collections
Resource   ../base.resource

*** Variables ***
@{BUTTON_IDS}                   add-to-cart-sauce-labs-backpack
...                             add-to-cart-sauce-labs-bike-light
...                             add-to-cart-sauce-labs-bolt-t-shirt
...                             add-to-cart-sauce-labs-fleece-jacket
...                             add-to-cart-sauce-labs-onesie
...                             add-to-cart-test.allthethings()-t-shirt-(red)
@{nomes_produtos}

${QUANTIDADE_ESCOLHIDA}

${BOTAO_CARRINHO}               css:a[data-test="shopping-cart-link"]
${CART_ITEM}                    css:.cart_item
${BADGE_NUMERO}                 css:span[data-test="shopping-cart-badge"] 

*** Keywords ***
Abrir Lista De Produtos
    Wait Until Page Contains        Products

Adicionar itens ao Carrinho
    [Arguments]    ${QUANTIDADE}
    Set Test Variable    ${QUANTIDADE_ESCOLHIDA}    ${QUANTIDADE}
    ${shuffled}=    Evaluate    random.sample(${BUTTON_IDS}, ${QUANTIDADE})    random
    FOR    ${btn}    IN    @{shuffled}
        ${nome_produto}=    Get Text    xpath=//*[@id="${btn}"]/../preceding-sibling::div[1]/a
        #Log To Console    Nome do produto: ${nome_produto}
        Append To List    ${nomes_produtos}    ${nome_produto}
        Set Test Variable    ${nomes_produtos}
        Click Element    id=${btn}
    END

Validar Quantidade No Badge
    ${NUMERO}    Get Text    ${BADGE_NUMERO}
    Log To Console    QUANTIDADE ${NUMERO}
    Should Be Equal As Integers    ${NUMERO}    ${QUANTIDADE_ESCOLHIDA}

Abrir Carrinho
    Wait Until Element Is Visible    ${BOTAO_CARRINHO}    10s
    Capture Page Screenshot
    Click Element    ${BOTAO_CARRINHO}
    Wait Until Page Contains Element    ${CART_ITEM}    10s

###################################
###### Keywords Concatenadas ######
###################################
Dado que estou na página de produtos
    Abrir Lista De Produtos

Quando adiciono itens ao carrinho
    [Arguments]    ${QUANTIDADE}
    Adicionar itens ao Carrinho    ${QUANTIDADE}

Então a quantidade no carrinho deve ser igual à quantidade adicionada
    Validar Quantidade No Badge

###################################
####### Keywords em Gherkin #######
###################################
Adicionar Itens
    [Arguments]    ${QUANTIDADE}
    Dado que estou na página de produtos
    Quando adiciono itens ao carrinho    ${QUANTIDADE}
    Então a quantidade no carrinho deve ser igual à quantidade adicionada

