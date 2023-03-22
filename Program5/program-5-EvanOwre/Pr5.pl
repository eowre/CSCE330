%consider pattern matching and head-tail notation for these

exactly3(L):- member(X,L), member(Y,L), member(Z,L), [X,Y,Z]=L.

at_least_3(L):- exactly3(L).
at_least_3(L):- append(X,Z,L), \+member(X,Z), exactly3(Z).

at_most_3(L):- exactly3(L).
at_most_3(L):- \+at_least_3(L).

intersect(L1,L2):- member(X,L1), member(X,L2).

all_intersect(ListofLists,L):- ListofLists = [].
all_intersect(ListofLists,L):- ListofLists = [X|Y], intersect(X,L), all_intersect(Y,L).

%source removal, see pdf. You'll probably want to define helper predicates
% assume G is set and you need to return list of nodes
% as [a,b,d...], not [ [a|[v,d]], [b| [d] ], [d| [c,x]],... ]'
source_removal(G,Toposort):-fail.
