
%For all of these, especially the first two, see the examples in the book
%Ignore the Singleton variable warning, that goes away when you 
% define the rules. 

%heurope map coloring problem -- use these colors as the domain
europe_color(Fr,Sw,It,Be,Ho,Ge,Au):- color(Fr), color(Sw), color(It), color(Be), color(Ho), color(Ge), color(Au), \+ Fr=Sw, \+Fr=It, \+Fr=Be, \+Fr=Ge, \+Sw=It, \+Sw=Au, \+Sw=Ge, \+It=Au, \+Be=Ho, \+Be=Ge, \+Ho=Ge, \+Ge=Au.

cryptarithmetic(C,R,O,S,A,D,N,G,E):-dig(S),
				     R is (S+S) mod 10, C1 is (S+S) // 10,
				     dig(D), D > 0,
				     E is (S+D+C1) mod 10, C10 is (S+D+C1) // 10,
				     dig(O), dig(A),
				     G is (O+A+C10) mod 10, C100 is (O+A+C10) // 10,
				     dig(R), R > 0,
				     N is (R+O+C100) mod 10, C1000 is (R+O+C100) // 10,
				     dig(C), C > 0,
				     A is (C+R+C1000) mod 10, D is (C+R+C1000) //10,
				     uniq_digits(C,R,O,S,A,D,N,G,E).

uniq_digits(C,R,O,S,A,D,N,G,E):- dig(C), dig(R), dig(O), dig(S), dig(A), dig(D), dig(N), dig(G), dig(E),
				 \+C=R, \+C=O, \+C=S, \+C=A, \+C=D, \+C=N, \+C=G, \+C=E,
				 \+R=O, \+R=S, \+R=A, \+R=D, \+R=N, \+R=G, \+R=E,
				 \+O=S, \+O=A, \+O=D, \+O=N, \+O=G, \+O=E,
				 \+S=A, \+S=D, \+S=N, \+S=G, \+S=E,
				 \+A=D, \+A=N, \+A=G, \+A=E,
				 \+D=N, \+D=G, \+D=E,
				 \+N=G, \+N=E,
				 \+G=E.


%Persons are just their names, lower case
who_ordered_pizza(PizzaPerson):- uniq_people(PizzaPerson, P1, P2, P3), uniq_people(S,Ch,L,P), uniq_people(M,Coke,W,Coffee),
				 beside(P1,PizzaPerson), beside(P2,P3), across(PizzaPerson,P2), 
				 across(P1,P3),
				 beside(S,P2), \+beside(Ch,P2), \+beside(L,P2), \+beside(P,P2),
				 Ch=Coke, \+Ch=M, \+Ch=W, \+Ch=Coffee,
				 across(L,M), \+across(L,Coke), \+across(L,W), \+across(L,Coffee),

				 \+P3=Coffee,
				 PizzaPerson=W, 
				 \+PizzaPerson=M, \+PizzaPerson=Coke, \+PizzaPerson=Coffee,
				 		 		 write(PizzaPerson), write(P), write(W), nl,
				 write(P1), write(S), write(M), nl, 
				 write(P2), write(Ch), write(Coke), nl,
				 write(P3), write(L), write(Coffee), nl, nl.

				 PizzaPerson=P, P1=S, P2=Ch, P3=L,
		 		 write(PizzaPerson), write(P), write(W), nl,
				 write(P1), write(S), write(M), nl, 
				 write(P2), write(Ch), write(Coke), nl,
				 write(P3), write(L), write(Coffee), nl, nl.

uniq_people(W,X,Y,Z):- person(X), person(W), person(Y), person(Z),
		       \+W=X, \+W=Y, \+W=Z,
		       \+X=Y, \+X=Z,
		       \+Y=Z.

beside(david,doreen). beside(danny,donna). beside(doreen,david). beside(donna,danny).
across(david,danny). across(doreen,donna). across(danny,david). across(donna,doreen).

person(donna). person(danny). person(doreen). person(david).
