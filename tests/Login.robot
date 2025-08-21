*** Settings ***
Documentation       Suite de teste de login de usuario
Resource            ../resources/base.resource
Resource        	../resources/PageObjects/LoginPage.resource

Test Setup          Abrir Browser
Test Teardown       Fechar Browser

*** Test Cases ***
Cenário: Efetuar login com Sucesso
    [Documentation]    Teste de login efetuado com sucesso
    [Tags]             Login
	Dado que estou na página de login
	E insiro minhas credecinais
	Quando eu clicar em "Login"
	Então eu estarei autenticado
	Sleep		2s
