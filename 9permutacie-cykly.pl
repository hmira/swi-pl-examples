/*
prevod permutacie na cykly
zo zapisu kde prvok na i-tej pozicii
sa zobrazi na jeho hodnutu
*/

main(Permutation, Cycles) :-
	tag(Permutation, TaggedList),
	createCycles(TaggedList, Cycles).

tag(List, Result) :-
	reverse(List, RL),
	tagList(RL, R, _),
	reverse(R, Result).

tagList([], [], 0).
tagList([P1|P], [C-P1|M], C) :-
	tagList(P, M, C1),
	C is C1 + 1.

createCycles([], []).
createCycles([M-A|Perm], [R|Res]) :-
	createCycle( M-A, [M-A|Perm], [], R, NewPerm),
	createCycles( NewPerm, Res ).

createCycle(_-M, Perm, Acc, Result, ResPerm) :-
	select(M-A, Perm, NewPerm),
	createCycle(M-A, NewPerm, [M|Acc], Result, ResPerm), !.
createCycle(_, Perm, R, R, Perm).
