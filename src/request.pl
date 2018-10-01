:- use_module(library(http/http_open)).
:- use_module(library(http/json_convert)).
:- use_module(library(http/json)).

:- consult(human).


deck :- http_open('http://localhost:3000/deck', In, []),
            json_read(In, Deck).


new_game(NewGame) :- 
            http_open('http://localhost:3000/newgame', In, []),
            json_read_dict(In, NewGame), nl, nl, write("Game Started! "),
            human_cards(NewGame).


pick_card :- http_open('http://localhost:3000/pick', In, []),
             json_read(In, Card).
