:- use_module(library(http/http_open)).
:- use_module(library(http/json)).


deck :- http_open('http://localhost:3000/deck', In, []),
            json_read(In, Deck).


new_game :- http_open('http://localhost:3000/newgame', In, []),
            json_read(In, Game), write(Game).


pick_card :- http_open('http://localhost:3000/pick', In, []),
             json_read(In, Card).      