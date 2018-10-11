:- use_module(library(http/http_open)).
:- use_module(library(http/http_client)).
:- use_module(library(http/http_json)).
:- use_module(library(http/json_convert)).
:- use_module(library(http/json)).
:- consult(human).


deck :- http_open('http://localhost:3000/deck', In, []),
            json_read(In, Deck).


winner(Winner) :- http_open('http://localhost:3000/winner', In, []),
                json_read_dict(In, Winner), write("Winner: "), write(Winner.get(name)).


game(CurGame) :- http_open('http://localhost:3000/game', In, []),
                    json_read_dict(In, CurGame).


new_game(NewGame) :- 
    http_open('http://localhost:3000/newgame', In, []),
    json_read_dict(In, NewGame), nl, nl, write("Game Started! "),
    human_cards(NewGame).


new_turn(NewGame) :-
    http_open('http://localhost:3000/newturn', In, []),
    json_read_dict(In, NewGame).


pick_card(NewGame) :- http_open('http://localhost:3000/pick', In, []),
                        json_read_dict(In, NewGame).


bet(Player, Value, NewGame) :- 
    Data = json([player=Player, value=Value]),
    http_open('http://localhost:3000/bet', In, [post(json(Data))]),
    json_read_dict(In, NewGame).


% human_bet_request(CurGame, Value) :- 
%         atom_concat('', Value, StringValue),
%         http_open([host('localhost'),
%             path('/human/bet'),
%             port(3000),
%             search([value=StringValue])], In, []),
%         json_read_dict(In, CurGame).


% bot_bet_request(CurGame, Value) :- 
%         atom_concat('', Value, StringValue),
%         http_open([host('localhost'),
%             path('/bot/bet'),
%             port(3000),
%             search([value=StringValue])], In, []),
%         json_read_dict(In, CurGame).