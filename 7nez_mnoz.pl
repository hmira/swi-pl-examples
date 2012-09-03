main(Graph, MaxSet) :-
	createlist(Graph,  Result),
	pickmax(Result, [], MaxSet).

pickmax([], L, L).
pickmax([L1|Rest], L, Result) :-
	sizeoflist(L1, Count1),
	sizeoflist(L, Count),
	Count1 > Count,
	pickmax( Rest, L1, Result), !.

pickmax([_|Rest], L, Result) :-
	pickmax( Rest, L, Result).
	

sizeoflist([], 0).
sizeoflist([_|R], Count) :-
	sizeoflist(R, Count1),
	Count is Count1 + 1.

createlist(Graph, Result) :-
	createlist(Graph, [], Result, Graph).

createlist([], R, R, _).
createlist([G->Edges|RestGraph], Acc, Result, Graph) :-
	select(A, Acc, Acc2),
	member(A1, A),
	dosazitelny(A1, G, Graph, []),
	createlist(RestGraph, [[G|A]| Acc2], Result, Graph), !.

createlist([G->Edges|RestGraph], Acc, Result, Graph) :-
	createlist(RestGraph, [[G]|Acc], Result, Graph).
	

dosazitelny(A, A, _, _) :- !, fail.
dosazitelny(A, B, Graph, _) :- 
	member(A->Edges1, Graph),
	member(B, Edges1).
	
dosazitelny(A, B, Graph, _) :- 
	member(B->Edges2, Graph),
	member(A, Edges2).

dosazitelny(A, B, Graph, Stack) :-
	\+member(A, Stack),
	\+member(B, Stack),
	member(A->Edges, Graph),
	member(C, Edges),
	dosazitelny(C, B, Graph, [C|Stack]).

dosazitelny(A, B, Graph, Stack) :-
	\+member(A, Stack),
	\+member(B, Stack),
	member(B->Edges, Graph),
	member(C, Edges),
	dosazitelny(C, A, Graph, [C|Stack]).
