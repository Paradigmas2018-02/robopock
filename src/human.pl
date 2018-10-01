:- consult(player).

human(Game, Human) :- Human = Game.get(player2).

human_cards(Game) :- human(Game, Human), player_cards(Human, Card1, Card2), nl, nl,
                     write("Your cards are: "), nl, write(Card1), write(Card2), nl, nl.