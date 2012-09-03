%komponenty(+Graph, -Graph)

komponenty([], []).

komponenty([V-E|Graph], [RList|Result]) :-
	bfskomp([V-E|Graph], [V], [], RGraph, RList),
	komponenty(RGraph, Result).

bfskomp( Graph, [], Result, Graph, Result).
bfskomp( Graph, [F|Fronta], Visited, RGraph, Result ) :-
	member(F, Visited),
	bfskomp( Graph, Fronta, Visited, RGraph, Result).
bfskomp( Graph, [F|Fronta], Visited, RGraph, Result ) :-
	\+member(F, Visited),
	delete(Graph, F-Edges, NewGraph),
	append(Fronta, Edges, NewFronta1),
	memberofmember(Vx-Ex, Graph, F),
	append(NewFronta1, [Vx], NewFronta),
	append(Visited, [F], NewVisited),
	bfskomp(NewGraph, NewFronta, NewVisited, RGraph, Result), !.
bfskomp( Graph, [F|Fronta], Visited, RGraph, Result ) :-
	\+member(F, Visited),
	delete(Graph, F-Edges, NewGraph),
	append(Fronta, Edges, NewFronta),
	\+memberofmember(Vx-Ex, Graph, F),
	append(Visited, [F], NewVisited),
	bfskomp(NewGraph, NewFronta, NewVisited, RGraph, Result).

memberofmember(Vx-Ex, Graph, F) :-
	member(Vx-Ex, Graph),
	member(F, Ex).
