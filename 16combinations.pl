/*
vygenerovať K prvkové kombinácie zo zoznamu N čísel
*/

combination(_, 0, []).
combination(L, N, [R1|R]) :-
	select(R1, L, L1),
	N1 is N - 1,
	combination(L1, N1, R).

/*
vygenerovať K prvkové kombinácie *RÔZNYCH* čísel zo zoznamu N čísel
*/

combination_distinct(List, Number, Result) :-
	combination_distinct(List, Number, [], Result).
combination_distinct(_, 0, R, R) :- !.
combination_distinct(L, N, AccC, C) :-
	select(R1, L, L1),
	N1 is N - 1,
	\+member(R1, AccC),
	combination_distinct(L1, N1, [R1|AccC], C).

/*
rozdil append
*/

myappend(A-B, B-C, A-C).
