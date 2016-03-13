
% separate 
% takes a list as input and spits out two lists
separate( [], [], [] ).
separate( [A], [A], [] ).
separate( [A, B | Rest], [A | XR], [B | YR] ) :- separate( Rest, XR, YR ).


% partiton
% takes a list and a value and partitions the list 
%  into two lists greater and less than the value
partition([], H, [], []).
partition([X | T], H, [X | L], G) :- X =< H, partition(T, H, L, G).
partition([X | T], H, L, [X | G]) :- X >  H, partition(T, H, L, G).

% quicksort
% the quicksort algorithm, with helper procedure partition
qsort( [], [] ).
qsort( [H|U], S ) :- partition(U, H, L, R), qsort(L, SL), qsort(R, SR), append(SL, [H|SR], S).

% mini
% takes a list of integers and returns the smallest value
mini([M], M).
mini([H | T], Minimum) :-
   mini(T, TailMin),
   Minimum is min(H, TailMin).

% rev
% Takes a list and spits out the reverse
app([], [], []).
app([], [H | T], [H | T]).
app([H | T], L, [H | R]) :- app(T, L, R).

rev([], []).
rev([H | T], R) :- rev(T, RevT), app(RevT, [H], R).
% For a call on a five element list, the app procedure is called 30
%     times, which does seem very inefficient.

% rev2
% Secondary implementation of the reverse procedure, this one 
%     signigicantly more efficient
rev2(X,Y)   :- rev2recursive(X,  [],   Y).
rev2recursive([], Solution,   Solution).
rev2recursive([H|T], Partial, Z) :- rev2recursive(T,  [H|Partial],   Z).

% insertion sort
insertsort(List, Sorted) :- isort(List, [], Sorted).
isort([], Acc, Acc).
isort([H | T], Acc, Sorted) :- insert(H, Acc, NAcc), isort(T, NAcc, Sorted).
   
insert(X, [Y | T], [Y | NT]) :- X > Y, insert(X, T, NT).
insert(X, [Y | T], [X , Y | T]) :- X =< Y.
insert(X, [], [X]).
