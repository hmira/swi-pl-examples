/*
sort listu listov podľa
dĺžky podlistov
*/

sort_lists(Lists, Result) :-
	convert(Lists, TaggedLists),
	quicksort(TaggedLists, Result).

convert([], []).
convert([L|List], [M-L|Marked]) :-
	length(L, M),
	convert(List, Marked).

quicksort([], []).
quicksort([A-B|Rest], Result) :-
	divide(Rest, A, L1, L2),
	quicksort(L1, R1),
	quicksort(L2, R2),
	append(R1, [B|R2], Result).

divide([], _, [], []).
divide([L1-A|List], N, [L1-A|R1], R2) :-
	N > L1,
	divide(List, N, R1, R2).
divide([L1-A|List], N, R1, [L1-A|R2]) :-
	N =< L1,
	divide(List, N, R1, R2).
