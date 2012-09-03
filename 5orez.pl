orez(t(Lavy, Value, Pravy), From, To, t(RLavy, Value, Pravy)) :-
	Value > From,
	orez(Lavy, From, To, RLavy).

orez(t(Lavy, Value, Pravy), From, To, t(Lavy, Value, RPravy)) :-
	Value < To,
	orez(Pravy, From, To, RPravy).

orez(t(_, Value, _), From, To, null) :-
	From < Value, 
	Value < To.
