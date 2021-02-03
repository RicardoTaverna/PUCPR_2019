:-dynamic media_aluno/1.


carrega_alunos:-
    consult('alunos.txt'),
    retractall(media_aluno(_)),
    assert(media_aluno(0)).

imprime_aluno:-
    writeln('=============================='),
    writeln('**      Notas da Turma      **'),
    writeln('=============================='),
    writeln(''),
    write('Nome'),
    tab(2),
    write('N1'),
    tab(2),
    write('N2'),
    tab(2),
    write('N3'),
    tab(2),
    write('Média'),
    writeln(''),
    writeln('------------------------------'),
    print_aluno.


print_aluno:-
    aluno(X,N1,N2,N3),
    write(X),
    tab(2),
    write(N1),
    tab(3),
    write(N2),
    tab(3),
    write(N3),
    tab(3),
    media(N1,N2,N3),
    writeln(''),
    writeln('------------------------------'),
    fail.

print_aluno:-
    writeln('==============================').

media(N1,N2,N3):-
    Z is N1 + N2 + N3,
    M is Z/3,
    format('~2f', M).




