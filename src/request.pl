:- use_module(library(http/http_open)).
:- use_module(library(http/json)).
:- pack_install(djson).
:- use_module(library(djson)).
:- multifile djson:json//1.


djson:json(rank(X,Y)) -->
    json({ rname: X, rvalue: Y }).

djson: json(suit(X,Y)) -->
    json({sname: X, svalue: Y}).

djson:json(card(Rank, Suit)) -->
    { Rank = rank(_,_) },
    { Suit = suit(_,_) },
    json({ suit: Suit
         , rank: Rank
}).

deck :- http_open('http://localhost:3000/deck', In, []),
            json_read(In, Deck).


new_game :- http_open('http://localhost:3000/newgame', In, []),
            json_read(In, Game), write(Game).


pick_card :- http_open('http://localhost:3000/pick', In, []),
             json_read(In, Card), json_term(Card2, Card), write(Card2).      

