//
//  Day10Description.swift
//  aoc2018
//
//  Created by Andrew McKnight on Dec 4, 2022.
//

/**
## --- Day 10: The Stars Align ---

It's no use; your navigation system simply isn't capable of providing
<span
title="At the iceberg, use any lane to turn left. Then, swim for eight thousand miles.">walking
directions</span> in the arctic circle, and certainly not in 1018.

The Elves suggest an alternative. In times like these, North Pole rescue
operations will arrange points of light in the sky to guide missing
Elves back to base. Unfortunately, the message is easy to miss: the
points move slowly enough that it takes hours to align them, but have so
much momentum that they only stay aligned for a second. If you blink at
the wrong time, it might be hours before another message appears.

You can see these points of light floating in the distance, and record
their position in the sky and their velocity, the relative change in
position per second (your puzzle input). The coordinates are all given
from your perspective; given enough time, those positions and velocities
will move the points into a cohesive message!

Rather than wait, you decide to fast-forward the process and calculate
what the points will eventually spell.

For example, suppose you note the following points:

position=< 9,  1> velocity=< 0,  2>
position=< 7,  0> velocity=<-1,  0>
position=< 3, -2> velocity=<-1,  1>
position=< 6, 10> velocity=<-2, -1>
position=< 2, -4> velocity=< 2,  2>
position=<-6, 10> velocity=< 2, -2>
position=< 1,  8> velocity=< 1, -1>
position=< 1,  7> velocity=< 1,  0>
position=<-3, 11> velocity=< 1, -2>
position=< 7,  6> velocity=<-1, -1>
position=<-2,  3> velocity=< 1,  0>
position=<-4,  3> velocity=< 2,  0>
position=<10, -3> velocity=<-1,  1>
position=< 5, 11> velocity=< 1, -2>
position=< 4,  7> velocity=< 0, -1>
position=< 8, -2> velocity=< 0,  1>
position=<15,  0> velocity=<-2,  0>
position=< 1,  6> velocity=< 1,  0>
position=< 8,  9> velocity=< 0, -1>
position=< 3,  3> velocity=<-1,  1>
position=< 0,  5> velocity=< 0, -1>
position=<-2,  2> velocity=< 2,  0>
position=< 5, -2> velocity=< 1,  2>
position=< 1,  4> velocity=< 2,  1>
position=<-2,  7> velocity=< 2, -2>
position=< 3,  6> velocity=<-1, -1>
position=< 5,  0> velocity=< 1,  0>
position=<-6,  0> velocity=< 2,  0>
position=< 5,  9> velocity=< 1, -2>
position=<14,  7> velocity=<-2,  0>
position=<-3,  6> velocity=< 2, -1>

Each line represents one point. Positions are given as `<X, Y>` pairs: X
represents how far left (negative) or right (positive) the point
appears, while Y represents how far up (negative) or down (positive) the
point appears.

At `0` seconds, each point has the position given. Each second, each
point's velocity is added to its position. So, a point with velocity
`<1, -2>` is moving to the right, but is moving upward twice as quickly.
If this point's initial position were `<3, 9>`, after `3` seconds, its
position would become `<6, 3>`.

Over time, the points listed above would move like this:

Initially:
........#.............
................#.....
.........#.#..#.......
......................
#..........#.#.......#
...............#......
....#.................
..#.#....#............
.......#..............
......#...............
...#...#.#...#........
....#..#..#.........#.
.......#..............
...........#..#.......
#...........#.........
...#.......#..........

After 1 second:
......................
......................
..........#....#......
........#.....#.......
..#.........#......#..
......................
......#...............
....##.........#......
......#.#.............
.....##.##..#.........
........#.#...........
........#...#.....#...
..#...........#.......
....#.....#.#.........
......................
......................

After 2 seconds:
......................
......................
......................
..............#.......
....#..#...####..#....
......................
........#....#........
......#.#.............
.......#...#..........
.......#..#..#.#......
....#....#.#..........
.....#...#...##.#.....
........#.............
......................
......................
......................

After 3 seconds:
......................
......................
......................
......................
......#...#..###......
......#...#...#.......
......#...#...#.......
......#####...#.......
......#...#...#.......
......#...#...#.......
......#...#...#.......
......#...#..###......
......................
......................
......................
......................

After 4 seconds:
......................
......................
......................
............#.........
........##...#.#......
......#.....#..#......
.....#..##.##.#.......
.......##.#....#......
...........#....#.....
..............#.......
....#......#...#......
.....#.....##.........
...............#......
...............#......
......................
......................

After 3 seconds, the message appeared briefly: *`HI`*. Of course, your
message will be much longer and will take many more seconds to appear.

*What message will eventually appear in the sky?*

*/
public enum Day10: String {
case sample = """
osition=< 9,  1> velocity=< 0,  2>
position=< 7,  0> velocity=<-1,  0>
position=< 3, -2> velocity=<-1,  1>
position=< 6, 10> velocity=<-2, -1>
position=< 2, -4> velocity=< 2,  2>
position=<-6, 10> velocity=< 2, -2>
position=< 1,  8> velocity=< 1, -1>
position=< 1,  7> velocity=< 1,  0>
position=<-3, 11> velocity=< 1, -2>
position=< 7,  6> velocity=<-1, -1>
position=<-2,  3> velocity=< 1,  0>
position=<-4,  3> velocity=< 2,  0>
position=<10, -3> velocity=<-1,  1>
position=< 5, 11> velocity=< 1, -2>
position=< 4,  7> velocity=< 0, -1>
position=< 8, -2> velocity=< 0,  1>
position=<15,  0> velocity=<-2,  0>
position=< 1,  6> velocity=< 1,  0>
position=< 8,  9> velocity=< 0, -1>
position=< 3,  3> velocity=<-1,  1>
position=< 0,  5> velocity=< 0, -1>
position=<-2,  2> velocity=< 2,  0>
position=< 5, -2> velocity=< 1,  2>
position=< 1,  4> velocity=< 2,  1>
position=<-2,  7> velocity=< 2, -2>
position=< 3,  6> velocity=<-1, -1>
position=< 5,  0> velocity=< 1,  0>
position=<-6,  0> velocity=< 2,  0>
position=< 5,  9> velocity=< 1, -2>
position=<14,  7> velocity=<-2,  0>
position=<-3,  6> velocity=< 2, -1>
"""

case input = """
position=< 21459,  32026> velocity=<-2, -3>
position=<-31718, -42462> velocity=< 3,  4>
position=<-31744,  10746> velocity=< 3, -1>
position=<-10453,  32029> velocity=< 1, -3>
position=< 10801,  53308> velocity=<-1, -5>
position=< 32067, -53101> velocity=<-3,  5>
position=< 53386, -42455> velocity=<-5,  4>
position=<-31731, -31820> velocity=< 3,  3>
position=< 32099,  53305> velocity=<-3, -5>
position=< 10789,  32027> velocity=<-1, -3>
position=< 53406, -10535> velocity=<-5,  1>
position=<-31771, -53098> velocity=< 3,  5>
position=< 10801, -53103> velocity=<-1,  5>
position=< 42740,  21391> velocity=<-4, -2>
position=<-10457,  53313> velocity=< 1, -5>
position=< 42721,  21382> velocity=<-4, -2>
position=< 32100,  21389> velocity=<-3, -2>
position=<-42379, -10537> velocity=< 4,  1>
position=< 53397,  53312> velocity=<-5, -5>
position=<-10476, -10533> velocity=< 1,  1>
position=< 42720, -53104> velocity=<-4,  5>
position=< 10833,  10746> velocity=<-1, -1>
position=< 10785, -42460> velocity=<-1,  4>
position=<-42400,  10750> velocity=< 4, -1>
position=< 32120,  53309> velocity=<-3, -5>
position=< 32124, -21173> velocity=<-3,  2>
position=<-10481,  32026> velocity=< 1, -3>
position=<-53061, -21181> velocity=< 5,  2>
position=<-53021,  53311> velocity=< 5, -5>
position=<-53025, -31821> velocity=< 5,  3>
position=<-10470,  32023> velocity=< 1, -3>
position=< 10790, -10541> velocity=<-1,  1>
position=<-53001,  21382> velocity=< 5, -2>
position=<-21133, -21177> velocity=< 2,  2>
position=<-42395,  53314> velocity=< 4, -5>
position=<-31751, -53098> velocity=< 3,  5>
position=<-42394, -21173> velocity=< 4,  2>
position=< 42748, -42463> velocity=<-4,  4>
position=<-21078,  53308> velocity=< 2, -5>
position=< 32084, -21173> velocity=<-3,  2>
position=<-21096, -53101> velocity=< 2,  5>
position=<-31730, -53104> velocity=< 3,  5>
position=< 53394,  10742> velocity=<-5, -1>
position=< 53354,  32026> velocity=<-5, -3>
position=< 42729, -10538> velocity=<-4,  1>
position=< 10836, -31818> velocity=<-1,  3>
position=<-10438, -31819> velocity=< 1,  3>
position=<-21118,  32032> velocity=< 2, -3>
position=< 42761,  42666> velocity=<-4, -4>
position=<-31739, -10533> velocity=< 3,  1>
position=<-42361,  42664> velocity=< 4, -4>
position=< 10790,  10750> velocity=<-1, -1>
position=<-42420, -21174> velocity=< 4,  2>
position=<-53008, -31817> velocity=< 5,  3>
position=< 42766,  53310> velocity=<-4, -5>
position=< 53394, -21173> velocity=<-5,  2>
position=<-21133, -42455> velocity=< 2,  4>
position=<-42372,  21384> velocity=< 4, -2>
position=<-21122, -10533> velocity=< 2,  1>
position=<-53016,  32031> velocity=< 5, -3>
position=<-31750, -10541> velocity=< 3,  1>
position=< 42748, -31819> velocity=<-4,  3>
position=< 53397, -42459> velocity=<-5,  4>
position=<-31774, -21177> velocity=< 3,  2>
position=< 53390,  53305> velocity=<-5, -5>
position=<-31767, -10533> velocity=< 3,  1>
position=< 10805, -10541> velocity=<-1,  1>
position=< 42765,  32032> velocity=<-4, -3>
position=< 21471,  42666> velocity=<-2, -4>
position=< 10826, -53105> velocity=<-1,  5>
position=< 21466,  53313> velocity=<-2, -5>
position=<-42370, -42464> velocity=< 4,  4>
position=<-53008, -21175> velocity=< 5,  2>
position=< 32095,  53311> velocity=<-3, -5>
position=< 10801,  32025> velocity=<-1, -3>
position=<-53045, -31819> velocity=< 5,  3>
position=<-31774, -31816> velocity=< 3,  3>
position=<-42380, -21177> velocity=< 4,  2>
position=< 53373, -31815> velocity=<-5,  3>
position=< 53369, -10541> velocity=<-5,  1>
position=<-10445,  21383> velocity=< 1, -2>
position=<-21126, -53105> velocity=< 2,  5>
position=<-10470,  53314> velocity=< 1, -5>
position=<-31747, -53104> velocity=< 3,  5>
position=< 32083, -31823> velocity=<-3,  3>
position=< 21431,  42673> velocity=<-2, -4>
position=< 53407, -53096> velocity=<-5,  5>
position=<-10497,  53308> velocity=< 1, -5>
position=<-31770, -21173> velocity=< 3,  2>
position=< 10790, -31820> velocity=<-1,  3>
position=<-10469, -31820> velocity=< 1,  3>
position=<-31771,  42671> velocity=< 3, -4>
position=< 53385, -10535> velocity=<-5,  1>
position=< 32067, -53097> velocity=<-3,  5>
position=< 10785,  32026> velocity=<-1, -3>
position=< 32095,  53312> velocity=<-3, -5>
position=<-10472, -53096> velocity=< 1,  5>
position=< 42764,  32031> velocity=<-4, -3>
position=<-42375,  10743> velocity=< 4, -1>
position=<-42376, -53098> velocity=< 4,  5>
position=< 10833,  42673> velocity=<-1, -4>
position=<-42362,  10750> velocity=< 4, -1>
position=< 53349, -10541> velocity=<-5,  1>
position=<-10479, -42460> velocity=< 1,  4>
position=<-31731, -10537> velocity=< 3,  1>
position=<-10439,  21391> velocity=< 1, -2>
position=< 53354, -42460> velocity=<-5,  4>
position=<-10463,  21386> velocity=< 1, -2>
position=<-42377,  32028> velocity=< 4, -3>
position=< 42727,  10741> velocity=<-4, -1>
position=< 21462,  53308> velocity=<-2, -5>
position=<-42396,  32031> velocity=< 4, -3>
position=< 21447, -10538> velocity=<-2,  1>
position=< 32094,  32032> velocity=<-3, -3>
position=< 21487,  32025> velocity=<-2, -3>
position=< 10821,  21389> velocity=<-1, -2>
position=<-21101, -21182> velocity=< 2,  2>
position=< 10806, -53100> velocity=<-1,  5>
position=< 53377,  10743> velocity=<-5, -1>
position=<-31739,  21386> velocity=< 3, -2>
position=<-31763, -21175> velocity=< 3,  2>
position=<-10481, -53105> velocity=< 1,  5>
position=<-53016,  32026> velocity=< 5, -3>
position=<-10492,  32028> velocity=< 1, -3>
position=<-42408,  10743> velocity=< 4, -1>
position=< 21484, -21182> velocity=<-2,  2>
position=<-42368, -21181> velocity=< 4,  2>
position=< 32109, -21178> velocity=<-3,  2>
position=< 10836,  42664> velocity=<-1, -4>
position=< 53382, -31820> velocity=<-5,  3>
position=<-42399, -31816> velocity=< 4,  3>
position=<-42380, -21178> velocity=< 4,  2>
position=<-31761,  10741> velocity=< 3, -1>
position=< 42751, -53101> velocity=<-4,  5>
position=< 21471,  32025> velocity=<-2, -3>
position=< 53368, -10537> velocity=<-5,  1>
position=<-42399,  32029> velocity=< 4, -3>
position=<-31723,  53312> velocity=< 3, -5>
position=<-31751,  42669> velocity=< 3, -4>
position=<-31759, -10532> velocity=< 3,  1>
position=< 32087,  10745> velocity=<-3, -1>
position=<-53033, -21178> velocity=< 5,  2>
position=< 32118,  42669> velocity=<-3, -4>
position=<-42384, -31821> velocity=< 4,  3>
position=< 10834, -21181> velocity=<-1,  2>
position=<-53016, -21181> velocity=< 5,  2>
position=<-10486, -10532> velocity=< 1,  1>
position=<-10457,  53305> velocity=< 1, -5>
position=< 32125,  32028> velocity=<-3, -3>
position=< 32115, -21174> velocity=<-3,  2>
position=< 21470, -53105> velocity=<-2,  5>
position=<-31723,  42673> velocity=< 3, -4>
position=< 21426, -21177> velocity=<-2,  2>
position=<-31774, -31817> velocity=< 3,  3>
position=<-53049, -21179> velocity=< 5,  2>
position=< 42764, -53096> velocity=<-4,  5>
position=<-42416, -31819> velocity=< 4,  3>
position=< 42711,  21386> velocity=<-4, -2>
position=< 32102,  32027> velocity=<-3, -3>
position=<-42420,  21391> velocity=< 4, -2>
position=< 21460, -53101> velocity=<-2,  5>
position=<-53008, -31817> velocity=< 5,  3>
position=<-31779,  42665> velocity=< 3, -4>
position=<-53013, -21179> velocity=< 5,  2>
position=< 32115,  21384> velocity=<-3, -2>
position=<-31720,  53314> velocity=< 3, -5>
position=< 53354,  32025> velocity=<-5, -3>
position=<-53004,  53305> velocity=< 5, -5>
position=< 32109, -21182> velocity=<-3,  2>
position=< 21443,  42673> velocity=<-2, -4>
position=< 32118, -42464> velocity=<-3,  4>
position=<-53021, -42459> velocity=< 5,  4>
position=< 10845, -42464> velocity=<-1,  4>
position=<-42403, -21182> velocity=< 4,  2>
position=<-21117, -42462> velocity=< 2,  4>
position=< 53361,  21390> velocity=<-5, -2>
position=<-53056, -31815> velocity=< 5,  3>
position=<-31771, -53097> velocity=< 3,  5>
position=< 21478, -31818> velocity=<-2,  3>
position=< 42729, -21180> velocity=<-4,  2>
position=<-21133, -53098> velocity=< 2,  5>
position=< 21477, -42459> velocity=<-2,  4>
position=< 32110,  32027> velocity=<-3, -3>
position=<-42380, -53096> velocity=< 4,  5>
position=< 10838,  53313> velocity=<-1, -5>
position=<-53040,  32024> velocity=< 5, -3>
position=< 10838,  32030> velocity=<-1, -3>
position=<-42408,  21390> velocity=< 4, -2>
position=< 53410, -31822> velocity=<-5,  3>
position=< 10813, -53097> velocity=<-1,  5>
position=< 32116, -10540> velocity=<-3,  1>
position=< 21459, -10539> velocity=<-2,  1>
position=< 53393,  42671> velocity=<-5, -4>
position=< 10838, -31819> velocity=<-1,  3>
position=<-53026, -42459> velocity=< 5,  4>
position=< 21445,  32023> velocity=<-2, -3>
position=< 32095, -31823> velocity=<-3,  3>
position=<-10465, -21174> velocity=< 1,  2>
position=< 21470, -53099> velocity=<-2,  5>
position=< 21454,  10746> velocity=<-2, -1>
position=<-42420, -31821> velocity=< 4,  3>
position=<-31731,  21391> velocity=< 3, -2>
position=< 42764, -31816> velocity=<-4,  3>
position=< 32072,  42671> velocity=<-3, -4>
position=< 21438, -42459> velocity=<-2,  4>
position=< 32124, -53099> velocity=<-3,  5>
position=<-21098,  42671> velocity=< 2, -4>
position=< 10801, -31818> velocity=<-1,  3>
position=<-21133,  53313> velocity=< 2, -5>
position=< 53377, -42456> velocity=<-5,  4>
position=<-10455, -42464> velocity=< 1,  4>
position=<-31751, -21181> velocity=< 3,  2>
position=<-53061, -42459> velocity=< 5,  4>
position=<-21101, -42455> velocity=< 2,  4>
position=<-10461, -21179> velocity=< 1,  2>
position=<-53044,  53309> velocity=< 5, -5>
position=< 53361, -31816> velocity=<-5,  3>
position=<-42367, -53103> velocity=< 4,  5>
position=< 21479, -10533> velocity=<-2,  1>
position=<-31767, -10540> velocity=< 3,  1>
position=< 10813,  53306> velocity=<-1, -5>
position=< 42736,  53313> velocity=<-4, -5>
position=< 53378, -31823> velocity=<-5,  3>
position=<-42376, -53101> velocity=< 4,  5>
position=< 32120,  32032> velocity=<-3, -3>
position=< 53409, -42455> velocity=<-5,  4>
position=< 42719, -42455> velocity=<-4,  4>
position=< 10787,  42668> velocity=<-1, -4>
position=< 32103, -31816> velocity=<-3,  3>
position=<-53045,  42671> velocity=< 5, -4>
position=< 32115,  53313> velocity=<-3, -5>
position=< 42713, -42458> velocity=<-4,  4>
position=<-31779, -10541> velocity=< 3,  1>
position=<-31755, -10534> velocity=< 3,  1>
position=<-21101, -31814> velocity=< 2,  3>
position=< 42751,  21387> velocity=<-4, -2>
position=<-31729,  42664> velocity=< 3, -4>
position=< 53361, -31819> velocity=<-5,  3>
position=< 53359, -21173> velocity=<-5,  2>
position=< 10825, -31822> velocity=<-1,  3>
position=< 32067,  10748> velocity=<-3, -1>
position=<-21082, -10533> velocity=< 2,  1>
position=<-10436, -53096> velocity=< 1,  5>
position=<-10497,  21384> velocity=< 1, -2>
position=< 21479,  42671> velocity=<-2, -4>
position=< 42751, -42464> velocity=<-4,  4>
position=< 42727,  32032> velocity=<-4, -3>
position=<-10481,  53306> velocity=< 1, -5>
position=<-53025, -53103> velocity=< 5,  5>
position=< 42708, -53104> velocity=<-4,  5>
position=< 32123, -10541> velocity=<-3,  1>
position=< 21443, -21173> velocity=<-2,  2>
position=<-31761, -21173> velocity=< 3,  2>
position=<-21098,  10748> velocity=< 2, -1>
position=<-10470, -31814> velocity=< 1,  3>
position=<-21087,  10741> velocity=< 2, -1>
position=< 10845, -31823> velocity=<-1,  3>
position=< 32103, -53102> velocity=<-3,  5>
position=< 53361,  10744> velocity=<-5, -1>
position=<-31778, -53101> velocity=< 3,  5>
position=<-42364,  32031> velocity=< 4, -3>
position=< 21486, -42455> velocity=<-2,  4>
position=< 53365, -21173> velocity=<-5,  2>
position=<-21122,  21388> velocity=< 2, -2>
position=< 32125, -21177> velocity=<-3,  2>
position=< 32120,  10744> velocity=<-3, -1>
position=< 53365,  32031> velocity=<-5, -3>
position=< 42740,  53314> velocity=<-4, -5>
position=< 32078,  53305> velocity=<-3, -5>
position=<-21098,  21385> velocity=< 2, -2>
position=< 10813, -42460> velocity=<-1,  4>
position=< 32078,  21382> velocity=<-3, -2>
position=<-42380,  32032> velocity=< 4, -3>
position=<-42415,  32031> velocity=< 4, -3>
position=< 32088,  32030> velocity=<-3, -3>
position=< 32095,  53309> velocity=<-3, -5>
position=<-31777, -10537> velocity=< 3,  1>
position=< 42757, -10536> velocity=<-4,  1>
position=<-42367,  42670> velocity=< 4, -4>
position=<-31726, -10536> velocity=< 3,  1>
position=< 42769,  42664> velocity=<-4, -4>
position=<-53027,  53309> velocity=< 5, -5>
position=<-31767,  32024> velocity=< 3, -3>
position=<-31743,  21388> velocity=< 3, -2>
position=<-42408, -31817> velocity=< 4,  3>
position=<-21138,  32031> velocity=< 2, -3>
position=< 42724, -53105> velocity=<-4,  5>
position=< 53373, -31815> velocity=<-5,  3>
position=<-31778,  32027> velocity=< 3, -3>
position=< 21454, -42463> velocity=<-2,  4>
position=< 10822, -31822> velocity=<-1,  3>
position=<-53042,  53314> velocity=< 5, -5>
position=< 53370, -42461> velocity=<-5,  4>
position=< 32095, -53098> velocity=<-3,  5>
position=<-53002,  21382> velocity=< 5, -2>
position=<-21077, -53104> velocity=< 2,  5>
position=< 32123,  21391> velocity=<-3, -2>
position=< 10843,  10741> velocity=<-1, -1>
position=<-53024,  53305> velocity=< 5, -5>
position=<-21133, -53105> velocity=< 2,  5>
position=<-53029, -42455> velocity=< 5,  4>
position=<-21138, -53099> velocity=< 2,  5>
position=< 42719, -53096> velocity=<-4,  5>
position=< 32104, -53105> velocity=<-3,  5>
position=<-10492, -10540> velocity=< 1,  1>
position=<-10489, -31816> velocity=< 1,  3>
position=<-31735,  21388> velocity=< 3, -2>
position=< 42736, -21182> velocity=<-4,  2>
position=<-31751, -42458> velocity=< 3,  4>
position=< 10813,  53307> velocity=<-1, -5>
position=<-21112,  10750> velocity=< 2, -1>
position=<-53008, -21174> velocity=< 5,  2>
position=<-31731,  21388> velocity=< 3, -2>
position=<-42411, -42455> velocity=< 4,  4>
position=< 32117, -53100> velocity=<-3,  5>
position=< 21485,  42673> velocity=<-2, -4>
position=<-53056, -10535> velocity=< 5,  1>
position=<-53045,  10744> velocity=< 5, -1>
position=<-31746,  21388> velocity=< 3, -2>
position=< 10830, -10533> velocity=<-1,  1>
position=< 53365, -31822> velocity=<-5,  3>
position=<-10480, -21178> velocity=< 1,  2>
position=<-21112,  42673> velocity=< 2, -4>
position=< 10801, -53100> velocity=<-1,  5>
position=< 32115, -42461> velocity=<-3,  4>
position=< 42769,  10742> velocity=<-4, -1>
position=< 10833, -21180> velocity=<-1,  2>
position=<-42399, -10533> velocity=< 4,  1>
position=< 53408,  10750> velocity=<-5, -1>
position=< 10801, -31814> velocity=<-1,  3>
position=<-53027, -53100> velocity=< 5,  5>
position=< 10801, -10540> velocity=<-1,  1>
position=<-53061, -42461> velocity=< 5,  4>
position=<-31763, -21177> velocity=< 3,  2>
position=<-21090, -42460> velocity=< 2,  4>
position=<-53009, -31818> velocity=< 5,  3>
position=<-31746,  53311> velocity=< 3, -5>
position=<-42362,  10741> velocity=< 4, -1>
position=< 42727,  21382> velocity=<-4, -2>
position=<-31779,  42673> velocity=< 3, -4>
position=<-21105,  21389> velocity=< 2, -2>
position=< 42751,  21387> velocity=<-4, -2>
position=<-21081,  32029> velocity=< 2, -3>
position=< 53406,  21391> velocity=<-5, -2>
position=< 10785, -42459> velocity=<-1,  4>
position=<-42372, -10537> velocity=< 4,  1>
position=< 32112,  21385> velocity=<-3, -2>
position=<-10445,  53310> velocity=< 1, -5>
position=< 21466, -31821> velocity=<-2,  3>
position=<-21138,  42666> velocity=< 2, -4>
position=< 42751, -10537> velocity=<-4,  1>
position=< 10827,  53305> velocity=<-1, -5>
position=<-42399,  32024> velocity=< 4, -3>
position=< 21463, -42456> velocity=<-2,  4>
position=< 21463, -31822> velocity=<-2,  3>
position=<-21094, -21182> velocity=< 2,  2>
"""
}
