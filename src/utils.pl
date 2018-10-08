
pretty_card(Card, PCard) :- CardRank = Card.get(rank),
                            CardSuit = Card.get(suit),
                            PCard = {CardRank.get(rname), CardSuit.get(sname)}.


place_bet(Value):- write("Place a bet Value:"), nl, read(IntValue), atom_concat('', IntValue, Value).