*** Settings ***
Resource           ../pageobjects/Cad.usuario.robot
Test Setup         Abrir navegador
#Suite Teardown    Fechar navegador


*** Test Case ***
#(Tela 1)
Cenário 01: Verificar campos do cadastro
     Dado que estou na página de cadastro 1
     Então o sistema deve verificar todos os campos vazios

#(Tela 2,3,4 e 5)
Cenário 02: Cadastrar usuário sem nome
    Dado que estou na página de cadastro 2
    Quando insiro apenas e-mail e senha
    Então o sistema deve verificar mensagem de erro "O campo Nome é obrigatório."

Cenário 03: Cadastrar usuário sem e-mail
    Dado que estou na página de cadastro 3
    Quando insiro apenas nome e senha
    Então o sistema deve verificar mensagem de erro "O campo E-mail é obrigatório."

Cenário 04: Cadastrar usuário sem senha
    Dado que estou na página de cadastro 4
    Quando insiro apenas nome e e-mail
    Então o sistema deve verificar mensagem de erro "O campo Senha é obrigatório."

Cenário 05: Cadastrar usuário sem dados
    Dado que estou na página de cadastro 5
    Quando aperto o botão "Cadastrar" sem nenhum dado informado nos campos
    Então o sistema deve verificar mensagem de erro: "O campo Nome é obrigatório.","O campo E-mail é obrigatório.","O campo Senha é obrigatório."

#(Tela 6)
Cenário 06: Cadastrar usuário sem nome completo
    Dado que estou na página de cadastro 6
    Quando insiro nome incompleto/senha e email
    Então o sistema deve verificar mensagem de erro: "Por favor, insira um nome completo."
#(Tela 7)
Cenário 07: Cadastrar usuário com e-mail inválido
    Dado que estou na página de cadastro 7
    Quando insiro nome/e-mail inválido e senha
    Então o sistema deve verificar mensagem de erro: "Por favor, insira um e-mail válido."

#(Tela 8)
Cenário 08: Cadastrar usuário senha com ao menos 8 caracteres
    Dado que estou na página de cadastro 8
    Quando insiro nome/e-mail e senha com menos de 8 caracteres
    Então o sistema deve verificar mensagem de erro: "A senha deve conter ao menos 8 caracteres."

#(Tela 9,10 e 11)
Cenário 09: Cadastrar usuário com sucesso
    Dado que estou na página de cadastro 9
    Quando insiro nome/senha e email válidos
    Então o sistema deve verificar usuario cadastrado
