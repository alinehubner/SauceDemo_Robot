*** Settings ***
Resource            ../resources/base.resource
Resource        	../resources/PageObjects/LoginPage.resource
Resource        	../resources/PageObjects/CarrinhoPage.resource

Test Setup    Run Keywords    Abrir Browser    AND    Fazer Login
Test Teardown       Fechar Browser

*** Test Cases ***
Cenário: Adicionar Itens ao Carrinho
    [Documentation]    Incluir produtos no carrinho de compras
    [Tags]    Adicionar Itens
    Dado que estou na página de produtos
    Quando adiciono itens ao carrinho
    Então a quantidade no carrinho deve ser igual à quantidade adicionada

Cenario: teste
    Abrir Carrinho
    Validar Quantidade No Badge
    Validar Quantidade No Carrinho