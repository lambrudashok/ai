% Main predicate to solve the 8 Queens problem
solve :-
    % Define the board with 8 positions
    Board = [_, _, _, _, _, _, _, _],
    % Place queens on the board
    place_queens(Board),
    % Print the solution
    print_board(Board).

% Predicate to place queens on the board
place_queens(Board) :-
    permutation([1, 2, 3, 4, 5, 6, 7, 8], Board),
    safe(Board).

% Predicate to check if the board is safe
safe([]).
safe([Queen|Others]) :-
    safe(Others),
    no_attack(Queen, Others, 1).

% Predicate to check if the current queen attacks others
no_attack(_, [], _).
no_attack(Y, [Y1|Ylist], Xdist) :-
    Y =\= Y1,
    abs(Y - Y1) =\= Xdist,
    Dist1 is Xdist + 1,
    no_attack(Y, Ylist, Dist1).

% Predicate to print the board
print_board([]).
print_board([H|T]) :-
    print_row(H),
    print_board(T).

% Predicate to print a row
print_row(Q) :-
    print_blanks(Q),
    write('Q'), nl.

% Predicate to print blanks before the queen
print_blanks(1) :-
    write('.').
print_blanks(N) :-
    N > 1,
    write('.'),
    N1 is N - 1,
    print_blanks(N1).

% Utility to calculate absolute value
abs(X, X) :- X >= 0.
abs(X, Y) :- X < 0, Y is -X.
