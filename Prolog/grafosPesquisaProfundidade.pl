%aresta(+inicio, +meta)aresta(1,7).
%aresta tem peso 1
%aresta(1,8,1)
%
% busca_larg(Inicio, Meta, Caminho):-
%    busca_larg_a(Meta, [n(Inicio, [])], [], RCaminho),
%    reverse(Rcaminho, Caminho).
%
% busca_larg_a(Meta, [n(Meta, Caminho) |_],_,Caminho).
%
% busca_larg_a(Meta, [n(Inicio,CI)|RCI], Visitados, Caminho):-
%     write("-------------"), nl,
%    write(Meta), write(" I:"),write(Inicio),write(" CI:"),
%    write(CI), write(" RCI:"),write(RCI),nl,
%    findall(n(I1, [A|CI]), (aresta(Inicio, I1, A), \+member(I1,
%    Visitados)),Cs),
%    append(RCI, Cs,NC),
%    write(Cs), nl,
%    busca_larg_a(Meta,NC,[Inicio|Visitados], Caminho).


aresta(1,7,1).
aresta(1,8,1).
aresta(1,3,1).
aresta(7,4,1).
aresta(7,20,1).
aresta(7,17,1).
aresta(8,6,1).
aresta(3,9,1).
aresta(3,12,1).
aresta(9,19,1).
aresta(4,42,1).
aresta(20,28,1).
aresta(17,10,1).
aresta(6,10,1).
aresta(10,28,1).

%busca_prof(1, 28, [1], Caminho, D) D-> soma das aresta
% busca_prof1(1, 28, [1], Caminho, 0, D) -> nao percorreu aresta

%Peso(Atual, Prox, D):-



conectado(X, Y, D):-aresta(X, Y, D).
conectado(X, Y, D):-aresta(Y, X, D).

prox_nodo(Atual, Prox, Visitados, D):-
    conectado(Atual, Prox, D),
    %(aresta(Atual, Prox);aresta(Prox,Atual)),
    \+member(Prox, Visitados).

busca_prof(Meta, Meta, _, [Meta], D, D).

busca_prof(Inicio, Meta, Visitados,[Inicio|Caminho], Dr, D):-
    prox_nodo(Inicio, Prox, Visitados, P),
    reverse(Visitados, RVisitados),
    X is Dr + P,
    write(RVisitados),
    write(Dr),nl,
    busca_prof(Prox, Meta, [Prox|Visitados], Caminho, X, D).








