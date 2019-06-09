dwarf(doc).
dwarf(dopey).
dwarf(droopy).
dwarf(smelly).
dwarf(stumpy).
dwarf(sleepy).
dwarf(happy).
dwarf(bashful).
dwarf(sneezy).
dwarf(grumpy).


inFrontOf(Y, X) :- behind(X, Y).

inFrontOf(happy, smelly).
inFrontOf(happy, sleepy).
inFrontOf(happy, bashful).
inFrontOf(sneezy, dopey).
inFrontOf(smelly, grumpy).
inFrontOf(smelly, stumpy).
inFrontOf(smelly, sneezy).
inFrontOf(dopey, droopy).
inFrontOf(sleepy, grumpy).
inFrontOf(sleepy, bashful).
inFrontOf(stumpy, dopey).
inFrontOf(grumpy, dopey).
inFrontOf(doc, droopy).
inFrontOf(doc, happy).

behind(sleepy, stumpy).
behind(sleepy, smelly).
behind(sleepy, happy).
behind(bashful, smelly).
behind(bashful, droopy).
behind(bashful, sleepy).
behind(dopey, sneezy).
behind(dopey, doc).
behind(dopey, sleepy).
behind(smelly, doc).
behind(stumpy,sneezy).
behind(stumpy,doc).




start(_) :- 
	order([happy, sneezy, smelly, sleepy, bashful, droopy, dopey, doc, stumpy], [grumpy]).

order([d|[]], O) :- write("order is: "), write(O), nl.

order([d|OT], [F|[]]) :- 
	(front(d, F) -> order(OT, [d, F]) ; order([OT], [F, d])).

order([d|OT], [F|R]) :-
	(front(d, F) -> order(OT, [d, F|R]) ; order([d|OT], [F, R])).
