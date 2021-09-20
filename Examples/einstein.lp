#!/usr/bin/env clingo

% Einstein's Puzzle
% =================

% Variations of this riddle appear on the net from time to time. It is sometimes
% attributed to Albert Einstein and it is claimed that 98% of the people are
% incapable of solving it. Some commentators suggest that Einstein created such
% puzzles not to test out intelligence but to get rid of all the students who
% wanted him as an advisor. It is not likely that there is any truth to these
% stories. Whereever this comes from, it is a nice riddle.

% Let us assume that there are five houses of different colors next to each
% other on the same road. In each house lives a man of a different nationality.
% Every man has his favorite drink, his favorite brand of cigarettes, and keeps
% pets of a particular kind.

%  1. The Englishman lives in the red house.
%  2. The Swede keeps dogs.
%  3. The Dane drinks tea.
%  4. The green house is just to the left of the white one.
%  5. The owner of the green house drinks coffee.
%  6. The Pall Mall smoker keeps birds.
%  7. The owner of the yellow house smokes Dunhills.
%  8. The man in the center house drinks milk.
%  9. The Norwegian lives in the first house.
% 10. The Blend smoker has a neighbor who keeps cats.
% 11. The man who smokes Blue Masters drinks beer.
% 12. The man who keeps horses lives next to the Dunhill smoker.
% 13. The German smokes Prince.
% 14. The Norwegian lives next to the blue house.
% 15. The Blend smoker has a neighbor who drinks water.

% The question to be answered is: Who keeps fish?


% Let us assume that there are five houses of different colors next to each
% other on the same road.
house(0..4).

% In each house lives a man of a different nationality.
% Every man has his favorite drink, his favorite brand of cigarettes, and keeps
% pets of a particular kind.
:- assign(H1, Prop), assign(H2, Prop), H1!=H2.
% Colors
{ assign(H, C) : color(C) } = 1 :- house(H).
:- assign(H, C1), assign(H, C2), color(C1), color(C2), C1 != C2.
% Nationalities
{ assign(H, N) : nationality(N) } = 1 :- house(H).
:- assign(H, N1), assign(H, N2), nationality(N1), nationality(N2), N1 != N2.
% Pets
{ assign(H, P) : pet(P) } = 1 :- house(H).
:- assign(H, P1), assign(H, P2), pet(P1), pet(P2), P1 != P2.
% Drinks
{ assign(H, D) : drink(D) } = 1 :- house(H).
:- assign(H, D1), assign(H, D2), drink(D1), drink(D2), D1 != D2.
% Tobacco brand
{ assign(H, T) : tobacco(T) } = 1 :- house(H).
:- assign(H, T1), assign(H, T2), tobacco(T1), tobacco(T2), T1 != T2.

%  1. The N_ENGLISHMAN lives in the C_RED house.
nationality(nEnglish).
color(cRed).
assign(H, cRed) :- assign(H, nEnglish).

%  2. The N_SWEDE keeps P_DOGS.
nationality(nSwedish).
pet(pDog).
assign(H, pDog) :- assign(H, nSwedish).

%  3. The N_DANE drinks D_TEA.
nationality(nDanish).
drink(dTea).
assign(H, dTea) :- assign(H, nDanish).

%  4. The C_GREEN house is just to the H_LEFT of the C_WHITE one.
color(cGreen).
color(cWhite).
assign(HG, cGreen) :- assign(HW, cWhite),
                      HG = HW - 1.

%  5. The owner of the C_GREEN house drinks D_COFFEE.
color(cGreen).
drink(dCoffee).
assign(H, dCoffee) :- assign(H, cGreen).

%  6. The T_PALLMALL smoker keeps P_BIRDS.
tobacco(tPallmall).
pet(pBird).
assign(H, pBird) :- assign(H, tPallmall).

%  7. The owner of the C_YELLOW house smokes T_DUNHILLS.
color(cYellow).
tobacco(tDunhill).
assign(H, tDunhill) :- assign(H, cYellow).

%  8. The man in the H_CENTER house drinks D_MILK.
drink(dMilk).
assign(2, dMilk).

%  9. The N_NORWEGIAN lives in the H_FIRST house.
nationality(nNorwegian).
assign(0, nNorwegian).

% 10. The T_BLEND smoker has a neighbor who keeps P_CAT.
neigh(H1, H2) :- house(H1),
                 house(H2),
                 H1 + 1 == H2.
neigh(H2, H1) :- neigh(H1, H2).
tobacco(tBlend).
pet(pCat).
:- assign(HB, tBlend), assign(HC, pCat), not neigh(HB, HC).

% 11. The man who smokes T_BLUEMASTERS drinks D_BEER.
tobacco(tBluemasters).
drink(dBeer).
assign(H, dBeer) :- assign(H, tBluemasters).

% 12. The man who keeps P_HORSES lives next to the T_DUNHILL smoker.
pet(pHorse).
tobacco(tDunhill).
:- assign(HH, pHorse), assign(HD, tDunhill), not neigh(HH, HD).

% 13. The N_GERMAN smokes T_PRINCE.
nationality(nGerman).
tobacco(tPrince).
assign(H, tPrince) :- assign(H, nGerman).

% 14. The N_NORWEGIAN lives next to the C_BLUE house.
nationality(nNorwegian).
color(cBlue).
:- assign(HN, nNorwegian), assign(HB, cBlue), not neigh(HN, HB).

% 15. The T_BLEND smoker has a neighbor who drinks D_WATER.
tobacco(tBlend).
drink(dWater).
:- assign(HB, tBlend), assign(HW, dWater), not neigh(HB, HW).

% The question to be answered is: Who keeps P_FISH?
pet(pFish).
fishhouse(H) :- assign(H, pFish).

% Show the answer
#show fishhouse/1.
#show assign/2.
