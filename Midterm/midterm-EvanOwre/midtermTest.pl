

:-['midtermF20.pl'].

%Section 1 KB (as DB):
%Student KnowledgeBase as a Database for a Gradesheet
%  -- each student has a unique id to identify them
%     in each table
%     DO NOT MODIFY the Little KB
%student(id,first name, last name)
% id is guaranteed to be unique
student(j0105,suzie,queue).
student(x4132,joe,bloe).
student(u5678,nelson,nero).
student(c1010,jane,doe).

% quizzes(id, quiz1, quiz2, quiz3, quiz4, quiz5)
quizzes(j0105,80,70,20,99,100).
quizzes(x4132,90,77,22,90,10).
quizzes(u5678,50,90,87,100,88).
quizzes(c1010,81,71,21,91,71).

%tests(id, midterm, final)
tests(j0105,50,90).
tests(x4132,90,77).
tests(u5678,80,70).
tests(c1010,81,71).

%TESTS
testq0_0(1):-initials(I),honor_code(I).
testq0_0(0):- \+ (initials(I),honor_code(I)).

testq0_1(1):-initials(I),online_portion(I).
testq0_1(0):- \+ (initials(I),online_portion(I)).

testq0_2(1):-initials(I),technical_issues(I).
testq0_2(0):- \+ (initials(I),technical_issues(I)).

testq0_3(1):-initials(I),write_general_rules(I).
testq0_3(0):- \+ (initials(I),write_general_rules(I)).

testq0_4(1):-initials(I),submission_and_issues(I).
testq0_4(0):- \+ (initials(I),submission_and_issues(I)).

testq1_0(S):-findall([ID,AVG],test_avg(ID,AVG),LL),
	         TRUEs= [[c1010, 76], [j0105, 70], [u5678, 75], [x4132, 83]],
			 sort(LL,SLL),
			 ((SLL=TRUEs,S is 5) ; (\+ SLL = TRUEs,S is 0)).

testq1_1(S):-findall([ID,AVG],quiz_avg(ID,AVG),LL),
            TRUEs= [[c1010, 78], [j0105, 87], [u5678, 91], [x4132, 69]],
            sort(LL,SLL),
            ((SLL=TRUEs,S is 10) ; (\+ SLL = TRUEs,S is 0)).

testq2easy(S):-
    (block_distance(c0,c0, 0),
    block_distance(c0,c1, 1), 
    block_distance(c0,c5, 1), 
    block_distance(c0,c7, 3), 
    block_distance(c5,c10,5), 
    block_distance(c10,c5,5),
    S is 5);
    (
        \+ (block_distance(c0,c0, 0),
            block_distance(c0,c1, 1), 
            block_distance(c0,c5, 1), 
            block_distance(c0,c7, 3), 
            block_distance(c5,c10,5), 
            block_distance(c10,c5,5) ),
        S is 0
    ).

testq2hard(S):-
    (block_distance(c2,c3,4),
    block_distance(c3,c2,4),
    block_distance(c5,c4,6),
    S is 5);
    (
        \+ (block_distance(c2,c3,4),
            block_distance(c3,c2,4),
            block_distance(c5,c4,6),
    S is 0 )
    ).

