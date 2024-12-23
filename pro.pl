/* woman(mia).
woman(jody).
woman(yolanda).
playsAirGuitar(jody).
listensToMusic(mia).
happy(yolanda).
playsAirGuitar(mia) :- listensToMusic(mia).
playsAirGuitar(yolanda) :- listensToMusic(yolanda).
listensToMusic(yolanda):- happy(yolanda).
happy(vincent).
listensToMusic(butch).
playsAirGuitar(vincent):- listensToMusic(vincent), happy(vincent).
playsAirGuitar(butch):- happy(butch).
playsAirGuitar(butch):- listensToMusic(butch). */
/*
% Facts: Family tree relationships
parent(john, mary).
parent(mary, alice).
parent(mary, bob).
parent(alice, emily).
parent(bob, george).

male(john).
male(bob).
male(george).
female(mary).
female(alice).
female(emily).

% Rules
grandparent(X, Y) :- parent(X, Z), parent(Z, Y). % X is a grandparent of Y if X is a parent of Z, and Z is a parent of Y.
sibling(X, Y) :- parent(P, X), parent(P, Y), X \= Y. % X and Y are siblings if they share a parent and are not the same person.
ancestor(X, Y) :- parent(X, Y). % Base case: X is an ancestor of Y if X is a parent of Y.
ancestor(X, Y) :- parent(X, Z), ancestor(Z, Y). % Recursive case: X is an ancestor of Y if X is a parent of Z, and Z is an ancestor of Y.

% Modus ponens application
is_male_ancestor(X, Y) :- ancestor(X, Y), male(X). % If X is an ancestor of Y and X is male, then X is a male ancestor of Y.


% Facts
parent(john, mary).
parent(john, jerry).
parent(mary, alice).
parent(mary, bob).
parent(bob, george).

male(john).
male(bob).
male(jerry).
male(george).
female(mary).
female(alice).

% Rules
sibling(X, Y) :-
    parent(P, X),
    parent(P, Y),
    X \= Y. % X and Y are siblings if they share a parent but are not the same person.

brother(X, Y) :-
    sibling(X, Y),
    male(X). % X is a brother of Y if they are siblings and X is male.

uncle(Uncle, X) :-
    parent(Parent, X),
    brother(Uncle, Parent). % Uncle is a brother of one of X's parents.
	
	
% Facts
parent(john, mary).
parent(mary, alice).
parent(mary, bob).
parent(bob, george).
parent(john, anna).
parent(anna, sophia).
parent(anna, tom).

% Rule to define grandparent relationships
grandparent(GP, GC) :-
    parent(GP, P),
    parent(P, GC). % GP is a grandparent of GC if GP is a parent of P and P is a parent of GC.

% Rule to find shared grand-parenthood
shared_grandparenthood(X, Y, GP) :-
    grandparent(GP, X),
    grandparent(GP, Y),
    X \= Y. % X and Y share a grandparent GP but are not the same person.

*/


cls:- write('\e[H\e[2J').
