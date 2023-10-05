*** Settings ***
Library    SeleniumLibrary
Library    XML


*** Variables ***
${URL}                   http://www.amazon.com.br
${MENU_ELETRONICOS}      //a[@href='/Eletronicos-e-Tecnologia/b/?ie=UTF8&node=16209062011&ref_=nav_cs_electronics'][contains(.,'Eletrônicos')]
${HEADER_ELETRONICOS}    //h1[contains(.,'Eletrônicos e Tecnologia')]

*** Keywords ***
Abrir o navegador
    Open Browser    ${URL}    edge
#   ...  options=add_experimental_option("detach", True)
    Maximize Browser Window
   


Fechar o navegador
    Capture Page Screenshot
    Close Browser  

Acessar a home page do site Amazon.com.br 
    Go To    url=${URL}
    Wait Until Element Is Visible    locator=${MENU_ELETRONICOS}


Entrar no menu "Eletrônicos"
    Click Element    locator=${MENU_ELETRONICOS}

Verificar se aparece a frase "${FRASE}"
    Wait Until Page Contains    text=${FRASE}
    Wait Until Element Is Visible    locator=${HEADER_ELETRONICOS}

Verificar se o título da página fica "${TITULO}"
    Title Should Be    title=${TITULO}

Verificar se aparece a categoria "${NOME_CATEGORIA}"
    Element Should Be Visible    locator=//img[contains(@alt,'${NOME_CATEGORIA}')]


Digitar o nome de produto "${PRODUTO}" no campo de pesquisa   
    Input Text    locator=field-keywords   text=${PRODUTO}

Clicar no botão de pesquisa
    Click Element    locator=nav-search-submit-button

Verificar o resultado da pesquisa se está listando o produto "${PRODUTO}"
  Wait Until Element Is Visible    locator=//span[@class='a-size-base-plus a-color-base a-text-normal'][contains(.,'${PRODUTO}')]        

Adicionar o produto "Console Xbox Series S" no carrinho
        Click Image    locator=//img[contains(@alt,'Console Xbox Series S')]
        Wait Until Element Is Visible    locator=//div[contains(@class,'video_games pt_BR')]     
        Click Button    locator=//input[contains(@title,'Adicionar ao carrinho')]


Verificar se o produto "Console Xbox Series S" foi adicionado com sucesso
       Wait Until Page Contains Element   locator=sw-atc-details-single-container

      Click Link  locator=//a[@href='/cart?ref_=sw_gtc'][contains(.,'Ir para o carrinho')]
Remover o produto "Console Xbox Series S" do carrinho 
    Wait Until Element Is Visible    locator=sc-cart-column
    Click Element  locator=//input[contains(@data-action,'delete')]
    # Wait Until Element Is Visible    locator=//div[contains(@class,'a-fixed-right-grid-col sc-retail-cart-column-spacing a-col-left')]
    # Click Link   locator=//input[contains(@data-action,'delete')]
      

Verificar se o carrinho fica vazio
    Wait Until Element Is Visible    locator=//div[contains(@class,'a-container sc-background-dark')]

    
    # GHERKIN STEPS
Dado que estou na home page da Amazon.com.br
    Acessar a home page do site Amazon.com.br
    Verificar se o título da página fica "Amazon.com.br | Tudo pra você, de A a Z."

Quando acessar o menu "Eletrônicos"
    Entrar no menu "Eletrônicos"
   

Então o título da página deve ficar "Eletrônicos e Tecnologia | Amazon.com.br"
        Verificar se o título da página fica "Eletrônicos e Tecnologia | Amazon.com.br"

E o texto "Eletrônicos e Tecnologia" deve ser exibido na página
    Verificar se aparece a frase "Eletrônicos e Tecnologia"

E a categoria "Computadores e Informática" deve ser exibida na página
    Verificar se aparece a categoria "Computadores e Informática"

Quando pesquisar pelo produto "Xbox Series S"    
     Digitar o nome de produto "Xbox Series S" no campo de pesquisa
    Clicar no botão de pesquisa

Então o título da página deve ficar "Amazon.com.br : Xbox Series S"
    Verificar se o título da página fica "Amazon.com.br : Xbox Series S"

 E um produto da linha "Xbox Series S" deve ser mostrado na página
    Verificar o resultado da pesquisa se está listando o produto "Console Xbox Series S"  

Quando adicionar o produto "Console Xbox Series S" no carrinho
      Adicionar o produto "Console Xbox Series S" no carrinho  


Então o produto "Console Xbox Series S" deve ser mostrado no carrinho
     Verificar se o produto "Console Xbox Series S" foi adicionado com sucesso

Quando remover o produto "Console Xbox Series S" do carrinho    
    Remover o produto "Console Xbox Series S" do carrinho
    

Então o carrinho deve ficar vazio
    Verificar se o carrinho fica vazio
         

        
    


    



        
                                         


