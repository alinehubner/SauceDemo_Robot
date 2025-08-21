*** Settings ***
Resource            ../resources/base.resource
Resource        	../resources/PageObjects/LoginPage.resource
Resource        	../resources/PageObjects/CarrinhoPage.resource

Test Setup    Run Keywords    Abrir Browser    AND    Fazer Login
Test Teardown       Fechar Browser

*** Test Cases ***
Cenário: Adicionar Itens ao Carrinho
    [Tags]    Adicionar Itens
    Adicionar Itens    3