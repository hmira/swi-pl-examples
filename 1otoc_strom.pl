%otoci strom tak aby prvok A bol navrchu
%otoc(+Strom, +A, -Strom)
otoc( t(P1, A, P2), A, t(P1, A, P2)).
otoc( t( t(PA2, Ax, PA3), A1, PA4), A, t(RA2, A, t(RA3, A1, PA4)) ) :-
	A < A1,
	otoc( t(PA2, Ax, PA3), A, t(RA2, A, RA3) ).

otoc( t( PA4, A1, t(PA2, Ax, PA3)), A, t( t(PA4, A1, RA2), A, RA3) ) :-
	A > A1,
	otoc( t(PA2, Ax, PA3), A, t(RA2, A, RA3) ).

permutace([],[]). 
permutace(Xs,[X|Zs]):- select(X,Xs,Ys), 
                      permutace(Ys,Zs).

allperms(In, Acc, Result) :-
	permutace(In, Perm),
	\+member(Perm, Acc),
	allperms(In, [Perm| Acc], Result), !.
allperms(_, Acc, Acc).
