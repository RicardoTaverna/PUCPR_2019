deleta(X,[X|T],T).
deleta( X,[ H | T],[ H | R]):-
    deleta( X, T, R),!.



deleta_todos( X,[ X| T], R):-
    !,deleta_todos( X, T, R).
deleta_todos( X,[ H| T],[ H| R]):-
    !,deleta_todos( X, T, R).
deleta_todos(_,[ ],[ ]).


deleta_nesimo( N,[ H| T],[ H| R]):-
    N > 1,
    N1 is N-1,
    deleta_nesimo( N1, T, R).

deleta_nesimo(1,[_| T], T).



nivela([],[]).
nivela([X|Y], L):-
    nivela(X, L1),!,
    nivela(Y, L2),!,
    append(L1, L2, L).

nivela(X,[X]).

%invervalo(1,5,X). -> X = [1,2,3,4,5]

intervalo(F, F, [F]).
intervalo(N, F, [N|X]):-
    N1 is N + 1,
    intervalo(N1, F, X),!.

%inteiros(6,X).

inteiros(F,[F]).
inteiros(F, [X|F]):-
    N is F - 1,
    F > 1,
    inteiros(N, X).
