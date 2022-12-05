//
//  Day15Description.swift
//  aoc2019
//
//  Created by Andrew McKnight on Dec 4, 2022.
//

/**
## --- Day 15: Oxygen System ---

Out here in deep space, many things can go wrong. Fortunately, many of
those things have <span
title="Which indicator lights indicate when the indicator lights have failed?">indicator
lights</span>. Unfortunately, one of those lights is lit: the oxygen
system for part of the ship has failed!

According to the readouts, the oxygen system must have failed days ago
after a rupture in oxygen tank two; that section of the ship was
automatically sealed once oxygen levels went dangerously low. A single
remotely-operated *repair droid* is your only option for fixing the
oxygen system.

The Elves' care package included an [Intcode](9) program (your puzzle
input) that you can use to remotely control the repair droid. By running
that program, you can direct the repair droid to the oxygen system and
fix the problem.

The remote control program executes the following steps in a loop
forever:

-   Accept a *movement command* via an input instruction.
-   Send the movement command to the repair droid.
-   Wait for the repair droid to finish the movement operation.
-   Report on the *status* of the repair droid via an output
instruction.

Only four *movement commands* are understood: north (`1`), south (`2`),
west (`3`), and east (`4`). Any other command is invalid. The movements
differ in direction, but not in distance: in a long enough east-west
hallway, a series of commands like `4,4,4,4,3,3,3,3` would leave the
repair droid back where it started.

The repair droid can reply with any of the following *status* codes:

-   `0`: The repair droid hit a wall. Its position has not changed.
-   `1`: The repair droid has moved one step in the requested direction.
-   `2`: The repair droid has moved one step in the requested direction;
its new position is the location of the oxygen system.

You don't know anything about the area around the repair droid, but you
can figure it out by watching the status codes.

For example, we can draw the area using `D` for the droid, `#` for
walls, `.` for locations the droid can traverse, and empty space for
unexplored locations. Then, the initial state looks like this:



D



To make the droid go north, send it `1`. If it replies with `0`, you
know that location is a wall and that the droid didn't move:


#
D



To move east, send `4`; a reply of `1` means the movement was
successful:


#
.D



Then, perhaps attempts to move north (`1`), south (`2`), and east (`4`)
are all met with replies of `0`:


##
.D#
#


Now, you know the repair droid is in a dead end. Backtrack with `3`
(which you already know will get a reply of `1` because you already know
that location is open):


##
D.#
#


Then, perhaps west (`3`) gets a reply of `0`, south (`2`) gets a reply
of `1`, south again (`2`) gets a reply of `0`, and then west (`3`) gets
a reply of `2`:


##
#..#
D.#
#

Now, because of the reply of `2`, you know you've found the *oxygen
system*! In this example, it was only *`2`* moves away from the repair
droid's starting position.

*What is the fewest number of movement commands* required to move the
repair droid from its starting position to the location of the oxygen
system?

*/
public enum Day15: String {
case sample = """

"""

case input = """
3,1033,1008,1033,1,1032,1005,1032,31,1008,1033,2,1032,1005,1032,58,1008,1033,3,1032,1005,1032,81,1008,1033,4,1032,1005,1032,104,99,1001,1034,0,1039,1001,1036,0,1041,1001,1035,-1,1040,1008,1038,0,1043,102,-1,1043,1032,1,1037,1032,1042,1105,1,124,102,1,1034,1039,1002,1036,1,1041,1001,1035,1,1040,1008,1038,0,1043,1,1037,1038,1042,1106,0,124,1001,1034,-1,1039,1008,1036,0,1041,1002,1035,1,1040,1001,1038,0,1043,1002,1037,1,1042,1106,0,124,1001,1034,1,1039,1008,1036,0,1041,1002,1035,1,1040,101,0,1038,1043,1001,1037,0,1042,1006,1039,217,1006,1040,217,1008,1039,40,1032,1005,1032,217,1008,1040,40,1032,1005,1032,217,1008,1039,35,1032,1006,1032,165,1008,1040,35,1032,1006,1032,165,1102,1,2,1044,1105,1,224,2,1041,1043,1032,1006,1032,179,1102,1,1,1044,1105,1,224,1,1041,1043,1032,1006,1032,217,1,1042,1043,1032,1001,1032,-1,1032,1002,1032,39,1032,1,1032,1039,1032,101,-1,1032,1032,101,252,1032,211,1007,0,44,1044,1106,0,224,1102,0,1,1044,1106,0,224,1006,1044,247,1001,1039,0,1034,1002,1040,1,1035,102,1,1041,1036,101,0,1043,1038,1001,1042,0,1037,4,1044,1106,0,0,9,21,23,46,38,21,77,24,34,41,9,82,3,32,97,21,67,23,67,35,41,27,93,13,82,38,74,16,91,25,34,64,47,43,50,15,81,21,30,27,63,88,9,98,95,42,69,23,57,15,52,22,65,43,7,36,90,13,8,83,68,37,6,48,22,53,21,87,86,77,23,14,56,40,32,77,15,9,70,2,28,88,35,37,98,91,29,84,4,62,75,99,40,57,68,35,79,47,78,41,88,20,92,24,76,8,8,51,16,21,75,97,15,71,34,21,77,26,5,98,92,13,94,36,39,61,78,19,96,12,28,3,68,17,8,83,29,50,10,17,46,9,18,56,2,75,53,47,12,66,18,62,67,10,73,35,69,33,58,39,24,68,17,90,77,35,83,22,98,46,6,46,41,45,69,33,12,70,21,47,13,25,54,36,53,23,83,6,31,33,79,55,29,55,42,9,53,25,29,66,60,83,37,9,56,35,2,28,50,84,92,1,50,40,1,59,93,5,85,82,31,74,34,70,28,37,51,50,31,24,83,62,36,29,16,9,93,49,40,13,50,51,54,23,66,88,46,15,31,90,10,59,38,87,36,32,54,71,35,6,24,43,76,53,17,60,41,64,66,12,5,84,22,47,24,94,39,40,51,20,33,61,35,10,9,97,8,79,56,19,59,41,91,67,9,12,70,55,78,78,31,25,45,3,62,10,87,20,17,54,66,14,28,58,3,12,94,80,4,93,93,18,70,92,7,43,30,99,21,81,68,23,19,75,49,42,37,72,14,17,16,50,77,12,33,92,84,26,83,35,52,32,53,5,49,3,94,72,39,51,41,64,4,99,77,67,30,60,52,4,1,75,96,10,12,54,58,4,66,62,84,38,2,46,83,12,33,99,17,3,42,64,84,38,62,6,72,42,20,82,30,36,63,27,75,11,65,16,36,79,9,58,33,48,56,20,11,13,41,65,28,99,15,31,56,89,26,58,5,13,93,24,11,4,25,49,83,96,15,93,60,2,8,86,76,10,41,60,53,13,45,70,33,35,88,38,76,75,26,88,73,52,19,32,88,17,65,35,23,3,74,93,40,77,19,10,57,1,53,12,84,32,39,96,16,55,38,77,52,24,1,58,5,90,88,33,78,36,16,61,22,36,76,64,23,38,56,18,67,32,86,53,21,76,52,34,57,4,19,1,74,67,9,61,80,9,35,31,80,12,97,28,41,72,24,38,64,25,87,21,54,15,84,55,9,33,16,52,51,37,79,43,54,20,98,33,45,89,18,25,33,9,12,52,27,67,62,92,27,95,35,47,13,52,22,63,51,19,50,50,40,19,90,13,67,49,18,83,6,58,9,62,16,74,20,16,51,56,90,36,50,3,48,26,50,31,24,74,83,73,10,55,90,83,4,1,46,21,88,26,56,35,10,77,2,40,90,14,68,27,62,38,6,61,66,10,8,72,35,79,74,38,76,46,43,83,25,25,75,11,18,74,18,3,59,94,22,42,79,85,9,10,26,78,27,13,94,28,57,25,19,59,1,89,54,84,41,9,71,6,30,73,29,58,87,43,61,17,66,9,69,23,58,36,11,45,86,45,28,62,97,6,31,19,99,65,36,58,36,45,3,26,27,33,46,75,19,97,24,65,75,33,15,21,83,98,38,29,77,83,15,62,7,51,86,12,11,37,7,86,9,80,37,92,28,50,52,69,16,55,76,59,9,85,30,97,69,93,13,63,4,74,80,88,31,80,36,51,40,98,95,83,23,92,7,91,63,68,40,73,0,0,21,21,1,10,1,0,0,0,0,0,0

"""
}
