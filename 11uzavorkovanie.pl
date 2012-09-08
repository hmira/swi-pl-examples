uzavorkovanie(1, ['(', ')']). 
uzavorkovanie(N, ['(', ')'| Rest]):-
	N > 1,
	N1 is N - 1,
	uzavorkovanie( N1, Rest).

uzavorkovanie(N, ['('| R]) :-
	N > 1,
	N1 is N - 1,
	uzavorkovanie( N1, Rest),
	append(Rest, [')'], R).

uzavorkovanie(N, R) :-
	N > 1,
	N1 is N - 1,
	uzavorkovanie( N1, Rest),
	append(Rest, ['(', ')'], R).
