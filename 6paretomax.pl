paretoMax(Vectors, Result) :-
	paretoMax( Vectors, Vectors, [], Result).

paretoMax([], _, R, R).
paretoMax([Vector1|Rest], All, Acc, Result) :-
	niktoMiNedominuje(Vector1, All),
	paretoMax(Rest, All, [Vector1|Acc], Result).

paretoMax([Vector1|Rest], All, Acc, Result) :-
	\+niktoMiNedominuje(Vector1, All),
	paretoMax(Rest, All, Acc, Result).

niktoMiNedominuje(_, []).
niktoMiNedominuje(Vector, [Vector|Vectors]) :-
	niktoMiNedominuje(Vector, Vectors).
niktoMiNedominuje(Vector, [V1|Vectors]) :-
	\+dominuje(V1, Vector),
	niktoMiNedominuje(Vector, Vectors).

dominuje([], []).
dominuje([K1|Kto], [H1|Koho]) :-
	K1 >= H1,
	dominuje(Kto, Koho).
