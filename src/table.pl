:- consult(utils).
:- consult(request).

show_table(Game) :- nl, nl, write("Cards on Table: "), pretty_table(Game), nl.
pretty_table(Game) :- table_cards(Game), nl, write("Table Pot: "), pot(Game, Pot), write(Pot), !.


table_cards(Game) :- Table = Game.get(table), pretty_cards(Table.get(tcards)).
pot(Game, Pot) :- Table = Game.get(table), Pot = Table.get(pot).

show_table_cards(Game) :- table_cards(Game).

bet_value(Game, Player, BetValue) :- pot(Game, Pot), BetValue = Pot - Player.get(payment).

check_then(Cond, Pick, _) :- Cond, !, Pick. 
check_then(_, _, Win) :- Win. 

check(Game, NewGame) :- 
    length(Game.get(table).get(tcards), Len),
    check_then(Len < 5, pick_card(NewGame), winner(Game, NewGame)),
    show_table(NewGame).

