pares([], []).

pares([X|Y], [X|Z]):-
    par(X),
    pares(Y,Z),!.

pares([X|Y], Z):-
    pares(Y,Z).

par(X):-
    X mod 2 =.= 0.
