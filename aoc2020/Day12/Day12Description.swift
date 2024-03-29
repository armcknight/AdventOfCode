//
//  Day12Description.swift
//  aoc2020
//
//  Created by Andrew McKnight on Dec 4, 2022.
//

/**
## --- Day 12: Rain Risk ---

Your ferry made decent progress toward the island, but the storm came in
<span title="At least it wasn't a Category Six!">faster than anyone
expected</span>. The ferry needs to take *evasive actions*!

Unfortunately, the ship's navigation computer seems to be
malfunctioning; rather than giving a route directly to safety, it
produced extremely circuitous instructions. When the captain uses the
<a href="https://en.wikipedia.org/wiki/Public_address_system"
target="_blank">PA system</a> to ask if anyone can help, you quickly
volunteer.

The navigation instructions (your puzzle input) consists of a sequence
of single-character *actions* paired with integer input *values*. After
staring at them for a few minutes, you work out what they probably mean:

-   Action *`N`* means to move *north* by the given value.
-   Action *`S`* means to move *south* by the given value.
-   Action *`E`* means to move *east* by the given value.
-   Action *`W`* means to move *west* by the given value.
-   Action *`L`* means to turn *left* the given number of degrees.
-   Action *`R`* means to turn *right* the given number of degrees.
-   Action *`F`* means to move *forward* by the given value in the
direction the ship is currently facing.

The ship starts by facing *east*. Only the `L` and `R` actions change
the direction the ship is facing. (That is, if the ship is facing east
and the next instruction is `N10`, the ship would move north 10 units,
but would still move east if the following action were `F`.)

For example:

F10
N3
F7
R90
F11

These instructions would be handled as follows:

-   `F10` would move the ship 10 units east (because the ship starts by
facing east) to *east 10, north 0*.
-   `N3` would move the ship 3 units north to *east 10, north 3*.
-   `F7` would move the ship another 7 units east (because the ship is
still facing east) to *east 17, north 3*.
-   `R90` would cause the ship to turn right by 90 degrees and face
*south*; it remains at *east 17, north 3*.
-   `F11` would move the ship 11 units south to *east 17, south 8*.

At the end of these instructions, the ship's
<a href="https://en.wikipedia.org/wiki/Manhattan_distance"
target="_blank">Manhattan distance</a> (sum of the absolute values of
its east/west position and its north/south position) from its starting
position is `17 + 8` = *`25`*.

Figure out where the navigation instructions lead. *What is the
Manhattan distance between that location and the ship's starting
position?*

 --- Part Two ---

 Before you can give the destination to the captain, you realize that the actual action meanings were printed on the back of the instructions the whole time.

 Almost all of the actions indicate how to move a waypoint which is relative to the ship's position:

 Action N means to move the waypoint north by the given value.
 Action S means to move the waypoint south by the given value.
 Action E means to move the waypoint east by the given value.
 Action W means to move the waypoint west by the given value.
 Action L means to rotate the waypoint around the ship left (counter-clockwise) the given number of degrees.
 Action R means to rotate the waypoint around the ship right (clockwise) the given number of degrees.
 Action F means to move forward to the waypoint a number of times equal to the given value.
 The waypoint starts 10 units east and 1 unit north relative to the ship. The waypoint is relative to the ship; that is, if the ship moves, the waypoint moves with it.

 For example, using the same instructions as above:

 F10 moves the ship to the waypoint 10 times (a total of 100 units east and 10 units north), leaving the ship at east 100, north 10. The waypoint stays 10 units east and 1 unit north of the ship.
 N3 moves the waypoint 3 units north to 10 units east and 4 units north of the ship. The ship remains at east 100, north 10.
 F7 moves the ship to the waypoint 7 times (a total of 70 units east and 28 units north), leaving the ship at east 170, north 38. The waypoint stays 10 units east and 4 units north of the ship.
 R90 rotates the waypoint around the ship clockwise 90 degrees, moving it to 4 units east and 10 units south of the ship. The ship remains at east 170, north 38.
 F11 moves the ship to the waypoint 11 times (a total of 44 units east and 110 units south), leaving the ship at east 214, south 72. The waypoint stays 4 units east and 10 units south of the ship.
 After these operations, the ship's Manhattan distance from its starting position is 214 + 72 = 286.

 Figure out where the navigation instructions actually lead. What is the Manhattan distance between that location and the ship's starting position?

*/
public enum Day12: String {
case sample = """
F10
N3
F7
R90
F11
"""

case input = """
F8
N2
F32
F17
E4
N4
R90
S2
R90
E3
L90
N5
E2
N2
W5
F78
L180
F19
R90
S1
E2
L180
E1
S5
E4
F62
R180
F16
S2
F8
R180
S1
L90
E4
R90
S3
E5
R180
F87
N2
E2
R90
N2
F2
R90
N5
W4
L90
F42
N1
F93
F87
E2
S4
F73
L270
S2
W3
F48
W5
L180
N1
F53
R90
S2
R90
N2
E2
S5
W3
R90
E2
R90
W1
L180
F29
W1
F56
R90
F34
F74
S1
R90
L90
W4
L90
W5
L90
W1
L90
N5
E2
S2
F58
N5
L90
S4
L90
R270
W4
S4
E3
R180
S4
W3
R90
F36
R90
W1
F73
S4
E1
L90
S4
W5
L90
F20
W3
L180
E3
S1
R90
S5
W3
L90
E5
W2
F21
N4
F83
W4
F48
W3
F4
L90
N5
R270
E1
S5
L180
F44
W5
R180
S3
F30
N5
F87
L90
F69
S5
E1
R90
E2
S3
F40
W4
F97
W5
F20
L180
N5
L90
E5
N3
L90
F13
N2
F38
S5
F27
E5
L180
F59
N3
F2
R90
N2
R90
F56
L90
N4
R90
F12
F34
N3
F93
L270
W3
F74
W4
R90
E2
L180
W3
F12
N5
W1
F98
E4
R180
S1
W5
R90
F96
N2
L90
F36
S1
F3
W3
F100
N5
R90
F33
W3
N5
E3
R90
F33
N5
E2
N1
L90
F84
L270
E1
F28
R180
W3
L90
S2
F88
L90
W2
N1
F3
R90
F56
N1
N4
L90
R90
F97
E5
N4
F38
N1
R90
W1
F60
W3
N1
F59
E1
N3
E3
L180
N1
F53
S1
E2
R90
E2
F6
R180
F36
R180
W2
F81
R90
E4
R90
F97
L90
W1
S1
E5
L180
F34
R180
F64
E2
R180
W3
S5
L90
E4
F12
F58
W3
N3
F77
N4
F32
R90
N2
E4
L90
S5
E1
N5
F44
R90
F5
E4
R90
N5
E4
R180
W3
L90
N1
F1
S3
E5
R180
S3
F86
S5
F61
W3
R270
W5
R90
F26
R180
F92
S5
L90
E5
N5
F82
R90
F22
R90
F23
S1
F42
N4
F76
E1
S1
W3
S2
L90
F19
E4
F41
E2
N2
L90
F34
S4
F20
W3
F18
S1
R90
N3
F38
W3
R90
W4
R90
E2
R90
F10
L90
N4
F94
S1
W3
R180
W5
F74
R90
S4
L180
S3
F74
N5
S4
L90
F34
S2
E5
N5
F28
L90
E1
F31
N1
L90
L90
W2
N5
R90
F1
N5
F48
W2
F50
N2
F62
S4
L90
W5
N1
F12
W3
R90
R90
F75
N5
F69
E3
F19
N2
F77
E1
N4
R180
E3
N2
L90
N1
W1
S4
F85
W1
R90
F74
E5
F73
E4
S3
W4
S5
L90
F49
S5
E5
F5
W2
F58
R90
W5
F53
S4
F86
N2
F88
E5
F59
E1
F56
W2
N4
W4
R180
F16
F25
R180
N3
F4
W4
S4
F98
E5
L90
W4
S1
E2
R90
F96
L270
E1
N1
F55
S1
F10
R90
W2
L90
N5
R90
N4
E4
L90
F52
S3
F43
E2
R90
S3
R90
N4
E1
N4
F15
E3
R270
L180
N2
F43
L90
W2
F19
L90
S5
F58
E4
S4
L90
W1
F9
N4
F38
S5
L90
W1
F39
W5
F83
L180
F99
L90
E3
S2
R90
N3
F35
N1
N3
L90
N4
W5
F26
R270
N2
F7
N1
F16
S4
L90
S5
L180
F5
W1
F32
S2
N3
F82
N4
R90
F27
R180
F20
S1
E3
L90
W3
F23
L180
N3
F34
W1
N3
S2
F80
E5
F65
L90
E5
N1
F80
R90
W3
L90
N1
L180
S1
F65
E3
S1
W3
F89
S1
F24
E5
F85
W1
F87
S1
R90
S4
F3
S3
F23
N4
L90
N5
R90
N2
R90
S2
W4
S2
F95
L90
F52
W1
N5
L90
N4
S3
E3
R90
N2
E1
R180
W4
F82
L180
E5
L90
E4
F65
W5
R90
W5
N5
L180
N4
F22
W3
S4
F60
R90
E5
N3
F32
S2
F80
R90
F18
S3
L90
F90
E3
L90
N3
E5
F79
N5
W4
S5
F100
N1
E3
S3
F49
R180
S3
E2
F1
W1
F5
R180
S5
W3
S3
F67
R270
N3
W3
N1
W3
F37
L90
N3
L90
F68
N3
W4
W2
F26
N3
L90
W3
S2
F7
W3
E3
L270
F64
R90
E4
R90
W3
N1
W1
F98
R270
W5
F45
R90
F49
E4
S2
F58
F56
W3
F57
E3
S5
R180
E3
F82
F57
S3
W2
R90
E2
R90
F95
W4
F85
E3
N3
R90
E5
F31
R90
F20
R90
N5
E3
S4
R180
W1
N5
F72
L90
E3
F46
R180
F18
E3
F48
S2
F84
W3
F88
F44
S2
E4
F77
L90
N4
L90
E2
F22
E5
L90
F79
W1
R90
F41
R180
F54
"""
}
