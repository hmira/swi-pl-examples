dveBarvy(Hrany,Vrcholy1,Vrcholy2):-
	obarvi(Hrany,[],[],Vrcholy1,Vrcholy2).
obarvi([],A1,A2,A1,A2).
obarvi([(H1,H2)|T],B1,B2,VB1,VB2):-
	member(H1,B1),!,
	(
		member(H2,B1),!,fail;
	
		member(H2,B2),
		obarvi(T,B1,B2,VB1,VB2);

		obarvi(T,B1,[H2|B2],VB1,VB2)
	);

	member(H2,B1),!,
	(
		member(H1,B2),
		obarvi(T,B1,B2,VB1,VB2);
		obarvi(T,B1,[H1|B2],VB1,VB2)
	);

	member(H1,B2),!,
	(
		member(H2,B2),!,
		fail;
	
		obarvi(T,[H2|B1],B2,VB1,VB2)
	);
	
	member(H2,B2),!,
	obarvi(T,[H1|B1],B2,VB1,VB2);

	obarvi(T,[H1|B1],[H2|B2],VB1,VB2);

	obarvi(T,[H2|B1],[H1|B2],VB1,VB2).
