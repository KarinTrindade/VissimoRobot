*** Settings ***
Library    SeleniumLibrary    timeout=10s

*** Variables ***
${URL}            https://www.evino.com.br/
${CARRINHO}       //span[@class='CartNavigation__quantity']
${EMAIL}          karintrindade1910@gmail.com
${MINHA_CONTA}    //a[@class='Typo--medium Typo--medium-weight UserAccountNavigation__link'][contains(.,'Minha Conta')]
*** Keywords ***
Abrir o navegador
    Open Browser    browser=chrome
    Maximize Browser Window

Fechar o navegador
    Capture Page Screenshot
    Close Browser    

Dado que estou na home page da Evino.com.br com usuario cadastrado
    Go To    url=${URL}
    Wait Until Element Is Visible    locator=${CARRINHO}
    Wait Until Element Is Visible    locator=(//div[@class='clearfix'])[1]
    Click Button    locator=onesignal-slidedown-cancel-button
    Wait Until Element Is Not Visible    locator=onesignal-slidedown-allow-button
    Wait Until Element Is Visible    locator=//i[@class='ico ev-remove']
    Input Text    locator=//input[@placeholder='Digite seu e-mail']    text=${EMAIL}
    Click Button    locator=//button[contains(.,'Entrar')]
    Wait Until Element Is Visible     locator=${MINHA_CONTA}
    Capture Page Screenshot
Quando acrescento um vinho no carrinho
    Wait Until Element Is Visible    locator=(//span[contains(.,'Vinhos')])[1]
    Click Element    locator=(//span[contains(.,'Vinhos')])[1]
    Wait Until Element Is Visible    locator=//div[contains(@class,'HeaderProductsQuantity')]
    Wait Until Element Is Visible    locator=(//button[contains(.,'Adicionar')])[1]
    Click Button    locator=(//button[contains(.,'Adicionar')])[1]
    Wait Until Element Is Visible    locator=${CARRINHO} 
    Capture Page Screenshot
E clico no icone do carrinho
    Click Element    locator=${CARRINHO}   
    Capture Page Screenshot 
Então o contador de gotas deve aparecer
    Wait Until Element Is Visible    locator=//i[contains(@class,'ico ev-gift gift')]