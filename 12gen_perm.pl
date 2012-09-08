/*
1) generování n-té permutace v lexikografickém pořadí
Vstupem byla čísla N a K a výstupem měla být K-tá permutace N čísel v lexikografickém pořadí. Př:

perm(4,3,P).
P = [1,3,4,2]

Plný počet bodů byl jen za řešení které postupně negeneruje všechny permutace (za to byly maximálně 4 body, ale když jste měli to řešení, co chtěli, tak to podle mě docela ocenili u ústní - alespoň u mě)
*/

perm(N, K, Result):-
	perm(N, K, [], R),
	inc(R,R1),
	reverse(R1, Result).


inc([],[]) :- !.
inc([L|L1], [R|R1]) :-
	R is L + 1,
	inc(L1, R1).

perm(N, K, R, R) :- length(R, N).
perm(N, K, Acc, Result) :-
	length(Acc, Len),
	N1 is ((N-1)-Len),
	fact(N1, FN),
	Coeff is (K div FN),
	Rest is K mod FN,
	takeNth(Coeff, Acc, Rs),
	perm(N, Rest, [Rs|Acc], Result).


takeNth(I, List, Result) :-
	select(Ii, List, NewList),
	Ii =< I,
	Ir is I + 1,
	takeNth(Ir, NewList, Result), !.
takeNth(I, _, I).

fact(0,1).
fact(N,R) :-
	N > 0,
	N1 is N - 1,
	fact(N1, R1),
	R is N * R1.
