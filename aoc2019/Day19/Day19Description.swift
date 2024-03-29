//
//  Day19Description.swift
//  aoc2019
//
//  Created by Andrew McKnight on Dec 4, 2022.
//

/**
## --- Day 19: Tractor Beam ---

Unsure of the state of Santa's ship, you <span
title="&quot;borrowed&quot;">borrowed</span> the tractor beam technology
from Triton. Time to test it out.

When you're safely away from anything else, you activate the tractor
beam, but nothing happens. It's hard to tell whether it's working if
there's nothing to use it on. Fortunately, your ship's drone system can
be configured to deploy a drone to specific coordinates and then check
whether it's being pulled. There's even an [Intcode](9) program (your
puzzle input) that gives you access to the drone system.

The program uses two input instructions to request the *X and Y
position* to which the drone should be deployed. Negative numbers are
invalid and will confuse the drone; all numbers should be *zero or
positive*.

Then, the program will output whether the drone is *stationary* (`0`) or
*being pulled by something* (`1`). For example, the coordinate X=`0`,
Y=`0` is directly in front of the tractor beam emitter, so the drone
control program will always report `1` at that location.

To better understand the tractor beam, it is important to *get a good
picture* of the beam itself. For example, suppose you scan the 10x10
grid of points closest to the emitter:

X
0->      9
0#.........
|.#........
v..##......
...###....
....###...
Y .....####.
......####
......####
.......###
9........##

In this example, the *number of points affected by the tractor beam* in
the 10x10 area closest to the emitter is *`27`*.

However, you'll need to scan a larger area to *understand the shape* of
the beam. *How many points are affected by the tractor beam in the 50x50
area closest to the emitter?* (For each of X and Y, this will be `0`
through `49`.)

*/
public enum Day19: String {
case sample = """
"""

case input = """
109,424,203,1,21101,11,0,0,1105,1,282,21101,18,0,0,1106,0,259,2102,1,1,221,203,1,21101,0,31,0,1106,0,282,21102,38,1,0,1105,1,259,20101,0,23,2,22101,0,1,3,21101,1,0,1,21101,0,57,0,1105,1,303,2101,0,1,222,20102,1,221,3,21001,221,0,2,21101,0,259,1,21101,80,0,0,1105,1,225,21101,137,0,2,21101,91,0,0,1105,1,303,1202,1,1,223,21001,222,0,4,21102,259,1,3,21101,225,0,2,21102,225,1,1,21101,0,118,0,1106,0,225,20102,1,222,3,21101,0,88,2,21102,133,1,0,1105,1,303,21202,1,-1,1,22001,223,1,1,21101,0,148,0,1106,0,259,1202,1,1,223,20102,1,221,4,20101,0,222,3,21101,24,0,2,1001,132,-2,224,1002,224,2,224,1001,224,3,224,1002,132,-1,132,1,224,132,224,21001,224,1,1,21102,1,195,0,106,0,108,20207,1,223,2,20102,1,23,1,21101,-1,0,3,21101,0,214,0,1105,1,303,22101,1,1,1,204,1,99,0,0,0,0,109,5,2102,1,-4,249,22102,1,-3,1,22102,1,-2,2,22102,1,-1,3,21101,0,250,0,1105,1,225,22102,1,1,-4,109,-5,2106,0,0,109,3,22107,0,-2,-1,21202,-1,2,-1,21201,-1,-1,-1,22202,-1,-2,-2,109,-3,2106,0,0,109,3,21207,-2,0,-1,1206,-1,294,104,0,99,22101,0,-2,-2,109,-3,2105,1,0,109,5,22207,-3,-4,-1,1206,-1,346,22201,-4,-3,-4,21202,-3,-1,-1,22201,-4,-1,2,21202,2,-1,-1,22201,-4,-1,1,22102,1,-2,3,21102,343,1,0,1105,1,303,1105,1,415,22207,-2,-3,-1,1206,-1,387,22201,-3,-2,-3,21202,-2,-1,-1,22201,-3,-1,3,21202,3,-1,-1,22201,-3,-1,2,21202,-4,1,1,21102,1,384,0,1106,0,303,1106,0,415,21202,-4,-1,-4,22201,-4,-3,-4,22202,-3,-2,-2,22202,-2,-4,-4,22202,-3,-2,-3,21202,-4,-1,-2,22201,-3,-2,1,22101,0,1,-4,109,-5,2106,0,0
"""
}
