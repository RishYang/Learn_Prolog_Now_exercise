% 5.2
increment(X, Y):- X =:= Y-1.
% 5.3
sum(X,Y,Z):- Z =:= X+Y.

% 5.4
% There are four version of addone but it only two(first two `addone` and `addone_t`)
% recursive
addone([], []).
addone([H|T], [O|X]) :- O is H+1, addone(T, X).

% tail recursive
% The `reverse/2` is swish-prolog built-in function of reversing list.
% Check procedural meaning
accAddone([H|T], X, A) :- Xnew is H+1,accAddone(T, [Xnew|X],A).
accAddone([], A, A).

addone_t(List, A) :- accAddone(List, [], Ar), reverse(Ar, A).

accAddone2([], A, A).
accAddone2([H|T], X, A) :- Xnew is H+1, accAddone2(T, [Xnew|X],A).

addone_t2(List, A) :- accAddone2(List, [], Ar), reverse(Ar, A).

% The last one is coded accidently and I did not want to delet it.
revaddone([],[]).
revaddone([H|T], [H_addOne|A]) :- H_addOne is H+1, revaddone(T, A).
