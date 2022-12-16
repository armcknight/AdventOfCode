//
//  Day06Description.swift
//  aoc2018
//
//  Created by Andrew McKnight on Dec 4, 2022.
//

/**
## --- Day 6: Chronal Coordinates ---

The device on your wrist beeps several times, and once again you feel
like you're falling.

"<span
title="Why is the situation always critical? Why can't the situation just be boring for once?">Situation
critical</span>," the device announces. "Destination indeterminate.
Chronal interference detected. Please specify new target coordinates."

The device then produces a list of coordinates (your puzzle input). Are
they places it thinks are safe or dangerous? It recommends you check
manual page 729. The Elves did not give you a manual.

*If they're dangerous,* maybe you can minimize the danger by finding the
coordinate that gives the largest distance from the other points.

Using only the [Manhattan
distance](https://en.wikipedia.org/wiki/Taxicab_geometry), determine the
*area* around each coordinate by counting the number of
[integer](https://en.wikipedia.org/wiki/Integer) X,Y locations that are
*closest* to that coordinate (and aren't *tied in distance* to any other
coordinate).

Your goal is to find the size of the *largest area* that isn't infinite.
For example, consider the following list of coordinates:

1, 1
1, 6
8, 3
3, 4
5, 5
8, 9

If we name these coordinates `A` through `F`, we can draw them on a
grid, putting `0,0` at the top left:

..........
.A........
..........
........C.
...D......
.....E....
.B........
..........
..........
........F.

This view is partial - the actual grid extends infinitely in all
directions. Using the Manhattan distance, each location's closest
coordinate can be determined, shown here in lowercase:

aaaaa.cccc
aAaaa.cccc
aaaddecccc
aadddeccCc
..dDdeeccc
bb.deEeecc
bBb.eeee..
bbb.eeefff
bbb.eeffff
bbb.ffffFf

Locations shown as `.` are equally far from two or more coordinates, and
so they don't count as being closest to any.

In this example, the areas of coordinates A, B, C, and F are infinite -
while not shown here, their areas extend forever outside the visible
grid. However, the areas of coordinates D and E are finite: D is closest
to 9 locations, and E is closest to 17 (both including the coordinate's
location itself). Therefore, in this example, the size of the largest
area is *17*.

*What is the size of the largest area* that isn't infinite?

*/
public enum Day06: String {
case sample = """
, 1
1, 6
8, 3
3, 4
5, 5
8, 9
"""

case input = """
154, 159
172, 84
235, 204
181, 122
161, 337
305, 104
128, 298
176, 328
146, 71
210, 87
341, 195
50, 96
225, 151
86, 171
239, 68
79, 50
191, 284
200, 122
282, 240
224, 282
327, 74
158, 289
331, 244
154, 327
317, 110
272, 179
173, 175
187, 104
44, 194
202, 332
249, 197
244, 225
52, 127
299, 198
123, 198
349, 75
233, 72
284, 130
119, 150
172, 355
147, 314
58, 335
341, 348
236, 115
185, 270
173, 145
46, 288
214, 127
158, 293
237, 311
"""
}
