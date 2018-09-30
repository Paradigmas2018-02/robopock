:- use_module(library(http/http_open)).
:- use_module(library(http/json_convert)).
:- use_module(library(http/json)).

%% AUXILIAR %%

human(Game, Human) :- Human = Game.get(player2).

bot(Game, Bot) :- Bot = Game.get(player1).

pretty_card(Card, PCard) :- CardRank =
                                Card.get(rank),
                                CardSuit = Card.get(suit),
                                PCard = {CardRank.get(rname), CardSuit.get(sname)}.

cards(Player, Card1, Card2) :- CardList = 
                                Player.get(cards),
                                nth0(0, CardList, RCard1),
                                nth0(1, CardList, RCard2),
                                pretty_card(RCard1, Card1),
                                pretty_card(RCard2, Card2).

table_cards(Game, TableCards) :- Table = Game.get(table), TableCards = [Table.get(tcards)].

deck :- http_open('http://localhost:3000/deck', In, []),
            json_read(In, Deck).


%% MENU FUNCTIONS %%

new_game(NewGame) :- 
            http_open('http://localhost:3000/newgame', In, []),
            json_read_dict(In, NewGame), nl, nl, write("Game Started! "),
            human_cards(NewGame).


human_cards(Game) :- human(Game, Human), cards(Human, Card1, Card2), nl, nl,
                     write("Your cards are: "), nl, write(Card1), write(Card2), nl, nl.


table_cards2(Game) :- table_cards(Game, TableCards), write(TableCards). 



pick_card :- http_open('http://localhost:3000/pick', In, []),
             json_read(In, Card).
