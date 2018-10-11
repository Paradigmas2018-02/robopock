
pretty_card(Card, PCard) :- CardRank = Card.get(rank),
                            CardSuit = Card.get(suit),
                            PCard = {CardRank.get(rname), CardSuit.get(sname)}.

% Recursive call to prettify all table cards, param is a list of cards.
pretty_cards([Head|Tail]) :- pretty_card(Head, PCard), write(PCard), pretty_cards(Tail).
pretty_cards([_|_]):- true.

place_bet(Value):- write("Place a bet Value:"), nl, read(Value).

show_hand(Player):- 
    nl, write("Cards:"), pretty_cards(Player.get(cards)),
    nl, write("Hand: "), write(Player.get(phand).get(hvalue).get(rname)),
    nl, pretty_cards(Player.get(phand).get(hcards)).


game_results(Game):-
    write("---- Table ----"), nl,
    pretty_cards(Game.get(table).get(tcards)), !,nl,nl,nl,
    write("---- Bot ----"), nl,
    show_hand(Game.get(player1)),!, nl, nl, nl,
    write("---- Player ----"), nl, 
    show_hand(Game.get(player2)),!, nl.