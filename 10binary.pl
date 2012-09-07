main(A, B, Result) :- binMult(A, B, Result).

binMult(A, B, Result) :-
	binMultAccumulate(A, B, [], R1),
	binAddAll(R1, Result).

binAddAll([R1|R], R1) :-
	R = [].
binAddAll([R1|R], Result) :-
	R \= [],
	binAddAll(R, SemiResult),
	binAdd(R1, SemiResult, Result).

binMultAccumulate([], _, R, R).
binMultAccumulate([0|Rest], B, Acc, Result) :-
	binMultAccumulate( Rest, B, Acc, Result).

binMultAccumulate([1|Rest], B, Acc, Result) :-
	length(Rest, L),
	shift(B, L, B1), !,
	binMultAccumulate(Rest, B, [B1|Acc], Result).

shift(R, 0, R).
shift(A, Num, Result) :-
	Num > 0,
	Num1 is Num - 1,
	append(Result1, [0], Result),
	shift(A, Num1, Result1).

binAdd(A1, A2, Result) :-
	reverse(A1, B1),
	reverse(A2, B2),
	binAdd(B1, B2, R1, 0),
	reverse(R1, Result).

binAdd([], [X|R], [X|R], 0).
binAdd([], [X|R], Result, 1) :-
	binAdd([1], [X|R], Result, 0).

binAdd([X|R], [], Result, S) :-
	binAdd([], [X|R], Result, S).

binAdd([], [], [P], P).

binAdd([0|Rest1], [0|Rest2], [X|Rest], S) :- 
	((S == 0, X is 0); (S == 1, X is 1 )), 
	binAdd(Rest1, Rest2, Rest, 0).

binAdd([0|Rest1], [1|Rest2], [X|Rest], S) :-
	((S == 0, X is 1); (S == 1, X is 0)),
	binAdd(Rest1, Rest2, Rest, S).

binAdd([1|Rest1], [0|Rest2], [X|Rest], S) :-
	binAdd([0|Rest1], [1|Rest2], [X|Rest], S).

binAdd([1|Rest1], [1|Rest2], [S|Rest], S) :-
	binAdd(Rest1, Rest2, Rest, 1).
