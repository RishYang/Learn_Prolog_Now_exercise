% Ch5 exercise
% auxiliary function: `rev/2` for reverse, `append/3`, `prefix/2`, `suffix/2`, `sublist/2`, `member/2`
rev(List, Result) :- revacc(List, [], Result).

revacc([], A, A).
revacc([H|T], A, Result) :- revacc(T, [H|A], Result).

append([], B, B).
append([H|T], B, [H|Result]) :- append(T, B, Result).

prefix(X, List) :- append(X, _, List).
suffix(X, List) :- append(_, X, List).
sublist(SubL, L):- suffix(S, L), prefix(SubL, S).

member(H, [H|T]).
member(X, [H|T]) :- member(X, T).
% 1. `double/2`
% `double/2` is the Result as two identical list are appended together
double(List, Result) :- append(List, List, Result).

% 2. `palindrome/1`
% `palindrome/1` a list reversed is original list
palindrome(List) :- rev(List, List).

% 3. `toptail/2`
% remove top and tail
% take care of the order of list
toptail([H|T], Result) :- rev(T, [_|RevResult]), rev(RevResult, Result).
% with `last`
toptail2([H|T], Result) :- last1(T, Tail), append(Result, Tail, T).

% 4. `last/2`
% reversed head is unreversed list's tail
last1(List, X) :- rev(List, [X|_]).
% split the list till tail list is empty
last2([H|_], X) :- last2(T, X).
last2([H|[]], H).

% 5. `swapfl/2`
% get middle list and `append([Tail|Middle], [Top], Result)`
% without `toptail/2`
swapfl([Top|Tl], List) :- last1(Tl, Tail), append(Middle, [Tail], Tl), append([Tail|Middle], [Top], List).
% with `toptail/2`
swapfl2([Top|Tl], List) :- last1(Tl, Tail), toptail([Top|Tl], Middle), append([Tail|Middle], [Top], List).

% 5. logic puzzle
% too hard for me to answer
% The solution is from @dragonwasrobot on github
% his github https://github.com/dragonwasrobot/learn-prolog-now-exercises/blob/master/chapter-06/exercises.pl
% I am still working on my own solution
%home(red, englishman)
street([X,Y,Z]) ;- [X1,X2,X3] = X, [Y1,Y2,Y3] = Y, [Z1,Z2,Z3] = Z
zebra(X):-
    Street = [_,_,_],
    member(home(red, englishman, _),Street),
    member(home(_, spanish, jaguar),Street),
    sublist([home(_,_,snail), home(_,japanese,_)],Street),
    sublist([home(_,_,snail), home(blue,_,_)], Street),
    member(home(_,X,zebra),Street).
