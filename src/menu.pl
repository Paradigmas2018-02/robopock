%% Main menu of the simulation %%

menu :- write("==== MENU ===="), nl,
        write("1 - New Game"), nl,
        write("2 - Bet"), nl,
        write("3 - Check"), nl,
        write("4 - All In"), nl,
        write("5 - Exit"), nl,
        write("=============="), nl,
        read(Choice),
        option(Choice).

option(1) :- write("Not Implemented"), !.
option(2) :- write("Not Implemented"), !.
option(3) :- write("Not Implemented"), !.
option(4) :- write("Not Implemented"), !.
option(5) :- write("Bye!"), !.