testq2all(S):-findall([CA,CB,Dist],block_distance(CA,CB,Dist),LL),
            TRUEs= [[c0,c0,0],[c0,c1,1],[c0,c10,6],[c0,c2,2],[c0,c3,6],[c0,c4,7],[c0,c5,1],[c0,c6,2],[c0,c7,3],[c0,c8,4],[c0,c9,5],[c1,c0,1],[c1,c1,0],[c1,c10,5],[c1,c2,1],[c1,c3,5],[c1,c4,6],[c1,c5,2],[c1,c6,1],[c1,c7,2],[c1,c8,3],[c1,c9,4],[c10,c0,6],[c10,c1,5],[c10,c10,0],[c10,c2,4],[c10,c3,2],[c10,c4,1],[c10,c5,5],[c10,c6,4],[c10,c7,3],[c10,c8,2],[c10,c9,1],[c2,c0,2],[c2,c1,1],[c2,c10,4],[c2,c2,0],[c2,c3,4],[c2,c4,5],[c2,c5,3],[c2,c6,2],[c2,c7,1],[c2,c8,2],[c2,c9,3],[c3,c0,6],[c3,c1,5],[c3,c10,2],[c3,c2,4],[c3,c3,0],[c3,c4,1],[c3,c5,5],[c3,c6,4],[c3,c7,3],[c3,c8,2],[c3,c9,1],[c4,c0,7],[c4,c1,6],[c4,c10,1],[c4,c2,5],[c4,c3,1],[c4,c4,0],[c4,c5,6],[c4,c6,5],[c4,c7,4],[c4,c8,3],[c4,c9,2],[c5,c0,1],[c5,c1,2],[c5,c10,5],[c5,c2,3],[c5,c3,5],[c5,c4,6],[c5,c5,0],[c5,c6,1],[c5,c7,2],[c5,c8,3],[c5,c9,4],[c6,c0,2],[c6,c1,1],[c6,c10,4],[c6,c2,2],[c6,c3,4],[c6,c4,5],[c6,c5,1],[c6,c6,0],[c6,c7,1],[c6,c8,2],[c6,c9,3],[c7,c0,3],[c7,c1,2],[c7,c10,3],[c7,c2,1],[c7,c3,3],[c7,c4,4],[c7,c5,2],[c7,c6,1],[c7,c7,0],[c7,c8,1],[c7,c9,2],[c8,c0,4],[c8,c1,3],[c8,c10,2],[c8,c2,2],[c8,c3,2],[c8,c4,3],[c8,c5,3],[c8,c6,2],[c8,c7,1],[c8,c8,0],[c8,c9,1],[c9,c0,5],[c9,c1,4],[c9,c10,1],[c9,c2,3],[c9,c3,1],[c9,c4,2],[c9,c5,4],[c9,c6,3],[c9,c7,2],[c9,c8,1],[c9,c9,0]],
            sort(LL,SLL),
            ((SLL=TRUEs,S is 10) ; (\+ SLL = TRUEs,S is 0)).

testq3all(S):-
    findall([P1,P2,P3,P4,P5,P6,Center],color_hexagram(P1,P2,P3,P4,P5,P6,Center),LL),
    TRUEs= [[blue,pink,blue,pink,blue,pink,red],[blue,pink,blue,pink,blue,pink,yellow],[blue,red,blue,red,blue,red,pink],[blue,red,blue,red,blue,red,yellow],[blue,yellow,blue,yellow,blue,yellow,pink],[blue,yellow,blue,yellow,blue,yellow,red],[pink,blue,pink,blue,pink,blue,red],[pink,blue,pink,blue,pink,blue,yellow],[pink,red,pink,red,pink,red,blue],[pink,red,pink,red,pink,red,yellow],[pink,yellow,pink,yellow,pink,yellow,blue],[pink,yellow,pink,yellow,pink,yellow,red],[red,blue,red,blue,red,blue,pink],[red,blue,red,blue,red,blue,yellow],[red,pink,red,pink,red,pink,blue],[red,pink,red,pink,red,pink,yellow],[red,yellow,red,yellow,red,yellow,blue],[red,yellow,red,yellow,red,yellow,pink],[yellow,blue,yellow,blue,yellow,blue,pink],[yellow,blue,yellow,blue,yellow,blue,red],[yellow,pink,yellow,pink,yellow,pink,blue],[yellow,pink,yellow,pink,yellow,pink,red],[yellow,red,yellow,red,yellow,red,blue],[yellow,red,yellow,red,yellow,red,pink]],
    sort(LL,SLL),
    ((SLL=TRUEs,S is 20) ; (\+ SLL = TRUEs,S is 0)).

