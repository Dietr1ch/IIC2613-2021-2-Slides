#!/usr/bin/env clingo

p(a).
p(X) :- q(Y).  % X is unsafe, not referenced (and bound) by the body of the rule
