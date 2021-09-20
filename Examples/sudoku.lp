#!/usr/bin/env clingo

% Model
% =====

% There's a predicate x: C -> bool that specifies what are the valid x coordinates
% Similar for `y`, and `n` for valid numbers.

% Coordinates go from 0 to 8
% x(0..8).  % x(0). x(1). ... x(8).
x(0..8).
y(0..8).

% Cell numbers go from 1 to 9
n(1..9).

% There's a predicate sudoku: x -> y -> n -> bool
% that specifies which numbers to use.

% For every (x, y) coordinate sudoku(x, y, N) holds for exactly one number N.
{sudoku(X, Y, N): n(N)}=1 :- x(X) ,y(Y).

% Numbers are unique on each column.
:- sudoku(X,Y, N), sudoku(XX,Y, N), X!=XX.
% Numbers are unique on each row.
:- sudoku(X,Y, N), sudoku(X,YY, N), Y!=YY.

% subgrid: (X, Y) is on the same subgrid as (XX, YY)
subgrid(X,Y, XX,YY) :- x(X), y(Y),
                       x(XX), y(YY),
                       X/3 == XX/3,
                       Y/3 == YY/3.
% Numbers are unique on each grid
:- sudoku(X,Y, N), sudoku(XX,YY, N), subgrid(X,Y, XX,YY), X != XX, Y != YY.

% We only care about the sudoku(x, y n) predicate
#show sudoku/3.

