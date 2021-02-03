:- dynamic cont/1.
:- dynamic automovel/15.
carrega_cadastro:-
    consult('cadastro.txt').


menu:-
    write('*********************************.\n'),
    write('*      Cadastro Automoveis      *.\n'),
    write('*********************************.\n'),
    write('.\n'),
    write('.\n'),
    write('.\n'),
    write('Escolha qual das opções abaixo.\n'),
    write('1-Cadastrar Automoveis.\n'),
    write('2-Localizar Automovel pelo Proprietario.\n'),
    write('3-Excluir Automovel.\n'),
    write('4-Localizar Automovel pela Placa.\n'),
    write('5-Localizar Automovel pelo Renavam.\n'),
    write('6-Relatorio de Automoveis.\n'),
    write('7-Informar Quantidade de Automoveis.\n'),
    write('8-Salvar Dados em Arquivo.\n'),
    write('9-Carregar Dados de Arquivo.\n'),
    write('10-Limpar Dados de Cadastro.\n'),
    write('11-Alterar cadastro pela placa.\n'),
    write('12-Encerrar.\n'),
    write('.\n'),
    write('.\n'),
    writeln('Informe a opção: '),
    read(E),
    opcoes(E),
    menu. % se 5 ,!,Fail. caso sem erros, direto Fail.
opcoes(1):-
    write('.\n'),
    write('.\n'),
    writeln('---  Digite os Dados do seu carro  ---'),
    write('.\n'),
    write('.\n'),
    write('Renavam: '),
    read(Renavam),
    write('Placa: '),
    read(Placa),
    write('Nome do Proprietario: '),
    read(Nome),
    write('Sobrenome do Proprietario: '),
    read(Sobrenome),
    write('Marca: '),
    read(Marca),
    write('Modelo: '),
    read(Modelo),
    write('Ano de Fabricação: '),
    read(Ano),
    write('Logradouro: '),
    read(Logradouro),
    write('Número: '),
    read(Numero),
    write('Complemento: '),
    read(Complemento),
    write('Cidade: '),
    read(Cidade),
    write('Estado: '),
    read(Estado),
    write('CEP: '),
    read(Cep),
    write('Celular: '),
    read(Celular),
    write('Telefone: '),
    read(Telefone),
    write('.\n'),
    assert(automovel(Renavam,Placa,Nome,Sobrenome,Marca,Modelo,Ano,Logradouro,Numero,Complemento,Cidade,Estado,Cep,Celular,Telefone)),
    menu.

    % ,!. não deixa dar backtracking
opcoes(2):-
    writeln('Procurando Automovel pelo Nome e Sobrenome do Proprietario'),
    writeln('Nome do Proprietario: '),
    read(Nome),
    writeln('Sobrenome do Proprietario: '),
    read(Sobrenome),
    localiza(_,_,Nome,Sobrenome,_,_,_,_,_,_,_,_,_,_,_),
    menu.
opcoes(3):-
    write('Placa: '),
    read(Placa),
    retractall(automovel(_,Placa,_,_,_,_,_,_,_,_,_,_,_,_,_)),
    menu.
opcoes(4):-
    writeln('Procurando Automovel pela Placa'),
    writeln('Placa do Automovel: '),
    read(Placa),
    localiza(_,Placa,_,_,_,_,_,_,_,_,_,_,_,_,_).
opcoes(5):-
    writeln('Procurando Automovel pelo Renavam'),
    writeln('Renavam do Automovel: '),
    read(Renavam),
    localiza(Renavam,_,_,_,_,_,_,_,_,_,_,_,_,_,_),
    menu.
opcoes(6):-
    automovel(Renavam,Placa,Nome,Sobrenome,Marca,Modelo,Ano,Logradouro,Numero,Complemento,Cidade,Estado,Cep,Celular,Telefone),
    writeln(Renavam),writeln(Placa),writeln(Nome),writeln(Sobrenome),writeln(Marca),writeln(Modelo),writeln(Ano),writeln(Logradouro),writeln(Numero),writeln(Complemento),writeln(Cidade),writeln(Estado),writeln(Cep),writeln(Celular),writeln(Telefone),
        write('*********************************.\n'),
    fail.
