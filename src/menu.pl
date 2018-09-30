:- consult(request).

%% Main menu of the simulation %%

menu(Game) :- 
        write("==== MENU ===="), nl,
        write("1 - New Game"), nl,
        write("2 - Your Cards"), nl,
        write("3 - Table Cards"), nl,
        write("4 - Bet"), nl,
        write("5 - Check"), nl,
        write("6 - All In"), nl,
        write("7 - Exit"), nl,
        write("=============="), nl,
        read(Choice),
        option(Choice, Game).

option(1, CurGame) :- new_game(CurGame), menu(CurGame).
option(2, CurGame) :- human_cards(CurGame), menu(CurGame).
option(3, CurGame) :- table_cards2(CurGame), menu(CurGame).
% option(4) :- write("Not Implemented"), !.
% option(5) :- write("Bye!"), !.

main :- menu(_).