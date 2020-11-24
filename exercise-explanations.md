# Asprilo Seminar Explanations

## Exercise 1 task 1

There is one change that is made to the `goal-M.lp` file.

The rule

```
processed(A,R) :- ordered(O,A), shelved(S,A), isRobot(R), position(S,C,0),position(R,C,horizon).
```

is changed to

```
processed(A,R) :- ordered(O,A), shelved(S,A), isRobot(R), position(S,C,0),position(R,C,_).
```

This change allows the position of the robot, R, to exist not only at the horizon, but at any time.

## Exercise 1 task 2

There are two changes that is made to the `action-M.lp` file.

The rule

```
direction((X,Y)) :- X=-1..1, Y=-1..1, |X+Y|=1.
```

was changed to

```
direction((X,Y)) :- X=-1..1, Y=-1..1, { |X+Y|=1 ; |X+Y|=2 ; X+Y=0 }.
```

The rule

```
nextto((X,Y),(X',Y'),(X+X',Y+Y')) :- position((X,Y)), direction((X',Y')), position((X+X',Y+Y')).
```

was changed to

```
nextto((X,Y),(X',Y'),(X+X',Y+Y')) :- position((X,Y)), direction((X',Y')), position((X+X',Y+Y')), (X', Y') != (0,0).
```

This change allows the diagonal direction. This also ensures that diagonal squares are considered adjacent. The second rule addition ensures that the same square is not considered adjacent to itself.

## Exercise 2

There is one change that is made to the `action-M-mod.lp` file. 

The rule 

```
:- moveto((X',Y'), (X,Y), T), |Y'-Y/X'-X| = 1, |Y-Y'/X-X'| = 1.
```

was added.This rule checks the slope between two coordinates and prevents the movement if the slope is equal to one, meaning that the two coordinates are diagonal to each other.

## Exercise 3 task 1

The file `sides.lp` was added.

The following code was put into the file:
```
#include "../input.lp".

% Determine left/right x-coordinates
side(X, left) :- SX = #max{ X' : position((X',_)) },  X<=(SX+1)/2, position((X,_)).
side(X, right) :- SX = #max{ X' : position((X',_)) }, X> (SX+1)/2, position((X,_)).

% Group robots into left/right side wrt their initial position
leftRobot :- position((X,_)), side(X, left).
rightRobot :- position((X,_)), side(X, right).

% Forbid robots to occupy a position on the other side
leftRobot :- position((X,_)), not side(X, right).
rightRobot :- position((X,_)), not side(X, left).
```

This code categorizes the robots based on their X position into either left or right and once they are categorized they cannot enter spaces of the opposite catagorization.

## Exercise 3 task 2
The file `assign-a-sides.lp` was added.

The following code was put into the file:
```
#include "../input.lp".

% Aux predicates to represent products that are ordered and shelved, resp.
ordered(order(O),product(A),N) :- init(object(order,O),   value(line,(A,N))).
shelved(shelf(S),product(A),N) :- init(object(product,A), value(on,  (S,N))).

% Guess assignments
{ assign(R,S,P) } :- isRobot(R), isShelf(S), isStation(P).

% For each station and product, the assignment must allow for the fulfillment of the sum of
% requested quantities by all orders
orderedAtStation(A, M, P) :- isProduct(A), isStation(P),
                             M = #sum{ N, O : ordered(O,A,N), target(O,P) }.
:- orderedAtStation(A, M, P), #sum{ N,S : assign(_,S,P), shelved(S,A,N) } < M.

% Do not assign more than one robot per shelf
:- isShelf(S), #count{ R : assign(R,S,_) } > 1.

% Determine left/right x-coordinates
sideLeft :- SX = #max{ X' : position((X',_)) },  X<=(SX+1)/2, position((X,_)).
sideRight :- SX = #max{ X' : position((X',_)) }, X> (SX+1)/2, position((X,_)).

% Group robots, shelve and picking stations into left & right wrt their initial x-coordinates
leftItem :- position(_,C,T), sideLeft.
rightItem :- position(_,C,T), sideRight.

% Restrict movement of left/rigth robots to the respective half of the grid
leftItem :- position(_,C,T), not sideRight.
rightItem :- position(_,C,T), not sideLeft.

% Use all robots
:- isRobot(R), not assign(R,_,_).

% Output
#show assign/3.
#show init/2.
```

There are 3 sections where code was included for this assignment. 
Code was added to determine left-right coordinates, using the formula from part one.
Code was added to make objects in a left side of the warehouse be identified as on that side and same for the right.
And finally code was added to prevent an object belonging to one side of the warehouse from being on the other side.

## Exercise 4
The file `energy.lp` was added.

The following code was placed into the file:
```
% - Input conversion -------------------------------------------------------------------------------
%   Map init(object(robot, R), value(energy, E)) to internal representation,
%   .e.g energy(Robot,EnergyLevel,TimeStep)
energy(robot(R),E,0) :- init(object(robot, R), value(energy, E)).

% - Energy consumption -----------------------------------------------------------------------------

% *Generalize consumption*
% Map different actions to general consumption atoms, e.g. consume(Robot, EnergyAmount, TimeStep)
consume(R,1,T)  :- move(   R, _, T), not carries(R, _,T).
consume(R,2,T)  :- move(   R, _, T), carries(R, _,T).
consume(R,1,T)  :- pickup(   R, _, T), carries(R, _,T).
consume(R,1,T)  :- putdown(   R, _, T), not carries(R, _,T).

% *Consumption effect*
% For each robot and time step, reflect the effect of its current consumption (via consume/3)
% towards its current energy level (via energy/3)
  energy(R,E,T) :- consume(R,A,T), energy(R,B,T-1), E=(B-A), not T=0.

% *Inertia*
% For each robot and time step, if no energy is currently consumed, the energy level
% remains unchanged.
energy(R,E,T) :- energy(R,E,T-1), not move(R,_,T), not putdown(R,_,T), not carries(R, _,T), not T=0.

% *Forbid Over-Consumption*
% For each robot and time step, the energy level must not be negative.
energy(R,E,T) :- energy(R,E,T-1), E>=0, not T=0.

% - Output -----------------------------------------------------------------------------------------

#show energy/3.
```
There were four sections where code was added. 
Under *generalize consumption*, rules were added for the energy cost of carrying, picking up, and putting down. 
In *Consumption effect* a rule was written to transfer energy from one time step to another.
In *Inertia* a rule was written that if the robot is not moving, carrying anything, or putting anything down, it should have the same energy as the previous time step. 
In *Forbid Over-Consumption* a rule was written to prevent the time step from advancing if the energy level falls to zero.
