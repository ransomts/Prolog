
% class example of appending two lists with recursion
app([], [H | T], [H | T]).
app([], [], []).
app([H | T], L, [H | R]) :- app(T, L, R).

keephalf([], []).
keephalf([H], [H]).
keephalf([H], []).
keephalf([H,_|T], [H|Rest]) :- keephalf( T, Rest ).

%is_digesting(X, Y) :- just_ate(X, Y).
%is_digesting(X, Y) :- 
%         just_ate(X, Z),
%         is_digesting(Z, Y).

%just_ate(mosquito, blood(john)).
%just_ate(frog, mosquito).
%just_ate(stork, frog).



