%yours
%Q1
mother(M,C):-false.

grand_parent(GP,GC):-false.

great_grand_mother(GGM,GGC):-false.

%Q2
sibling(A,B):-false.
brother(B,Sib):-false.
sister(S,Sib):-false.

%Q3 --
%You have to know both parents for both siblings for half_sibling
half_sibling(S1,S2):-false.

full_sibling(S1,S2):-false.

%Q4
first_cousin(C1,C2):-false.

second_cousin(C1,C2):-false.

%Q5
half_first_cousin(C1,C2):-false.

double_first_cousin(C1,C2):-false.

%Q6
first_cousin_twice_removed(C1,C2):-false.

%Q7
descendant(D,A):-false.

ancestor(A,D):-false.

%Q8
%this version of "cousin" does not handle "____ removed",
%read description carefully
cousin(X, Y):- false.

%Q9
%do not return anything for closest_common_ancestor(X,X,A).
closest_common_ancestor(R1,R2,A):-false.

% Q10 -- not scored, but will do
%   write_descendant_chain(jim,anna) and
%   write_descendant_chain(louise,gina) and
%   write_descendant_chain(emma,lily) <-this one shold print nothing
%   (make sure this does not fail (read the instructions carefully)).

write_child(X,Y):-
	write(X), write(' is a child of '), write(Y), nl.

write_descendant_chain(X,Y):- true.
