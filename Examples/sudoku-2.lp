% Instance
% ========

% A particularly hard Sudoku
% https://punemirror.indiatimes.com/pune/cover-story/worlds-toughest-sudoku-is-here-can-you-crack-it/articleshow/32299679.cms
%
%  Y  X 0   1   2    3   4   5    6   7   8
%  0  |   |   | 5 || 3 |   |   ||   |   |   |
%  1  | 8 |   |   ||   |   |   ||   | 2 |   |
%  2  |   | 7 |   ||   | 1 |   || 5 |   |   |
%     |---|---|---||---|---|---||---|---|---|
%  3  | 4 |   |   ||   |   | 5 || 3 |   |   |
%  4  |   | 1 |   ||   | 7 |   ||   |   | 6 |
%  5  |   |   | 3 || 2 |   |   ||   | 8 |   |
%     |---|---|---||---|---|---||---|---|---|
%  6  |   | 6 |   || 5 |   |   ||   |   | 9 |
%  7  |   |   | 4 ||   |   |   ||   | 3 |   |
%  8  |   |   |   ||   |   | 9 || 7 |   |   |
%
% Rohan Rao, the 19-year-old puzzle enthusiast and reigning Indian national
% Sudoku champion said, “With guesswork, any good solver can crack a sudoku of
% any difficulty level within 30 minutes at the most.”
%
% Rao said, “It is definitely a very tough puzzle, but it can be solved within %
% in hour by any average solver — so long as he makes a few guesses.”
%
% Elaborating on the difference between guesswork and logic, the young genius
% said, “/Guesswork/ is when you guess a number at a place and proceed to solve
% the sudoku. If you go wrong, you /back-track/ to the guess and change it.
% Continue till you reach the solution.
%
% If you don’t go wrong, it means your guess was correct.” He admits, “There are
% many Sudokus where one cannot use logic directly. So, resorting to guesswork
% is the best and quickest way out.” As far as Inkala’s latest challenger is
% concerned Rao says, “Without guesswork, it can take weeks, months, maybe even
% years!”

sudoku(0, 1, 8).
sudoku(1, 2, 7).
sudoku(2, 0, 5).

sudoku(3, 0, 3).
sudoku(4, 2, 1).

sudoku(6, 2, 5).
sudoku(7, 1, 2).


sudoku(0, 3, 4).
sudoku(1, 4, 1).
sudoku(2, 5, 3).

sudoku(3, 5, 2).
sudoku(4, 4, 7).
sudoku(5, 3, 5).

sudoku(6, 3, 3).
sudoku(7, 5, 8).
sudoku(8, 4, 6).


sudoku(1, 6, 6).
sudoku(2, 7, 4).

sudoku(3, 6, 5).
sudoku(5, 8, 9).

sudoku(6, 8, 7).
sudoku(7, 7, 3).
sudoku(8, 6, 9).
