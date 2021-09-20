#!/usr/bin/env clingo

% Cats are animals. X is an animal
animal(X) :- cat(X).  % Variables start with Uppercase
% Dogs are animals
animal(X) :- dog(X).

% ~tom~ is a cat.
cat(tom).  % constants (objects) start with lowercase.
dog(spike).  % constants (objects) start with lowercase.
