*** Settings ***
Resource            ../resources/base.resource
Resource        	../resources/PageObjects/LoginPage.resource
Resource        	../resources/PageObjects/CheckoutInfoPage.resource
Resource        	../resources/PageObjects/CheckoutOverviewPage.resource
Resource    ../resources/PageObjects/LojaPage.resource
Resource    ../resources/PageObjects/CarrinhoPage.resource

Test Setup    Run Keywords    Abrir Browser    AND    Fazer Login    AND    Adicionar Itens    2    AND    Abrir Carrinho    AND    Clicar no Botao checkout
Test Teardown       Fechar Browser

*** Test Cases ***
Cenário: Realizar Checkout
    [Documentation]    Teste de checkout do carrinho de compras
    [Tags]    Checkout
    Inserir dados de Informacao
    Finalizar Compra