:-dynamic vendas_totais/1.
:-dynamic vendas_mes/1.

/*
    retract(venda(claudia, data(18,1,2015), 1, tenis,
    89.45)),assert(venda(claudia, data(18,1,2015), 1, tenis, 109.45)).

*/


carrega_vendas:-
    consult('vendas.txt'),
    retractall(vendas_totais(_)),
    assert(vendas_totais(0)),
    retractall(vendas_mes(_)),
    assert(vendas_mes(0)).



soma_vendas:-
    venda(_,_,Q,_,V),
    soma_tudo(Q,V),
    fail.

soma_vendas:-
    write('O total de vendas e: '),
    vendas_totais(X),
    format('~2f',X),
    retractall(vendas_totais(_)),
    assert(vendas_totais(0)).

soma_tudo(Q,V):-
    retract(vendas_totais(S)),
    Z is S + Q * V,
    assert(vendas_totais(Z)).


soma_vendas_mes(M,A):-
    venda(_,data(_,M,A),Q,_,V),
    soma_mes(Q,V),
    fail.

soma_vendas_mes(_,_):-
    write('O total de vendas no mes : '),
    vendas_mes(X),
    format('~2f', X),
    retractall(vendas_mes(_)),
    assert(vendas_mes(0)).

soma_mes(Q,V):-
    retract(vendas_mes(S)),
    Z is S + Q * V,
    assert(vendas_mes(Z)).

salva_base:-
    tell('novavenda.txt'),
    listing(venda/5),
    told.

salva_base2:-
    open('novo.txt',write,A),
    salva(A),
    close(A),
    write('ok').

salva(A):-
    retract(venda(N,data(D,M,A),Q,P,V)),
    write(A, venda(N, data(D,M,A),Q,P,V)),
    write(A,'.\n'),
    fail.

salva(_).
