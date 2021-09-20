#!/usr/bin/env clingo

q(a).
p(X) :- not q(X).  % The rule makes sense, but..
                   % How do we get candidate constants to evaluate the rule?
