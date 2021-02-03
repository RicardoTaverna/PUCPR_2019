nao(P):-
    P,!,fail.
nao(_).

animal(onca).
animal(papagaio).
animal(macaco).
animal(cachorro).
animal(gato).

gosta(ana,X):-
    animal(X),
    nao(X = macaco).

