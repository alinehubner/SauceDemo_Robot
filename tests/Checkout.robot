*** Settings ***
Resource            ../resources/base.resource
Resource        	../resources/PageObjects/LoginPage.resource
Resource        	../resources/PageObjects/CarrinhoPage.resource
Resource        	../resources/PageObjects/CheckoutPage.resource

Test Setup    Run Keywords    Abrir Browser    AND    Fazer Login    AND    Adicionar Itens
Test Teardown       Fechar Browser

*** Test Cases ***
Cenário: Realizar Checkout
    [Tags]    Checkout
    Fazer Compras