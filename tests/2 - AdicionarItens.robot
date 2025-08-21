*** Settings ***
Documentation       Suite de teste adicionar produtos ao carrinho
Resource            ../resources/base.resource
Resource        	../resources/PageObjects/LoginPage.resource
Resource        	../resources/PageObjects/LojaPage.resource

Test Setup    Run Keywords    Abrir Browser    AND    Fazer Login
Test Teardown       Fechar Browser

*** Test Cases ***
Cenário: Adicionar Itens ao Carrinho
    [Documentation]    Incluir produtos no carrinho de compras
    [Tags]    Adicionar Itens
    Dado que estou na página de produtos
    Quando adiciono itens ao carrinho    4
    Então a quantidade no carrinho deve ser igual à quantidade adicionada

