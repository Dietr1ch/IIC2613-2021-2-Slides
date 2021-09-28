% Time
% ====
time(0..k-1).

% Actions
% =======
{ exec(T, Action) : action(Action) } = 1 :- time(T).


% State evolution
% ===============

% Actions chosen respect the prerequisites
% Positive prerequisites
:- exec(T, Action), action_ppre(Action, Fluent), not holds(T, Fluent).
% Negative prerequisites
:- exec(T, Action), action_npre(Action, Fluent), holds(T, Fluent).

% State evolution
% A fluent holds if it was added by the last action.
holds(T+1, Fluent) :- exec(T, Action),
                      action_add(Action, Fluent).
% Or if it was true and it was not made false by the  last action.
holds(T+1, Fluent) :- holds(T, Fluent),
                      exec(T, Action),
                      not action_del(Action, Fluent).

% Problem definition
% ==================

% Initial state
holds(0, Fluent) :- start(Fluent).
% Goal condition
:- goal(Fluent), not holds(k, Fluent).

% Describe only the world and the solution
#show holds/2.
#show exec/2.

% Problem integrity checks
% ========================

% Problems must be stated correctly.
% 1. An action can't both, add and delete the same Fluent.
:- action_add(Action, Fluent), action_del(Action, Fluent).
% 2. A fluent cannot be both, a positive and a negative precondition.
:- action_ppre(Action, Fluent), action_npre(Action, Fluent).
