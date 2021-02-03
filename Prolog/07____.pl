fronteira(porto_alegre,florianopolis,1).

fronteira(florianopolis,curitiba,1).

fronteira(curitiba,sao_paulo,1).

fronteira(curitiba,campo_grande,1).

fronteira(sao_paulo,campo_grande,1).

fronteira(sao_paulo,belo_horizonte,1).

fronteira(sao_paulo,rio_de_janeiro,1).

fronteira(campo_grande,belo_horizonte,1).

fronteira(campo_grande,goiania,1).

fronteira(campo_grande,cuiaba,1).

fronteira(rio_de_janeiro,belo_horizonte,1).

fronteira(rio_de_janeiro,vitoria,1).

fronteira(belo_horizonte,goiania,1).

fronteira(belo_horizonte,salvador,1).

fronteira(belo_horizonte,vitoria,1).

fronteira(vitoria,salvador,1).

fronteira(goiania,cuiaba,1).

fronteira(goiania,palmas,1).

fronteira(goiania,salvador,1).

fronteira(cuiaba,porto_velho,1).

fronteira(cuiaba,manaus,1).

fronteira(cuiaba,belem,1).

fronteira(cuiaba,palmas,1).

fronteira(salvador,palmas,1).

fronteira(salvador,recife,1).

fronteira(salvador,maceio,1).

fronteira(salvador,aracaju,1).

fronteira(palmas,belem,1).

fronteira(palmas,sao_luis,1).

fronteira(palmas,teresina,1).

fronteira(porto_velho,rio_branco,1).

fronteira(porto_velho,manaus,1).

fronteira(aracaju,maceio,1).

fronteira(maceio,recife,1).

fronteira(recife,fortaleza,1).

fronteira(recife,joao_pessoa,1).

fronteira(joao_pessoa,fortaleza,1).

fronteira(joao_pessoa,natal,1).

fronteira(natal,fortaleza,1).

fronteira(teresina,sao_luis,1).

fronteira(teresina,recife,1).

fronteira(teresina,fortaleza,1).

fronteira(sao_luis,teresina,1).

fronteira(sao_luis,belem,1).

fronteira(belem,macapa,1).

fronteira(belem,manaus,1).

fronteira(belem,boa_vista,1).

fronteira(boa_vista,manaus,1).

fronteira(manaus,rio_branco,1).

fronteira(macapa,belem,1).


conectado(X,Y,P):-
    fronteira(X,Y,P).

conectado(X,Y,P):-
    fronteira(Y,X,P).

prox_nodo(Atual, Prox, Visitados,P):-
    conectado(Atual, Prox,P),
    \+member(Prox, Visitados). %Not member.


%Exercicios 2
busca_profundidade1(Meta, Meta, _,[Meta]):-!.

busca_profundidade1(Inicio, Meta, Visitados,[Inicio|Caminho]):-
    prox_nodo(Inicio, Prox, Visitados,P),
    reverse(Visitados, RVisitados),
    writeln(RVisitados),
    busca_profundidade1(Prox, Meta, [Prox|Visitados], Caminho),!.

%Exercicio 3
busca_profundidade(Meta, Meta, _,[Meta],Distancia,Distancia):-!.

busca_profundidade(Inicio, Meta, Visitados,[Inicio|Caminho],Peso,Distancia):-
    prox_nodo(Inicio, Prox, Visitados,P),
    reverse(Visitados, RVisitados),
    writeln(RVisitados),
    DistanciaX is Peso + P,
    writeln(DistanciaX),
    busca_profundidade(Prox, Meta, [Prox|Visitados], Caminho,DistanciaX,Distancia),!.

%Exercicio 4
busca_larg(Inicio,Meta,Caminho):-
busca_larg_a(Meta,[n(Inicio,[])],[],RCaminho),
reverse(RCaminho,Caminho).

busca_larg_a(Meta,[n(Meta,Caminho)|_],_,Caminho).

busca_larg_a(Meta,[n(Inicio,CI)|RCI],Visitados,Caminho):-
%write("--------"),nl,
%write(Meta),write(" I:"),write(Inicio),write("CI"),
%write(CI),write( "RCI:"),write(RCI),nl,
findall(n(I1,[I1|CI]),(fronteira(Inicio,I1,A),\+member(I1,Visitados)),Cs),
%write(Cs),nl,
append(RCI,Cs,NC),
%write(NC),nl,
       %NVisitados?
       %write(Visitados),
busca_larg_a(Meta,NC,[Inicio|Visitados],Caminho),!.


%Exercicio 5

busca_profundidade2(Meta, Meta, _,[Meta],Distancia,Distancia).

busca_profundidade2(Inicio, Meta, Visitados,[Inicio|Caminho],Peso,Distancia):-
    prox_nodo(Inicio, Prox, Visitados,P),
    reverse(Visitados, RVisitados),
    writeln(RVisitados),
    DistanciaX is Peso + P,
    writeln(DistanciaX),
    busca_profundidade(Prox, Meta, [Prox|Visitados], Caminho,DistanciaX,Distancia),nl,nl,nl,nl,sleep(2),fail.



