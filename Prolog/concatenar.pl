concatenar([], X, X).

concatenar([X|Y], L2, [X|Z]):-
    concatenar(Y, L2, Z).

inverte([],[]).

inverte([X|Y], Z):-
    inverte(Y, Y1),
    concatenar(Y1, [X], Z).
