:- consult(request).
:- consult(human).
:- consult(bot).
:- consult(table).
:- consult(utils).

%% Main menu of the simulation %%
menu(Game) :- nl,
        write("==== MENU ===="), nl,
        write("1 - New Game"), nl,
        write("2 - Your Cards"), nl,
        write("3 - Show Table"), nl,
        write("4 - Bet"), nl,
        write("5 - Check"), nl,
        write("7 - Exit"), nl,
        write("=============="), nl,
        read(Choice),
        option(Choice, Game).

option(1, _) :- new_game(Game), menu(Game).
option(2, CurGame) :- human_cards(CurGame), menu(CurGame).
option(3, CurGame) :- show_table(CurGame), menu(CurGame).
option(4, _) :- place_bet(Value),bet("player2", Value, CurGame), show_table(CurGame), bot_turn(CurGame, Value, NewGame), menu(NewGame).
option(5, CurGame) :- check(CurGame, NewGame), menu(NewGame).
option(7, _) :- write("Bye!"), !.

main :- menu(_).