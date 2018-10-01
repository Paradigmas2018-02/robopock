:- consult(utils).

player_cards(Player, Card1, Card2) :- CardList = 
                                        Player.get(cards),
                                        nth0(0, CardList, RCard1),
                                        nth0(1, CardList, RCard2),
                                        pretty_card(RCard1, Card1),
                                        pretty_card(RCard2, Card2).