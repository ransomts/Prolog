male(gregory).
male(douglas).
female(rita).
female(rosa).
parent(douglas, rosa).
parent(rita, rosa).
parent(douglas, gregory).
parent(rita, gregory).
parent(rosa,linda).
grandfather(X) :- father(X), parent(X,Y), parent(Y,_).
father(X) :- male(X), parent(X,_).
sibling(X,Y) :- \+(X=Y), parent(Z,X), parent(Z,Y).
