:- consult(table).
:- consult(request).


bot(Game, Bot) :- Bot = Game.get(player1).
hand_value(Hand, Value) :- Value = Hand.get(hvalue).get(rvalue).
hand(Bot, Hand) :- Hand = Bot.get(phand).

bot_bet(Game, BetValue) :- bot_bet_request(Game, BetValue), nl, write("The bot has bet: "), write(BetValue), write(" tokens"), !.


bot_run :- nl, write("The bot abandoned this turn!"), nl, !.


bot_turn(Game, BetValue, NewGame) :- 
        bot(Game, Bot),
        hand(Bot, Hand),
        pot(Game, Pot),
        can_bet_then(can_bet(Hand, Pot, BetValue), bot_bet(NewGame, BetValue), bot_run).


can_bet_then(CanBet, Bet, _) :- CanBet, !, Bet.
can_bet_then(_, _, Run) :- Run. 


can_bet(Hand, Pot, BetValue) :- 
    pot_rentability(Pot, BetValue, Rent),
    chance(Hand, Chance), Chance >= Rent.


pot_rentability(Pot, BetValue, Rent) :- Rent is Pot / BetValue.


chance(Hand, Chance) :-
    hand_value(Hand, Value),
    may_win(Value, Chance).


%%% Naive probabilities %%%%
may_win(1, 50).
may_win(2, 91.524609).
may_win(3, 98.5055).
may_win(4, 99.2895).
may_win(5, 99.6445).
may_win(6, 99.8425).
may_win(7, 99.9865).
may_win(8, 99.9985).
may_win(9, 99.9998852).
may_win(10, 99.9998461).