 generate(Graph, Result) :-
	createCharList(Graph, [], R1),
	gxg(R1, R1, List),
	filterComparable(List, Graph, [], Result).

 filterComparable([], _, R, R).
 filterComparable([L1-L2|List], Graph, Acc, Result) :-
	\+isComparable(L1, L2, Graph),
	\+isComparable(L2, L1, Graph),
	\+member(L1-L2, Acc),
	\+member(L2-L1, Acc),
	L1 \= L2,
	filterComparable(List, Graph, [L1-L2|Acc], Result),!.
 filterComparable([_|List], Graph, Acc, Result) :-
	filterComparable(List, Graph, Acc, Result).
 

 gxg([], _, _).
 gxg([L1|List1], List2, Result) :- 
	g1xg(L1, List2, R1),
	gxg(List1, List2, R2),
	append(R1, R2, Result).

 g1xg(_, [], []).
 g1xg(L1, [L|List], [L1-L|Result]) :- g1xg(L1, List, Result).

 createCharList([], R, R).
 createCharList([A1->B1|Rest], Acc, Result) :-
	\+member(A1, Acc),
	\+member(B1, Acc),
	createCharList(Rest, [A1, B1| Acc], Result).
 createCharList([A1->B1|Rest], Acc, Result) :-
	member(A1, Acc),
	\+member(B1, Acc),
	createCharList(Rest, [B1| Acc], Result).
 createCharList([A1->B1|Rest], Acc, Result) :-
	\+member(A1, Acc),
	member(B1, Acc),
	createCharList(Rest, [A1| Acc], Result).
 createCharList([A1->B1|Rest], Acc, Result) :-
	member(A1, Acc),
	member(B1, Acc),
	createCharList(Rest, Acc, Result).

 isComparable(A, B, Graf) :- member(A->B, Graf).
 isComparable(A, B, Graf) :- member(A->C, Graf), isComparable(C, B, Graf).
