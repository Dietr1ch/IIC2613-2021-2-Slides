#!/usr/bin/env clingo

% Model
% =====

% There's a predicate x: C -> bool that specifies what are the valid x coordinates
% Similar for `y`, and `n` for valid numbers.

% Coordinates go from 0 to 8
x(0..8).  % Expands to:  x(0..8).  % x(0). x(1). ... x(8).
y(0..8).
% % Cell numbers go from 1 to 9
num(1..9).

% There's a predicate sudoku: x -> y -> n -> bool
% that specifies which numbers to use.
#show sudoku/3.  % And we only care about the sudoku(x, y n) predicate. x/1, y/1 and num/1 are uninteresting.

% Generators (Rules that help propose new models)
% ----------
% 1. For every (x, y) coordinate sudoku(x, y, N) holds for exactly one number N.
{ sudoku(X, Y, N) : num(N) } = 1 :- x(X), y(Y).

% Restrictions (Rules that discard tentative models)
% ------------
% 1. Numbers are unique on each column (same X).
:- sudoku(X, Y, N), sudoku(X, YY, N), Y!=YY.

% 2. Numbers are unique on each row (same Y).
:- sudoku(X, Y, N), sudoku(XX, Y, N), X!=XX.

% 3. Numbers are unique on subgrid
% subgrid: (X, Y) is on the same subgrid as (XX, YY)
subgrid(X, Y, XX, YY) :- x(X), y(Y),
                         x(XX), y(YY),
                         X/3 == XX/3,
                         Y/3 == YY/3.
% :- sudoku(X, Y, N), sudoku(XX, YY, N), subgrid(X, Y, XX, YY), X!=XX, Y!=YY.
:- sudoku(X, Y, N),sudoku(XX, Y, N), subgrid(X, Y, XX, YY), X!=XX.
:- sudoku(X, Y, N),sudoku(X, YY, N), subgrid(X, Y, XX, YY), Y!=YY.
:- sudoku(X, Y, N), sudoku(XX, YY, N), subgrid(X, Y, XX, YY), X!=XX, Y!=YY.
