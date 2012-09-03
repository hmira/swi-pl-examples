ekviv([],[]).
ekviv([A1|List1], [A1|List2]) :-
	integer(A1),
	ekviv(List1, List2).

ekviv([*|List1], [A|List2]) :-
	integer(A),
	ekviv(List1, List2).

ekviv([*|List1], [A|List2]) :-
	integer(A),
	ekviv([*|List1], List2).

ekviv([A|List1], [*|List2]) :-
	integer(A),
	ekviv(List1, List2).

ekviv([A|List1], [*|List2]) :-
	integer(A),
	ekviv(List1, [*|List2]).

ekviv([*|List1], [*|List2]) :-
	ekviv([*|List1], List2).

ekviv([*|List1], [*|List2]) :-
	ekviv(List1, [*|List2]).