testq4_0(S):-findall([In,Out],
                (Dom=[1,2,3,4],member(A,Dom),member(B,Dom),member(C,Dom),In=[A,B,C],remove_evens(In,Out)),
                LL),
            TRUEs= [[[1,1,1],[1,1,1]],[[1,1,2],[1,1]],[[1,1,3],[1,1,3]],[[1,1,4],[1,1]],[[1,2,1],[1,1]],[[1,2,2],[1]],[[1,2,3],[1,3]],[[1,2,4],[1]],[[1,3,1],[1,3,1]],[[1,3,2],[1,3]],[[1,3,3],[1,3,3]],[[1,3,4],[1,3]],[[1,4,1],[1,1]],[[1,4,2],[1]],[[1,4,3],[1,3]],[[1,4,4],[1]],[[2,1,1],[1,1]],[[2,1,2],[1]],[[2,1,3],[1,3]],[[2,1,4],[1]],[[2,2,1],[1]],[[2,2,2],[]],[[2,2,3],[3]],[[2,2,4],[]],[[2,3,1],[3,1]],[[2,3,2],[3]],[[2,3,3],[3,3]],[[2,3,4],[3]],[[2,4,1],[1]],[[2,4,2],[]],[[2,4,3],[3]],[[2,4,4],[]],[[3,1,1],[3,1,1]],[[3,1,2],[3,1]],[[3,1,3],[3,1,3]],[[3,1,4],[3,1]],[[3,2,1],[3,1]],[[3,2,2],[3]],[[3,2,3],[3,3]],[[3,2,4],[3]],[[3,3,1],[3,3,1]],[[3,3,2],[3,3]],[[3,3,3],[3,3,3]],[[3,3,4],[3,3]],[[3,4,1],[3,1]],[[3,4,2],[3]],[[3,4,3],[3,3]],[[3,4,4],[3]],[[4,1,1],[1,1]],[[4,1,2],[1]],[[4,1,3],[1,3]],[[4,1,4],[1]],[[4,2,1],[1]],[[4,2,2],[]],[[4,2,3],[3]],[[4,2,4],[]],[[4,3,1],[3,1]],[[4,3,2],[3]],[[4,3,3],[3,3]],[[4,3,4],[3]],[[4,4,1],[1]],[[4,4,2],[]],[[4,4,3],[3]],[[4,4,4],[]]],
            sort(LL,SLL),
            ((SLL=TRUEs,S is 10) ; (\+ SLL = TRUEs,S is 0)).

