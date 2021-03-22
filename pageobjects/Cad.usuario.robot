*** Settings ***
Library       SeleniumLibrary

*** Variable ***
${BROWSER}            chrome
${URL}                http://prova.stefanini-jgr.com.br/teste/qa/
${NOME_COMPLETO}      Flavio Prazeres
${NOME_INCOMPLETO}    Flavio
${NOME_COMPLETO_2}    João Silva
${EMAIL_COMPLETO_2}   j.silva145@hotmail.com
${NOME_COMPLETO_3}    Pedro Batista
${EMAIL_COMPLETO_3}   pedro.bat@gmail.com
${EMAIL_COMPLETO}     flavio_prazeres@outlook.com
${EMAIL_INV}          flavio_prazereshotmail.com
${SENHA_COMPLETA}     12345678
${SENHA_INC}          1234567
${BOTAO_CADASTRAR}    id=register
${BOTAO_EXCLUIR}      //*[@id="removeUser2"]
${ID_EMAIL}           id=email
${ID_SENHA}           id=password
${ID_NOME}            id=name
${EMPTY}
${NOME_ERRO}          //*[@id="root"]/div/div/div[2]/form/div[1]/p
${EMAIL_ERRO}         //*[@id="root"]/div/div/div[2]/form/div[2]/p
${SENHA_ERRO}         //*[@id="root"]/div/div/div[2]/form/div[3]/p
${NOME_ERRO_INC}      //*[@id="root"]/div/div/div[2]/form/div[1]/p
${EMAIL_ERRO_VAL}     //*[@id="root"]/div/div/div[2]/form/div[2]/p
${SENHA_ERRO_INC}     //*[@id="root"]/div/div/div[2]/form/div[3]/p
${ID_CADASTRO}        id=tdUserId3
${ID_CADASTRO_NOME}   id=tdUserName3
${ID_CADASTRO_EMAIL}  id=tdUserEmail3
${ID_EXCLUIR}         id=removeUser3

*** Keywords ***
### Setup e Teardown
Abrir navegador
    Open Browser                    ${URL}                   ${BROWSER}
    #Go To                           ${URL}
#Fechar navegador
    #Close Browser

#Nota: Infelizmente não deu tempo pra mockar os cadastro de forma mais dinamica

#Cenário 01
Dado que estou na página de cadastro 1
      Go To                            ${URL}
Então o sistema deve verificar todos os campos vazios
      Element Text Should Be           ${ID_NOME}                 ${EMPTY}
      Element Text Should Be           ${ID_EMAIL}                ${EMPTY}
      Element Text Should Be           ${ID_SENHA}                ${EMPTY}

#Cenário 02
Dado que estou na página de cadastro 2
      Go To                            ${URL}
Quando insiro apenas e-mail e senha
      Input Text                       ${ID_EMAIL}                   ${EMAIL_COMPLETO}
      Input Text                       ${ID_SENHA}                   ${SENHA_COMPLETA}
      Click Element                    ${BOTAO_CADASTRAR}
Então o sistema deve verificar mensagem de erro "O campo Nome é obrigatório."
      Wait Until Element Is Visible    ${NOME_ERRO}

#Cenário 03
Dado que estou na página de cadastro 3
      Go To                            ${URL}
Quando insiro apenas nome e senha
      Input Text                       ${ID_NOME}                    ${NOME_COMPLETO}
      Input Text                       ${ID_SENHA}                   ${SENHA_COMPLETA}
      Click Element                    ${BOTAO_CADASTRAR}
Então o sistema deve verificar mensagem de erro "O campo E-mail é obrigatório."
      Wait Until Element Is Visible    ${EMAIL_ERRO}

#Cenário 04
Dado que estou na página de cadastro 4
      Go To                            ${URL}
Quando insiro apenas nome e e-mail
      Input Text                       ${ID_NOME}                    ${NOME_COMPLETO}
      Input Text                       ${ID_EMAIL}                   ${EMAIL_COMPLETO}
      Click Element                    ${BOTAO_CADASTRAR}
