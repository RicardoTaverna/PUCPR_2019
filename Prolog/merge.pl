merge(X, [], X).

merge([], X, X).

merge([X1|Y1], [X2|Y2], [X1|Z]):-
    X1 =< X2,
    merge(Y1, [X2|Y2], Z),!.

merge([X1|Y1], [X2|Y2], [X1|Z]):-
    X2 =< X1,
    merge(Y2, [X1|Y1], Z),!.


