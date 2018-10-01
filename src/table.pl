
table_cards(Game, TableCards) :- Table = Game.get(table), TableCards = [Table.get(tcards)].

table_cards2(Game) :- table_cards(Game, TableCards), write(TableCards). 