opcoes(6).
opcoes(7):-
    writeln('Soma dos Automoveis'),
    retractall(cont(_)),
    assert(cont(0)),
    contar.

opcoes(8):-
    salva_base,
    menu.
opcoes(9):-
   carrega_cadastro.
opcoes(10):-
    retractall(automovel(_,_,_,_,_,_,_,_,_,_,_,_,_,_,_)).
opcoes(11):-
    write('Placa: '),
    read(Placa),
    localiza(_,Placa,_,_,_,_,_,_,_,_,_,_,_,_,_),
    menuinfo.


opcoes(12):-
    writeln('Saindo...'),
    writeln('.\n'),
    write('.\n'),fail.
opcoes(X):-
    X >12,
    writeln('opcao invalida'),
    write('/'),
    write('/'),
    menu.

localiza(_,_,Nome,Sobrenome,_,_,_,_,_,_,_,_,_,_,_):-
    automovel(Renavam,Placa,Nome,Sobrenome,Marca,Modelo,Ano,Logradouro,Numero,Complemento,Cidade,Estado,Cep,Celular,Telefone),
     writeln(Renavam),writeln(Placa),writeln(Nome),writeln(Sobrenome),writeln(Marca),writeln(Modelo),writeln(Ano),writeln(Logradouro),writeln(Numero),writeln(Complemento),writeln(Cidade),writeln(Estado),writeln(Cep),writeln(Celular),writeln(Telefone).

contar:-
    automovel(_,_,_,_,_,_,_,_,_,_,_,_,_,_,_),
    retract(cont(S)),
    Z is S +1,
    assert(cont(Z)),
    fail.
contar:-
    cont(Z),
    writeln("Total de Automoveis"),
    writeln(Z).
salva_base:-
    tell('novoAutomovel.txt'),
    listing(automovel/15),
    told.
menuinfo:-
    write('*********************************.\n'),
    write('*      Alterar Informacoes      *.\n'),
    write('*********************************.\n'),
    write('.\n'),
    write('.\n'),
    write('.\n'),
    write('Escolha qual das opções abaixo.\n'),
    write('1-Alterar Nome.\n'),
    write('2-Alterar Sobrenome.\n'),
    write('3-Alterar Logradouro.\n'),
    write('4-Alterar Numero.\n'),
    write('5-Alterar Complemento.\n'),
    write('6-Alterar Cidade.\n'),
    write('7-Alterar Estado.\n'),
    write('8-Alterar CEP.\n'),
    write('9-Alterar Celular.\n'),
    write('10-Alterar Telefone.\n'),
    write('11-Retornar pro menu.\n'),
    write('.\n'),
    write('.\n'),
    writeln('Informe a opção: '),
    read(A),
    opcoesinfo(A),
    menuinfo. % se 5 ,!,Fail. caso sem erros, direto Fail.
opcoesinfo(1):-
    automovel(Renavam,Placa,_,Sobrenome,Marca,Modelo,Ano,Logradouro,Numero,Complemento,Cidade,Estado,Cep,Celular,Telefone),
    write('Nome do Proprietario: '),
    read(Nome2),
    assert(automovel(Renavam,Placa,Nome2,Sobrenome,Marca,Modelo,Ano,Logradouro,Numero,Complemento,Cidade,Estado,Cep,Celular,Telefone)).

opcoesinfo(2):-
     automovel(Renavam,Placa,Nome,_,Marca,Modelo,Ano,Logradouro,Numero,Complemento,Cidade,Estado,Cep,Celular,Telefone),
    write('Sobrenome do Proprietario: '),
    read(Sobrenome),
    retract(automovel(Renavam,Placa,Nome,Sobrenome,Marca,Modelo,Ano,Logradouro,Numero,Complemento,Cidade,Estado,Cep,Celular,Telefone)),
    assert(automovel(Renavam,Placa,Nome,Sobrenome,Marca,Modelo,Ano,Logradouro,Numero,Complemento,Cidade,Estado,Cep,Celular,Telefone)).