testq4_1(S):-findall([In,Out],
        (NDom=[0,1,2],member(L,NDom),member(M,NDom),member(N,NDom),
         CDom=[a,b],member(X,CDom),member(Y,CDom),member(Z,CDom),
         In=[L,X,M,Y,N,Z],dupNCharList(In,Out)),
            LL),
    TRUEs= [[[0,a,0,a,0,a],[]],[[0,a,0,a,0,b],[]],[[0,a,0,a,1,a],[a]],[[0,a,0,a,1,b],[b]],[[0,a,0,a,2,a],[a,a]],[[0,a,0,a,2,b],[b,b]],[[0,a,0,b,0,a],[]],[[0,a,0,b,0,b],[]],[[0,a,0,b,1,a],[a]],[[0,a,0,b,1,b],[b]],[[0,a,0,b,2,a],[a,a]],[[0,a,0,b,2,b],[b,b]],[[0,a,1,a,0,a],[a]],[[0,a,1,a,0,b],[a]],[[0,a,1,a,1,a],[a,a]],[[0,a,1,a,1,b],[a,b]],[[0,a,1,a,2,a],[a,a,a]],[[0,a,1,a,2,b],[a,b,b]],[[0,a,1,b,0,a],[b]],[[0,a,1,b,0,b],[b]],[[0,a,1,b,1,a],[b,a]],[[0,a,1,b,1,b],[b,b]],[[0,a,1,b,2,a],[b,a,a]],[[0,a,1,b,2,b],[b,b,b]],[[0,a,2,a,0,a],[a,a]],[[0,a,2,a,0,b],[a,a]],[[0,a,2,a,1,a],[a,a,a]],[[0,a,2,a,1,b],[a,a,b]],[[0,a,2,a,2,a],[a,a,a,a]],[[0,a,2,a,2,b],[a,a,b,b]],[[0,a,2,b,0,a],[b,b]],[[0,a,2,b,0,b],[b,b]],[[0,a,2,b,1,a],[b,b,a]],[[0,a,2,b,1,b],[b,b,b]],[[0,a,2,b,2,a],[b,b,a,a]],[[0,a,2,b,2,b],[b,b,b,b]],[[0,b,0,a,0,a],[]],[[0,b,0,a,0,b],[]],[[0,b,0,a,1,a],[a]],[[0,b,0,a,1,b],[b]],[[0,b,0,a,2,a],[a,a]],[[0,b,0,a,2,b],[b,b]],[[0,b,0,b,0,a],[]],[[0,b,0,b,0,b],[]],[[0,b,0,b,1,a],[a]],[[0,b,0,b,1,b],[b]],[[0,b,0,b,2,a],[a,a]],[[0,b,0,b,2,b],[b,b]],[[0,b,1,a,0,a],[a]],[[0,b,1,a,0,b],[a]],[[0,b,1,a,1,a],[a,a]],[[0,b,1,a,1,b],[a,b]],[[0,b,1,a,2,a],[a,a,a]],[[0,b,1,a,2,b],[a,b,b]],[[0,b,1,b,0,a],[b]],[[0,b,1,b,0,b],[b]],[[0,b,1,b,1,a],[b,a]],[[0,b,1,b,1,b],[b,b]],[[0,b,1,b,2,a],[b,a,a]],[[0,b,1,b,2,b],[b,b,b]],[[0,b,2,a,0,a],[a,a]],[[0,b,2,a,0,b],[a,a]],[[0,b,2,a,1,a],[a,a,a]],[[0,b,2,a,1,b],[a,a,b]],[[0,b,2,a,2,a],[a,a,a,a]],[[0,b,2,a,2,b],[a,a,b,b]],[[0,b,2,b,0,a],[b,b]],[[0,b,2,b,0,b],[b,b]],[[0,b,2,b,1,a],[b,b,a]],[[0,b,2,b,1,b],[b,b,b]],[[0,b,2,b,2,a],[b,b,a,a]],[[0,b,2,b,2,b],[b,b,b,b]],[[1,a,0,a,0,a],[a]],[[1,a,0,a,0,b],[a]],[[1,a,0,a,1,a],[a,a]],[[1,a,0,a,1,b],[a,b]],[[1,a,0,a,2,a],[a,a,a]],[[1,a,0,a,2,b],[a,b,b]],[[1,a,0,b,0,a],[a]],[[1,a,0,b,0,b],[a]],[[1,a,0,b,1,a],[a,a]],[[1,a,0,b,1,b],[a,b]],[[1,a,0,b,2,a],[a,a,a]],[[1,a,0,b,2,b],[a,b,b]],[[1,a,1,a,0,a],[a,a]],[[1,a,1,a,0,b],[a,a]],[[1,a,1,a,1,a],[a,a,a]],[[1,a,1,a,1,b],[a,a,b]],[[1,a,1,a,2,a],[a,a,a,a]],[[1,a,1,a,2,b],[a,a,b,b]],[[1,a,1,b,0,a],[a,b]],[[1,a,1,b,0,b],[a,b]],[[1,a,1,b,1,a],[a,b,a]],[[1,a,1,b,1,b],[a,b,b]],[[1,a,1,b,2,a],[a,b,a,a]],[[1,a,1,b,2,b],[a,b,b,b]],[[1,a,2,a,0,a],[a,a,a]],[[1,a,2,a,0,b],[a,a,a]],[[1,a,2,a,1,a],[a,a,a,a]],[[1,a,2,a,1,b],[a,a,a,b]],[[1,a,2,a,2,a],[a,a,a,a,a]],[[1,a,2,a,2,b],[a,a,a,b,b]],[[1,a,2,b,0,a],[a,b,b]],[[1,a,2,b,0,b],[a,b,b]],[[1,a,2,b,1,a],[a,b,b,a]],[[1,a,2,b,1,b],[a,b,b,b]],[[1,a,2,b,2,a],[a,b,b,a,a]],[[1,a,2,b,2,b],[a,b,b,b,b]],[[1,b,0,a,0,a],[b]],[[1,b,0,a,0,b],[b]],[[1,b,0,a,1,a],[b,a]],[[1,b,0,a,1,b],[b,b]],[[1,b,0,a,2,a],[b,a,a]],[[1,b,0,a,2,b],[b,b,b]],[[1,b,0,b,0,a],[b]],[[1,b,0,b,0,b],[b]],[[1,b,0,b,1,a],[b,a]],[[1,b,0,b,1,b],[b,b]],[[1,b,0,b,2,a],[b,a,a]],[[1,b,0,b,2,b],[b,b,b]],[[1,b,1,a,0,a],[b,a]],[[1,b,1,a,0,b],[b,a]],[[1,b,1,a,1,a],[b,a,a]],[[1,b,1,a,1,b],[b,a,b]],[[1,b,1,a,2,a],[b,a,a,a]],[[1,b,1,a,2,b],[b,a,b,b]],[[1,b,1,b,0,a],[b,b]],[[1,b,1,b,0,b],[b,b]],[[1,b,1,b,1,a],[b,b,a]],[[1,b,1,b,1,b],[b,b,b]],[[1,b,1,b,2,a],[b,b,a,a]],[[1,b,1,b,2,b],[b,b,b,b]],[[1,b,2,a,0,a],[b,a,a]],[[1,b,2,a,0,b],[b,a,a]],[[1,b,2,a,1,a],[b,a,a,a]],[[1,b,2,a,1,b],[b,a,a,b]],[[1,b,2,a,2,a],[b,a,a,a,a]],[[1,b,2,a,2,b],[b,a,a,b,b]],[[1,b,2,b,0,a],[b,b,b]],[[1,b,2,b,0,b],[b,b,b]],[[1,b,2,b,1,a],[b,b,b,a]],[[1,b,2,b,1,b],[b,b,b,b]],[[1,b,2,b,2,a],[b,b,b,a,a]],[[1,b,2,b,2,b],[b,b,b,b,b]],[[2,a,0,a,0,a],[a,a]],[[2,a,0,a,0,b],[a,a]],[[2,a,0,a,1,a],[a,a,a]],[[2,a,0,a,1,b],[a,a,b]],[[2,a,0,a,2,a],[a,a,a,a]],[[2,a,0,a,2,b],[a,a,b,b]],[[2,a,0,b,0,a],[a,a]],[[2,a,0,b,0,b],[a,a]],[[2,a,0,b,1,a],[a,a,a]],[[2,a,0,b,1,b],[a,a,b]],[[2,a,0,b,2,a],[a,a,a,a]],[[2,a,0,b,2,b],[a,a,b,b]],[[2,a,1,a,0,a],[a,a,a]],[[2,a,1,a,0,b],[a,a,a]],[[2,a,1,a,1,a],[a,a,a,a]],[[2,a,1,a,1,b],[a,a,a,b]],[[2,a,1,a,2,a],[a,a,a,a,a]],[[2,a,1,a,2,b],[a,a,a,b,b]],[[2,a,1,b,0,a],[a,a,b]],[[2,a,1,b,0,b],[a,a,b]],[[2,a,1,b,1,a],[a,a,b,a]],[[2,a,1,b,1,b],[a,a,b,b]],[[2,a,1,b,2,a],[a,a,b,a,a]],[[2,a,1,b,2,b],[a,a,b,b,b]],[[2,a,2,a,0,a],[a,a,a,a]],[[2,a,2,a,0,b],[a,a,a,a]],[[2,a,2,a,1,a],[a,a,a,a,a]],[[2,a,2,a,1,b],[a,a,a,a,b]],[[2,a,2,a,2,a],[a,a,a,a,a,a]],[[2,a,2,a,2,b],[a,a,a,a,b,b]],[[2,a,2,b,0,a],[a,a,b,b]],[[2,a,2,b,0,b],[a,a,b,b]],[[2,a,2,b,1,a],[a,a,b,b,a]],[[2,a,2,b,1,b],[a,a,b,b,b]],[[2,a,2,b,2,a],[a,a,b,b,a,a]],[[2,a,2,b,2,b],[a,a,b,b,b,b]],[[2,b,0,a,0,a],[b,b]],[[2,b,0,a,0,b],[b,b]],[[2,b,0,a,1,a],[b,b,a]],[[2,b,0,a,1,b],[b,b,b]],[[2,b,0,a,2,a],[b,b,a,a]],[[2,b,0,a,2,b],[b,b,b,b]],[[2,b,0,b,0,a],[b,b]],[[2,b,0,b,0,b],[b,b]],[[2,b,0,b,1,a],[b,b,a]],[[2,b,0,b,1,b],[b,b,b]],[[2,b,0,b,2,a],[b,b,a,a]],[[2,b,0,b,2,b],[b,b,b,b]],[[2,b,1,a,0,a],[b,b,a]],[[2,b,1,a,0,b],[b,b,a]],[[2,b,1,a,1,a],[b,b,a,a]],[[2,b,1,a,1,b],[b,b,a,b]],[[2,b,1,a,2,a],[b,b,a,a,a]],[[2,b,1,a,2,b],[b,b,a,b,b]],[[2,b,1,b,0,a],[b,b,b]],[[2,b,1,b,0,b],[b,b,b]],[[2,b,1,b,1,a],[b,b,b,a]],[[2,b,1,b,1,b],[b,b,b,b]],[[2,b,1,b,2,a],[b,b,b,a,a]],[[2,b,1,b,2,b],[b,b,b,b,b]],[[2,b,2,a,0,a],[b,b,a,a]],[[2,b,2,a,0,b],[b,b,a,a]],[[2,b,2,a,1,a],[b,b,a,a,a]],[[2,b,2,a,1,b],[b,b,a,a,b]],[[2,b,2,a,2,a],[b,b,a,a,a,a]],[[2,b,2,a,2,b],[b,b,a,a,b,b]],[[2,b,2,b,0,a],[b,b,b,b]],[[2,b,2,b,0,b],[b,b,b,b]],[[2,b,2,b,1,a],[b,b,b,b,a]],[[2,b,2,b,1,b],[b,b,b,b,b]],[[2,b,2,b,2,a],[b,b,b,b,a,a]],[[2,b,2,b,2,b],[b,b,b,b,b,b]]],  sort(LL,SLL),
    ((SLL=TRUEs,S is 10) ; (\+ SLL = TRUEs,S is 0)).



