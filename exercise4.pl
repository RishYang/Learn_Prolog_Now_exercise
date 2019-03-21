% Exercise 4.1 and 4.2 are querise question, just query
% 4.3
% Write a predicate second(X,List) which checks whether X is the second element of List . 
% The fisrt and tail list don't matter so I use underline.
second(X, [_,X|_]).

% 4.4
%Write a predicate swap12(List1,List2) which checks whether List1 is identical to List2 , except that the first two elements are exchanged. 
% The first and ther second are exchanged
swap12([X,Y|T], [Y,X|T]).

% 4.5
% Write a predicate listtran(G,E) which translates a list of German number words to the corresponding list of English number words.

tran(eins,one).
tran(zwei,two).
tran(drei,three).
tran(vier,four).
tran(fuenf,five).
tran(sechs,six).
tran(sieben,seven).
tran(acht,eight).
tran(neun,nine).
% translate them one by one
listtran([], []).
listtran([H|T], [X|L]) :- tran(H, X), listtran(T, L).

% 4.6
% Write a predicate twice(In,Out) whose left argument is a list, and whose right argument is a list consisting of every element in the left list written twice. 
% if get a element of [H|T] (List), put two of it into Result
% twice(List, Result).
twice([], []).
twice([H|T], [H,H|L]) :- twice(T,L).

% 4.7
% Draw the search trees for the following three queries: 
% pass for now

% Below is practical session and practical session will have indepent file.
combine1([],[],[]).
combine1([H1|T1],[H2|T2],[H1,H2|L]) :- combine1(T1,T2,L).

combine2([],[],[]).
combine2([H1|T1],[H2|T2],[[H1,H2]|L]) :- combine2(T1,T2,L).

combine3([],[],[]).
combine3([H1|T1],[H2|T2],[j(H1,H2)|L]) :- combine3(T1,T2,L).