opcoesinfo(3):-
     automovel(Renavam,Placa,Nome,Sobrenome,Marca,Modelo,Ano,_,Numero,Complemento,Cidade,Estado,Cep,Celular,Telefone),
    write('Logradouro: '),
    read(Logradouro),
    assert(automovel(Renavam,Placa,Nome,Sobrenome,Marca,Modelo,Ano,Logradouro,Numero,Complemento,Cidade,Estado,Cep,Celular
                    ,Telefone)).
opcoesinfo(4):-
     automovel(Renavam,Placa,Nome,Sobrenome,Marca,Modelo,Ano,Logradouro,_,Complemento,Cidade,Estado,Cep,Celular,Telefone),
    write('Número: '),
    read(Numero),
    assert(automovel(Renavam,Placa,Nome,Sobrenome,Marca,Modelo,Ano,Logradouro,Numero,Complemento,Cidade,Estado,Cep,Celular,Telefone)).
opcoesinfo(5):-
     automovel(Renavam,Placa,Nome,Sobrenome,Marca,Modelo,Ano,Logradouro,Numero,_,Cidade,Estado,Cep,Celular,Telefone),
    write('Complemento: '),
    read(Complemento),
    assert(automovel(Renavam,Placa,Nome,Sobrenome,Marca,Modelo,Ano,Logradouro,Numero,Complemento,Cidade,Estado,Cep,Celular,Telefone)).
opcoesinfo(6):-
     automovel(Renavam,Placa,Nome,Sobrenome,Marca,Modelo,Ano,Logradouro,Numero,Complemento,_,Estado,Cep,Celular,Telefone),
    write('Cidade: '),
    read(Cidade),
    assert(automovel(Renavam,Placa,Nome,Sobrenome,Marca,Modelo,Ano,Logradouro,Numero,Complemento,Cidade,Estado,Cep,Celular,Telefone)).
opcoesinfo(7):-
     automovel(Renavam,Placa,Nome,Sobrenome,Marca,Modelo,Ano,Logradouro,Numero,Complemento,Cidade,_,Cep,Celular,Telefone),
    write('Estado: '),
    read(Estado),
    assert(automovel(Renavam,Placa,Nome,Sobrenome,Marca,Modelo,Ano,Logradouro,Numero,Complemento,Cidade,Estado,Cep,Celular,Telefone)).
opcoesinfo(8):-
     automovel(Renavam,Placa,Nome,Sobrenome,Marca,Modelo,Ano,Logradouro,Numero,Complemento,Cidade,Estado,_,Celular,Telefone),
    write('CEP: '),
    read(Cep),
    assert(automovel(Renavam,Placa,Nome,Sobrenome,Marca,Modelo,Ano,Logradouro,Numero,Complemento,Cidade,Estado,Cep,Celular,Telefone)).

opcoesinfo(9):-
     automovel(Renavam,Placa,Nome,Sobrenome,Marca,Modelo,Ano,Logradouro,Numero,Complemento,Cidade,Estado,Cep,_,Telefone),
    write('Celular: '),
    read(Celular),
    assert(automovel(Renavam,Placa,Nome,Sobrenome,Marca,Modelo,Ano,Logradouro,Numero,Complemento,Cidade,Estado,Cep,Celular,Telefone)).
opcoesinfo(10):-
    automovel(Renavam,Placa,Nome,Sobrenome,Marca,Modelo,Ano,Logradouro,Numero,Complemento,Cidade,Estado,Cep,Celular,_),
    write('Telefone: '),
    read(Telefone),
    assert(automovel(Renavam,Placa,Nome,Sobrenome,Marca,Modelo,Ano,Logradouro,Numero,Complemento,Cidade,Estado,Cep,Celular,Telefone)).

opcoesinfo(11):-
    menu.
opcoesinfo(X):-
    X >12,
    writeln('opcao invalida'),
    write('/'),
    write('/'),
    menuinfo.





















