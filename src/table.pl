:- consult(utils).

show_table(Game) :- nl, nl, write("Cards on Table:"), nl , pretty_table(Game), nl.
pretty_table(Game) :- table_cards(Game), nl, write("Table Pot:"), pot(Game, Pot), write(Pot), !.


table_cards(Game) :- Table = Game.get(table), pretty_cards(Table.get(tcards)).
pot(Game, Pot) :- Table = Game.get(table), Pot = Table.get(pot).

% Recursive call to prettify all table cards, param is a list of cards.
pretty_cards([Head|Tail]) :- pretty_card(Head, PCard), write(PCard), pretty_cards(Tail).
pretty_cards([_|_]):- true.



show_table_cards(Game) :- table_cards(Game).


