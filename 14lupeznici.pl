/*
1)

Problém dvou loupežníků. Úkolem je rozdělit 
seznam na 2 seznamy se stejným součtem - 
pokud to nejde, pak vrátit false. 

*/

sum(0,[]).
sum(N,[A1|A]) :-
	sum(N1, A),
	N is N1 + A1.

lupez(A, B, A, B) :-
	sum(Na, A),
	sum(Nb, B),
	Na == Nb, !.

lupez(A, B, R1, R2) :-
	sum(Na, A),
	sum(Nb, B),
	Na \== Nb,
	select(A1, A, NewA),
	lupez(NewA, [A1| B], R1, R2).

lup(A, [R1,R2]) :-
	lupez(A, [], R1, R2).
