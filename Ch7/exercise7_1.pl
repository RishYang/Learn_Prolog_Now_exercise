    s--> foo,bar,wiggle.
    foo --> [choo].
    foo --> foo,foo.
    bar --> mar,zar.
    mar --> me,my.
    me --> [i].
    my --> [am].
    zar --> blar,car.
    blar --> [a].
    car --> [train].
    wiggle --> [toot].
    wiggle --> wiggle,wiggle.
% Part One
% load given code and use `listing/1` to check the answers.

/*
s(A, B) :-
    foo(A, C),
    bar(C, D),
    wiggle(D, B).

foo([choo|A], A).
foo(A, B) :-
    foo(A, C),
    foo(C, B).

bar(A, B) :-
    mar(A, C),
    zar(C, B).

mar(A, B) :-
    me(A, C),
    my(C, B).

me([i|A], A).

my([am|A], A).

zar(A, B) :-
    blar(A, C),
    car(C, B).

blar([a|A], A).

car([train|A], A).

wiggle([toot|A], A).
wiggle(A, B) :-
    wiggle(A, C),
    wiggle(C, B).
*/

% Part two
% s(X, []).
% s(_7288, []).
% foo(_7288, _7444)
% foo([choo|_7430], _7430)
% bar(_7430, _7450)
% mar(_7430, _7450)
