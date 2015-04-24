/* First attempt at some prolog code */

% Declaring some people
male(tim).
male(scott).
male(joe).
male(tony).
male(mike).
female(katie).
female(jean).
female(phyllis).
female(nicky).

% The marrage stats
married(scott, jean).
married(joe, phyllis).
married(mike, nicky).

% The parental stats
parent(scott, tim).
parent(jean, tim).
parent(scott, katie).
parent(jean, katie).
parent(nicky, tony).
parent(mike, tony).
parent(joe, scott).
parent(phyllis, scott).
parent(joe, nicky).
parent(phyllis, nicky).

% and a few rules
mother(M, C)   :- parent(M, C), female(M).
father(F, C)   :- parent(F, C), male(F).
daughter(D, P) :- parent(P, D), female(D).
son(S, P)      :- parent(P, S), male(S).
sibling(A, B)
               :- parent(P, A), parent(P, B), \+(A = B).
brother(B, S)  :- sibling(B, S), male(B).
sister(Sis, Sib)
               :- sibling(Sis, Sib), female(Sis).
aunt(Aunt, Rel):- sister(Aunt, Parent), parent(Parent, Rel).
uncle(Uncle, Rel)
               :- brother(Uncle, Parent), parent(Parent, Rel).
cousin(Cus, Rel)
%:- parent(Cus, Link), sibling(Link, Parent), parent(Parent, Rel).
               :- ancestor(Anc, Cus), ancestor(Anc, Rel), \+ (Cus = Rel), 
               \+ sibling(Cus, Rel), \+ parent(Rel, Cus), \+ aunt(Rel, Cus), 
               \+ uncle(Rel, Cus).
ancestor(Anc, Dec) 
               :- parent(Anc, Dec).
ancestor(Anc, Dec)
               :- parent(Par, Dec), ancestor(Anc, Par).
descentdant(Dec, Anc)
               :- ancestor(Anc, Dec).

