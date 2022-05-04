*** Settings ***
Documentation    Essa suite testa o site da Evino.com.br
Resource         evino_resoucers.robot
Test Setup       Abrir o navegador
Test Teardown    Fechar o navegador


*** Test Cases ***
Caso de teste 01 - Verificar se aparece o contador de gotas corretamente
    Dado que estou na home page da Evino.com.br com usuario cadastrado
    Quando acrescento um vinho no carrinho
    E clico no icone do carrinho
    Então o contador de gotas deve aparecer