/*
na brehu rieky je M misionarov a K kanibalov
treba vsetkych prepravit na druhy breh
na lodke, ktora preveze naraz 2 osoby
na ani jednom z brehov nesmie byt naraz viac kanibalov
ako misionarov
*/

brehy((M1, K1), (M2, K2)) :-
	(
		(K1 > M1, M1 \==0);
		(K2 > M2, M2 \==0);
		M1 < 0;
		M2 < 0;
		K1 < 0;
		K2 < 0
	),!,fail.

brehy((0,0),_):- !.

brehy((M1, K1), (M2, K2)) :-
	(
		(M1x is M1-1, K1x is K1-1, M2x is M2+1, K2x is K2+1);
		(M1x is M1-1, M2x is M2+1, K1x = K1, K2x = K2);
		(K1x is K1-1, K2x is K2+1, M1x = M1, M2x = M2)
	),
	brehy((M1x, K1x), (M2x, K2x)).
