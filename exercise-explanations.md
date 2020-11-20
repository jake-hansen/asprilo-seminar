# Asprilo Seminar Explanations

## Exercise 1 task 1

There is one change that is made to the `goal-M.lp` file.

The rule

```processed(A,R) :- ordered(O,A), shelved(S,A), isRobot(R), position(S,C,0),position(R,C,horizon).```

is changed to

```processed(A,R) :- ordered(O,A), shelved(S,A), isRobot(R), position(S,C,0),position(R,C,_).```

This change allows the position of the robot, R, to exist not only at the horizon, but at any time.

### Task 2