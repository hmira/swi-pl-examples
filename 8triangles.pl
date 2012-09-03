trojuholniky([], Result, Result).
trojuholniky([V-E|G], Acc, Result) :-
	member(A, E),
	member(B, E),
	A \= B,
	member(A-Edges, G),
	member(B, Edges),
	\+vice_member([V, A, B], Acc),
	trojuholniky([V-E|G], [[V,A,B]|Acc], Result),!.

trojuholniky([_|G], Acc, Result) :-
	trojuholniky(G, Acc, Result).

vice_member([A, B, C], List) :-
	member(L,List),
	member(A,L),
	member(B,L),
	member(C,L).
