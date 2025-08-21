*** Settings ***
Documentation       Suite de teste adicionar produtos ao carrinho
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
    Adicionar itens ao Carrinho    3
    Validar Quantidade No Badge
    Abrir Carrinho
    Contar Itens do Carrinho
    Clicar no Botao checkout