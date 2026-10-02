male(abraham).
male(clancy).
male(herb).
male(homer).
male(bart).
female(mona).
female(jackie).
female(marge).
female(patty).
female(selma).
female(lisa).
female(maggie).
female(ling).

parent(abraham,herb).
parent(abraham,homer).
parent(mona,homer).
parent(clancy,marge).
parent(clancy,patty).
parent(clancy,selma).
parent(jackie,marge).
parent(jackie,patty).
parent(jackie,selma).
parent(homer,bart).
parent(homer,lisa).
parent(homer,maggie).
parent(marge,bart).
parent(marge,lisa).
parent(marge,maggie).
parent(selma,ling).


father(X,Y) :- parent(X,Y), male(X).
mother(X,Y) :- parent(X,Y),female(X).
son(X,Y) :- parent(Y,X), male(X).
daughter(X,Y) :- parent(Y,X), female(X).
brother(X,Y) :- male(X), parent(P,X), parent(P,Y), X\=Y.
sister(X,Y) :- female(X), parent(P,X), parent(P,Y), X\=Y.
grandfather(X,Y):- male(X), parent(X,P), parent(P,Y).
aunt(X,Y):- female(X), sister(X,P), parent(P,Y).
uncle(X,Y):- male(X), brother(X,P),parent(P,Y).
cousin(X,Y):- parent(P1,X),parent(P2,Y),sister(P1,P2).
cousin(X,Y):- parent(P1,X),parent(P2,Y),brother(P1,P2).

ancestor(X,Z):- parent(X,Z).
ancestor(X,Z):- parent(X,Y),ancestor(Y,Z).

% query test ===========
: 8 ?- uncle(herb,X).
% bart ;
$ lisa ;
% X = maggie.

%11 ?- ancestor(jackie, X).  
%X = marge ;
%X = patty ;
%X = selma ;
%X = bart ;
%X = lisa ;
%X = maggie ;
%X = ling ;
% false.