Então o sistema deve verificar mensagem de erro "O campo Senha é obrigatório."
      Wait Until Element Is Visible    ${SENHA_ERRO}

#Cenário 05
Dado que estou na página de cadastro 5
      Go To                            ${URL}
Quando aperto o botão "Cadastrar" sem nenhum dado informado nos campos
      Click Element                    ${BOTAO_CADASTRAR}
Então o sistema deve verificar mensagem de erro: "O campo Nome é obrigatório.","O campo E-mail é obrigatório.","O campo Senha é obrigatório."
      Wait Until Element Is Visible    ${NOME_ERRO}
      Wait Until Element Is Visible    ${EMAIL_ERRO}
      Wait Until Element Is Visible    ${SENHA_ERRO}

#Cenário 05
Dado que estou na página de cadastro 6
      Go To                            ${URL}
Quando insiro nome incompleto/senha e email
      Input Text                       ${ID_NOME}                    ${NOME_INCOMPLETO}
      Input Text                       ${ID_EMAIL}                   ${EMAIL_COMPLETO}
      Input Text                       ${ID_SENHA}                   ${SENHA_COMPLETA}
      Click Element                    ${BOTAO_CADASTRAR}
Então o sistema deve verificar mensagem de erro: "Por favor, insira um nome completo."
      Wait Until Element Is Visible    ${NOME_ERRO_INC}

#Cenário 07
Dado que estou na página de cadastro 7
      Go To                            ${URL}
Quando insiro nome/e-mail inválido e senha
      Input Text                       ${ID_NOME}                    ${NOME_COMPLETO}
      Input Text                       ${ID_EMAIL}                   ${EMAIL_INV}
      Input Text                       ${ID_SENHA}                   ${SENHA_COMPLETA}
      Click Element                    ${BOTAO_CADASTRAR}
Então o sistema deve verificar mensagem de erro: "Por favor, insira um e-mail válido."
      Wait Until Element Is Visible    ${EMAIL_ERRO_VAL}

#Cenário 08
Dado que estou na página de cadastro 8
      Go To                            ${URL}
Quando insiro nome/e-mail e senha com menos de 8 caracteres
      Input Text                       ${ID_NOME}                    ${NOME_COMPLETO}
      Input Text                       ${ID_EMAIL}                   ${EMAIL_COMPLETO}
      Input Text                       ${ID_SENHA}                   ${SENHA_INC}
      Click Element                    ${BOTAO_CADASTRAR}
Então o sistema deve verificar mensagem de erro: "A senha deve conter ao menos 8 caracteres."
      Wait Until Element Is Visible    ${SENHA_ERRO_INC}

#Cenário 09
Dado que estou na página de cadastro 9
      Go To                            ${URL}
Quando insiro nome/senha e email válidos
      Input Text                       ${ID_NOME}                    ${NOME_COMPLETO}
      Input Text                       ${ID_EMAIL}                   ${EMAIL_COMPLETO}
      Input Text                       ${ID_SENHA}                   ${SENHA_COMPLETA}
      Click Element                    ${BOTAO_CADASTRAR}

      Input Text                       ${ID_NOME}                    ${NOME_COMPLETO_2}
      Input Text                       ${ID_EMAIL}                   ${EMAIL_COMPLETO_2}
      Input Text                       ${ID_SENHA}                   ${SENHA_COMPLETA}
      Click Element                    ${BOTAO_CADASTRAR}

      Input Text                       ${ID_NOME}                    ${NOME_COMPLETO_3}
      Input Text                       ${ID_EMAIL}                   ${EMAIL_COMPLETO_3}
      Input Text                       ${ID_SENHA}                   ${SENHA_COMPLETA}
      Click Element                    ${BOTAO_CADASTRAR}

      Click Element                    ${BOTAO_EXCLUIR}
Então o sistema deve verificar usuario cadastrado
      Wait Until Element Is Visible    ${ID_CADASTRO}
      Wait Until Element Is Visible    ${ID_CADASTRO_NOME}
      Wait Until Element Is Visible    ${ID_CADASTRO_EMAIL}
      Wait Until Element Is Visible    ${ID_EXCLUIR}
