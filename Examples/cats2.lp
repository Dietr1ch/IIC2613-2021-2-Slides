#!/usr/bin/env clingo

mammal(X) :- cat(X).
mammal(X) :- dog(X).

animal(X) :- mammal(X).
sleeps(X) :- mammal(X).

cat(tom).
dog(spike).
