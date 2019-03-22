% programming part of practial session
% 1.
% You can think this problem as a sub-list problem.
% Make X be one member list. ([X])
% member(X, List) === subList([X], List) :- suffix(S, List), prefix(X, s).
% suffix(S, List):-append(_, S, List).
% prefix(P, List):-append(P, _, List).
% implement `member1/2` by in-built `append/3`
member1(X, List) :- append(_, M, List), append([X], _, M).

member2(X, List) :- app(_ , M, List), app([X], _, M).
app([], L, L).
app([H|T], L2, [H|L]) :- app(T, L2, L).

% 2.
% `set/2`
% I don't know whether there is a solution without `\+`.
set([H|T], OutList) :- set_rev(T, [H], OutList).

set_rev([], A, Ar) :- reverse(A, Ar).
set_rev([H|T], A, OutList) :-  member1(H, A), set_rev(T, A, OutList).
set_rev([H|T], A, OutList) :- \+ member1(H, A), set_rev(T, [H|A], OutList).

% 3.
% `flatten/2`
%
flatten(L, O) :- flatten_rev(L, [], O).

is_flat_and_Single(X) :- \+ [H|T] = X.
is_FandS(X) :- is_flat_and_Single(X).
% with `append`
flatten_rev([H|T], A, O) :- is_FandS(H), flatten_rev(T, [H|A], O).
flatten_rev([H|T], A, O) :- \+ is_FandS(H), flatten_rev(H, [], O1), append(O1, A, Anew), flatten_rev(T, Anew, O).
flatten_rev([], A, O) :- reverse(A, O).

% without `append/3`
flatten2(L, O) :- flatten_rev2(L, [], O).
flatten_rev2([H|T], A, O) :- is_FandS(H), 
                                flatten_rev2(T, [H|A], O).
flatten_rev2([H|T], A, O) :- \+ is_FandS(H), 
                                flatten_rev2(H, A, O1), 
                                flatten_rev2(T, O1, O).
flatten_rev2([], A, O) :- reverse(A, O).
