entre(X,Y,Z):-
    X>= Y,
    X=< Z.

fora(X,Y,_):-
    X < Y,!.

fora(X,_,Z):-
    X > Z.
