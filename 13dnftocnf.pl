/*
prevod z DNF na CNF

convert([[a, and, b], or, [c, and, d], or,[e, and, f]], R).

R = 
[

[a, or, c, or, e], and, 
[a, or, c, or, f], and, 
[a, or, d, or, e], and, 
[a, or, d, or, f], and, 
[b, or, c, or, e], and, 
[b, or, c, or, f], and, 
[b, or, d, or, e], and, 
[b, or, d, or, f]

] 

*/

convert([F1, or, F2], Result) :-
	distribute(F1, F2, Result).

convert([F1, or, F2, or|F], Result) :-
	distribute(F1, F2, FR),
	convert([FR, or|F], Result).


distribute([A], Blist, Result):-
	distributeOne(A, Blist, Result).
distribute([A1, and, A2|A], Blist, Result) :-
	distributeOne(A1, Blist, R1),
	distribute([A2|A], Blist, Res),
	append(R1, [and|Res], Result).


distributeOne(A1, [B1, and, B2|Blist], [[A1, and, B1], or|Result]) :-
	atom(A1),
	distributeOne(A1, [B2|Blist], Result).

distributeOne(A1, [B1, and, B2|Blist], [R1, or|Result]) :-
	\+atom(A1),
	distributeOne(A1, [B2|Blist], Result),
	append(A1, [and, B1], R1).

distributeOne(A1, [B1, and, B2], [[A1, or, B1], and, [A1, or, B2]]) :-
	atom(A1).

distributeOne(A1, [B1, and, B2], [R1, and, R2]) :-
	\+atom(A1),
	append(A1, [or, B1], R1),
	append(A1, [or, B2], R2).