score(S):-
    write('Section 0:'),nl,
    testq0_0(S0_0),write('Score Q0.0 is: '),write(S0_0),nl,
    testq0_0(S0_1),write('Score Q0.1 is: '),write(S0_1),nl,
    testq0_0(S0_2),write('Score Q0.2 is: '),write(S0_2),nl,
    testq0_0(S0_3),write('Score Q0.3 is: '),write(S0_3),nl,
    testq0_0(S0_4),write('Score Q0.4 is: '),write(S0_4),nl,
    write('Section 1:'),nl,
    testq1_0(S1_0),write('Score Q1.0 is: '),write(S1_0),nl,
    testq1_1(S1_1),write('Score Q1.1 is: '),write(S1_1),nl,
    write('Section 2:'), nl,
    testq2easy(S2easy),write('Score Q2 Easy is: '),write(S2easy),nl,
    testq2easy(S2hard),write('Score Q2 Hard is: '),write(S2hard),nl,
    testq2all(S2all),write('Score Q2 All is: '),write(S2all),nl,
    write('Section 3:'), nl,
    testq3all(S3),write('Score Q3 All is: '),write(S3),nl,
    write('Section 4:'), nl,
    testq4_0(S4_0),write('Score Q4.0 is: '),write(S4_0),nl,
    testq4_1(S4_1),write('Score Q4.1 is: '),write(S4_1),nl,
    S0 is S0_0+S0_1+S0_2+S0_3+S0_4,
    S1 is S1_0+S1_1,
    S2 is S2easy+S2hard+S2all, 
    %S3 above
    S4 is S4_0+S4_1,
    S is S0+S1+S2+S3+S4,
    write('Total Score = '), write(S),nl,
    write(S).

:-score(S),nl,write('Score = '),write(S).