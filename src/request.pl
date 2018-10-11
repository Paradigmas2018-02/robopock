:- use_module(library(http/http_open)).
:- use_module(library(http/http_client)).
:- use_module(library(http/http_json)).
:- use_module(library(http/json_convert)).
:- use_module(library(http/json)).

:- consult(human).


deck :- http_open('http://localhost:3000/deck', In, []),
            json_read(In, Deck).


winner(NewGame) :- 
    http_open('http://localhost:3000/winner', In, []),
    json_read_dict(In, Winner),
    nl, write("Winner: "), write(Winner.get(name)), nl,
    new_turn(NewGame).


game(CurGame) :- http_open('http://localhost:3000/game', In, []),
                    json_read_dict(In, CurGame).


new_game(NewGame) :- 
    http_open('http://localhost:3000/newgame', In, []),
    json_read_dict(In, NewGame), nl, nl, write("Game Started! "),
    human_cards(NewGame).


new_turn(NewGame) :-
    http_open('http://localhost:3000/newturn', In, []),
    json_read_dict(In, NewGame), nl, nl, write("New Round Started"), nl.


pick_card(NewGame) :- 
    http_open('http://localhost:3000/pick', In, []),
    json_read_dict(In, NewGame).


bet(Player, Value, NewGame) :- 
    Data = json([player=Player, value=Value]),
    http_open('http://localhost:3000/bet', In, [post(json(Data))]),
    json_read_dict(In, NewGame).
