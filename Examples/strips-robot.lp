% pre-process input
connected(R2, R1, D) :- connected(R1, R2, D).
room(R) :- connected(R, RR, D).
door(D) :- connected(R, RR, D).

% Fluents
fluent(agentAt(R)) : room(R).
fluent(isOpen(D)) : door(D).

% Move
% ----
% Definition
action(move(Src, Dst, Door)) :- connected(Src, Dst, Door).
% Preconditions
% +1. Agent is at Src
action_ppre(move(Src, Dst, Door), agentAt(Src)) :- connected(Src, Dst, Door).
% +2. The door is open
action_ppre(move(Src, Dst, Door), isOpen(Door)) :- connected(Src, Dst, Door).
% Effects
% Positive Effects
% +1. Agent is now at Dst
action_add(move(Src, Dst, Door), agentAt(Dst)) :- connected(Src, Dst, Door).
% Negative Effects
% -1. Agent is no longer at Src
action_del(move(Src, Dst, Door), agentAt(Src)) :- connected(Src, Dst, Door).

% Open
% ----
% Definition
action(open(Src, Door)) :- connected(Src, Dst, Door).
% Preconditions
% +1. Agent is at Src
action_ppre(open(Src, Door), agentAt(Src)) :- connected(Src, Dst, Door).
% -1. The door is not open
action_npre(open(Src, Door), isOpen(Door)) :- connected(Src, Dst, Door).
% Effects
% Positive Effects
% +1. The door is now open
action_add(open(Src, Door), isOpen(Door)) :- connected(Src, Dst, Door).
% Negative Effects
%   There's no negative effects.

% #show action/1.
