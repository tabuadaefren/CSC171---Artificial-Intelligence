hoofer(efren).
hoofer(evee).
hoofer(earl).

hoofer(X) :- skier(X); mountainclimber(X); skier(X), mountainclimber(X).

likes(efren, snow).
likes(efren, rain).

likes(efren, _) :- dislikes(earl, _).
dislikes(earl, _) :- likes(efren, _).

skier(X) :- likes(X, snow).
mountainclimber(X) :- dislikes(X, rain).

start() :-
	write("Is there a member of the Hoofers Club who is a mountain climber but not a skier?"), nl,
	nl, write("The member of the Hoofers Club who is a mountain climber but not a skier is "),
	query_climber([evee, efren, earl]).

query_climber([A|B]):- (mountainclimber(A) -> query_skier([A|B]), nl; query_climber(B) ).

query_skier([A|B]):- (skier(A) -> query_climber(B); write(A), nl ).
