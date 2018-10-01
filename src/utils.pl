
pretty_card(Card, PCard) :- CardRank =
                                Card.get(rank),
                                CardSuit = Card.get(suit),
                                PCard = {CardRank.get(rname), CardSuit.get(sname)}.