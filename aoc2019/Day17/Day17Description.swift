//
//  Day17Description.swift
//  aoc2019
//
//  Created by Andrew McKnight on Dec 4, 2022.
//

/**
## --- Day 17: Set and Forget ---

An early warning system detects an incoming [solar
flare](https://en.wikipedia.org/wiki/Solar_flare) and automatically
activates the ship's electromagnetic shield. Unfortunately, this has cut
off the Wi-Fi for many small robots that, unaware of the impending
danger, are now trapped on exterior scaffolding on the unsafe side of
the shield. To rescue them, you'll have to act quickly!

The only tools at your disposal are some wired cameras and a small
vacuum robot currently asleep at its charging station. The video quality
is poor, but the vacuum robot has a needlessly bright LED that makes it
easy to spot no matter where it is.

An [Intcode](9) program, the *Aft Scaffolding Control and Information
Interface* (ASCII, your puzzle input), provides access to the cameras
and the vacuum robot. Currently, because the vacuum robot is asleep, you
can only access the cameras.

Running the ASCII program on your Intcode computer will provide the
current view of the scaffolds. This is output, <span
title="PURELY COINCIDENTALLY">purely coincidentally</span>, as [ASCII
code](https://simple.wikipedia.org/wiki/ASCII): `35` means `#`, `46`
means `.`, `10` starts a [new
line](https://en.wikipedia.org/wiki/Newline#In_programming_languages) of
output below the current one, and so on. (Within a line, characters are
drawn left-to-right.)

In the camera output, `#` represents a scaffold and `.` represents open
space. The vacuum robot is visible as `^`, `v`, `<`, or `>` depending on
whether it is facing up, down, left, or right respectively. When drawn
like this, the vacuum robot is *always on a scaffold*; if the vacuum
robot ever walks off of a scaffold and begins *tumbling through space
uncontrollably*, it will instead be visible as `X`.

In general, the scaffold forms a path, but it sometimes loops back onto
itself. For example, suppose you can see the following view from the
cameras:

..#..........
..#..........
#######...###
#.#...#...#.#
#############
..#...#...#..
..#####...^..

Here, the vacuum robot, `^` is facing up and sitting at one end of the
scaffold near the bottom-right of the image. The scaffold continues up,
loops across itself several times, and ends at the top-left of the
image.

The first step is to calibrate the cameras by getting the *alignment
parameters* of some well-defined points. Locate all *scaffold
intersections*; for each, its alignment parameter is the distance
between its left edge and the left edge of the view multiplied by the
distance between its top edge and the top edge of the view. Here, the
intersections from the above image are marked `O`:

..#..........
..#..........
##O####...###
#.#...#...#.#
##O###O###O##
..#...#...#..
..#####...^..

For these intersections:

-   The top-left intersection is `2` units from the left of the image
and `2` units from the top of the image, so its alignment parameter
is `2 * 2 = `*`4`*.
-   The bottom-left intersection is `2` units from the left and `4`
units from the top, so its alignment parameter is `2 * 4 = `*`8`*.
-   The bottom-middle intersection is `6` from the left and `4` from the
top, so its alignment parameter is *`24`*.
-   The bottom-right intersection's alignment parameter is *`40`*.

To calibrate the cameras, you need the *sum of the alignment
parameters*. In the above example, this is *`76`*.

Run your ASCII program. *What is the sum of the alignment parameters*
for the scaffold intersections?

*/
public enum Day17: String {
case sample = """
5
"""

case input = """
1,330,331,332,109,2538,1102,1182,1,15,1102,1407,1,24,1001,0,0,570,1006,570,36,1002,571,1,0,1001,570,-1,570,1001,24,1,24,1106,0,18,1008,571,0,571,1001,15,1,15,1008,15,1407,570,1006,570,14,21101,58,0,0,1106,0,786,1006,332,62,99,21101,0,333,1,21102,73,1,0,1106,0,579,1101,0,0,572,1101,0,0,573,3,574,101,1,573,573,1007,574,65,570,1005,570,151,107,67,574,570,1005,570,151,1001,574,-64,574,1002,574,-1,574,1001,572,1,572,1007,572,11,570,1006,570,165,101,1182,572,127,102,1,574,0,3,574,101,1,573,573,1008,574,10,570,1005,570,189,1008,574,44,570,1006,570,158,1106,0,81,21102,1,340,1,1106,0,177,21102,477,1,1,1106,0,177,21102,1,514,1,21101,176,0,0,1105,1,579,99,21102,184,1,0,1106,0,579,4,574,104,10,99,1007,573,22,570,1006,570,165,101,0,572,1182,21101,375,0,1,21102,211,1,0,1106,0,579,21101,1182,11,1,21102,222,1,0,1106,0,979,21101,0,388,1,21101,233,0,0,1105,1,579,21101,1182,22,1,21101,0,244,0,1106,0,979,21101,0,401,1,21102,1,255,0,1106,0,579,21101,1182,33,1,21101,0,266,0,1106,0,979,21101,414,0,1,21101,277,0,0,1105,1,579,3,575,1008,575,89,570,1008,575,121,575,1,575,570,575,3,574,1008,574,10,570,1006,570,291,104,10,21102,1182,1,1,21101,313,0,0,1106,0,622,1005,575,327,1101,0,1,575,21102,1,327,0,1106,0,786,4,438,99,0,1,1,6,77,97,105,110,58,10,33,10,69,120,112,101,99,116,101,100,32,102,117,110,99,116,105,111,110,32,110,97,109,101,32,98,117,116,32,103,111,116,58,32,0,12,70,117,110,99,116,105,111,110,32,65,58,10,12,70,117,110,99,116,105,111,110,32,66,58,10,12,70,117,110,99,116,105,111,110,32,67,58,10,23,67,111,110,116,105,110,117,111,117,115,32,118,105,100,101,111,32,102,101,101,100,63,10,0,37,10,69,120,112,101,99,116,101,100,32,82,44,32,76,44,32,111,114,32,100,105,115,116,97,110,99,101,32,98,117,116,32,103,111,116,58,32,36,10,69,120,112,101,99,116,101,100,32,99,111,109,109,97,32,111,114,32,110,101,119,108,105,110,101,32,98,117,116,32,103,111,116,58,32,43,10,68,101,102,105,110,105,116,105,111,110,115,32,109,97,121,32,98,101,32,97,116,32,109,111,115,116,32,50,48,32,99,104,97,114,97,99,116,101,114,115,33,10,94,62,118,60,0,1,0,-1,-1,0,1,0,0,0,0,0,0,1,2,12,0,109,4,1202,-3,1,586,21001,0,0,-1,22101,1,-3,-3,21101,0,0,-2,2208,-2,-1,570,1005,570,617,2201,-3,-2,609,4,0,21201,-2,1,-2,1106,0,597,109,-4,2106,0,0,109,5,1201,-4,0,629,21002,0,1,-2,22101,1,-4,-4,21102,1,0,-3,2208,-3,-2,570,1005,570,781,2201,-4,-3,653,20102,1,0,-1,1208,-1,-4,570,1005,570,709,1208,-1,-5,570,1005,570,734,1207,-1,0,570,1005,570,759,1206,-1,774,1001,578,562,684,1,0,576,576,1001,578,566,692,1,0,577,577,21101,0,702,0,1105,1,786,21201,-1,-1,-1,1106,0,676,1001,578,1,578,1008,578,4,570,1006,570,724,1001,578,-4,578,21102,1,731,0,1105,1,786,1105,1,774,1001,578,-1,578,1008,578,-1,570,1006,570,749,1001,578,4,578,21101,756,0,0,1106,0,786,1106,0,774,21202,-1,-11,1,22101,1182,1,1,21102,1,774,0,1106,0,622,21201,-3,1,-3,1106,0,640,109,-5,2106,0,0,109,7,1005,575,802,20101,0,576,-6,20101,0,577,-5,1105,1,814,21102,1,0,-1,21102,1,0,-5,21102,1,0,-6,20208,-6,576,-2,208,-5,577,570,22002,570,-2,-2,21202,-5,29,-3,22201,-6,-3,-3,22101,1407,-3,-3,2102,1,-3,843,1005,0,863,21202,-2,42,-4,22101,46,-4,-4,1206,-2,924,21101,1,0,-1,1106,0,924,1205,-2,873,21101,0,35,-4,1105,1,924,1202,-3,1,878,1008,0,1,570,1006,570,916,1001,374,1,374,1201,-3,0,895,1102,2,1,0,1201,-3,0,902,1001,438,0,438,2202,-6,-5,570,1,570,374,570,1,570,438,438,1001,578,558,922,20102,1,0,-4,1006,575,959,204,-4,22101,1,-6,-6,1208,-6,29,570,1006,570,814,104,10,22101,1,-5,-5,1208,-5,39,570,1006,570,810,104,10,1206,-1,974,99,1206,-1,974,1102,1,1,575,21101,973,0,0,1106,0,786,99,109,-7,2106,0,0,109,6,21102,0,1,-4,21101,0,0,-3,203,-2,22101,1,-3,-3,21208,-2,82,-1,1205,-1,1030,21208,-2,76,-1,1205,-1,1037,21207,-2,48,-1,1205,-1,1124,22107,57,-2,-1,1205,-1,1124,21201,-2,-48,-2,1105,1,1041,21102,1,-4,-2,1106,0,1041,21101,0,-5,-2,21201,-4,1,-4,21207,-4,11,-1,1206,-1,1138,2201,-5,-4,1059,1202,-2,1,0,203,-2,22101,1,-3,-3,21207,-2,48,-1,1205,-1,1107,22107,57,-2,-1,1205,-1,1107,21201,-2,-48,-2,2201,-5,-4,1090,20102,10,0,-1,22201,-2,-1,-2,2201,-5,-4,1103,2101,0,-2,0,1105,1,1060,21208,-2,10,-1,1205,-1,1162,21208,-2,44,-1,1206,-1,1131,1105,1,989,21101,0,439,1,1106,0,1150,21102,477,1,1,1106,0,1150,21101,0,514,1,21101,0,1149,0,1105,1,579,99,21101,1157,0,0,1106,0,579,204,-2,104,10,99,21207,-3,22,-1,1206,-1,1138,1201,-5,0,1176,1201,-4,0,0,109,-6,2106,0,0,0,5,24,1,3,1,24,1,3,1,24,1,3,1,24,1,3,5,9,12,7,1,9,1,9,2,7,1,9,1,9,2,7,1,9,1,9,2,7,1,9,1,5,6,7,1,9,1,5,1,4,11,7,1,5,1,12,1,1,1,7,1,5,1,6,11,1,11,12,1,1,1,1,1,1,1,3,1,18,11,20,1,1,1,1,1,22,11,18,1,1,1,1,1,1,1,3,1,16,11,1,1,16,1,1,1,1,1,1,1,1,1,1,1,1,1,10,11,1,1,1,1,1,1,1,1,10,1,5,1,1,1,3,1,1,1,1,1,1,1,10,1,5,7,1,5,10,1,7,1,7,1,12,1,7,1,7,1,20,1,7,1,20,11,26,1,1,1,26,5,26,1,1,1,26,1,1,1,26,1,1,1,18,5,3,1,1,1,18,1,3,1,3,1,1,1,18,1,3,1,3,1,1,1,18,1,3,1,3,1,1,1,18,1,3,5,1,1,18,1,9,1,18,11,8
"""
}
