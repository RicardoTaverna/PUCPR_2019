%busca_prof(1, 28, [1], Caminho, 0,D).



aresta(rs,sc,1).
aresta(sc,pr,1).
aresta(pr,sp,1).
aresta(pr,ms,1).
aresta(sp,mg,1).
aresta(sp,rj,1).
aresta(ms,go,1).
aresta(ms,mt,1).
aresta(rj,es,1).
aresta(rj,mg,1).
aresta(mg,go,1).
aresta(mg,bh,1).
aresta(es,mg,1).
aresta(es,bh,1).
aresta(go,mt,1).
aresta(go,to,1).
aresta(mt,pa,1).
aresta(mt,to,1).
aresta(mt,am,1).
aresta(mt,ro,1).
aresta(ro,am,1).
aresta(bh,se,1).
aresta(bh,al,1).
aresta(bh,pe,1).
aresta(bh,pi,1).
aresta(bh,to,1).
aresta(se,al,1).
aresta(al,pe,1).
aresta(pe,pa,1).
aresta(pa,rn,1).
aresta(pa,ce,1).
aresta(ce,pi,1).
aresta(pi,ma,1).
aresta(pi,to,1).
aresta(ma,pa,1).
aresta(pa,to,1).
aresta(pa,ap,1).
aresta(pa,rr,1).
aresta(pa,am,1).
aresta(rr,am,1).
aresta(am,ac,1).

conectado(X, Y, D):-aresta(X, Y, D).
conectado(X, Y, D):-aresta(Y, X, D).

prox_nodo(Atual, Prox, Visitados, D):-
    conectado(Atual, Prox, D),
    %(aresta(Atual, Prox);aresta(Prox,Atual)),
    \+member(Prox, Visitados).

busca_profex2(Meta, Meta, _,[Meta]):-!.

busca_profex2(Inicio, Meta, Visitados,[Inicio|Caminho]):-
    prox_nodo(Inicio, Prox, Visitados, _),
    reverse(Visitados, RVisitados),
    writeln(RVisitados),
    busca_profex2(Prox, Meta, [Prox|Visitados], Caminho),!.


busca_prof(Meta, Meta, _, [Meta], D, D):-!.

busca_prof(Inicio, Meta, Visitados,[Inicio|Caminho], Dr, D):-
    prox_nodo(Inicio, Prox, Visitados, P),
    %reverse(Visitados, RVisitados),
    X is Dr + P,
    %write(RVisitados),
    %write(Dr),nl,
    busca_prof(Prox, Meta, [Prox|Visitados], Caminho, X, D).


busca_profdt(Meta, Meta, _, [Meta], D, D):-!.

busca_profdt(Inicio, Meta, Visitados,[Inicio|Caminho], Dr, D):-
    busca_prof(Inicio, Meta, Visitados,[Inicio|Caminho], Dr, D),
    write(..),write(D),
    %Count is Count + 1,
    Dr is Dr + 1,
    write(Dr),nl,
    fail.

busca_profdt(_,_).



busca_larg(Inicio,Meta,Caminho):-
    busca_larg_a(Meta,[n(Inicio,[])],[],RCaminho),
    reverse(RCaminho,Caminho).

busca_larg_a(Meta,[n(Meta,Caminho)|_],_,Caminho).

busca_larg_a(Meta,[n(Inicio,CI)|RCI],Visitados,Caminho):-
%write("--------"),nl,
%write(Meta),write(" I:"),write(Inicio),write("CI"),
%write(CI),write( "RCI:"),write(RCI),nl,
    findall(n(I1,[I1|CI]),(conectado(Inicio,I1,A),\+member(I1,Visitados)),Cs),
%write(Cs),nl,
    append(RCI,Cs,NC),
%write(NC),nl,
       %NVisitados?
       %write(Visitados),
    busca_larg_a(Meta,NC,[Inicio|Visitados],Caminho).




