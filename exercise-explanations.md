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

unconfirmed

## Exercise 4

unconfirmed
