/* Determines the father of a child */
father(F,C) :- male(F), parent(F,C).
/* The underscore acts as a placeholder 
* for some variable */
father(F) :- father(F, _).
/* Can we provide a function as a 
* parameter to another funciton? */
grandfather(F, C) :- father(father(F), C).
/* X \== Y is the same as \+(X=Y) */
sibling(X, Y) :- parent(Z, X), parent(Z, Y), X \== Y. % as a note, this is a single line comment
male(douglas).
male(gregory).
female(rita).
female(rosa).
parent(douglas, rosa).
parent(rita, rosa).
parent(douglas, gregory).
parent(rita, gregory).
parent(rosa,linda).
