//
//  Day14Description.swift
//  aoc2022
//
//  Created by Andrew McKnight on Dec 4, 2022.
//

/**
## --- Day 14: Regolith Reservoir ---

The distress signal leads you to a giant waterfall! Actually, hang on -
the signal seems like it's coming from the waterfall itself, and that
doesn't make any sense. However, you do notice a little path that leads
*behind* the waterfall.

Correction: the distress signal leads you behind a giant waterfall!
There seems to be a large cave system here, and the signal definitely
leads further inside.

As you begin to make your way deeper underground, you feel the ground
rumble for a moment. Sand begins pouring into the cave! If you don't
quickly figure out where the sand is going, you could quickly become
trapped!

Fortunately, your [familiarity](/2018/day/17) with analyzing the path of
falling material will come in handy here. You scan a two-dimensional
vertical slice of the cave above you (your puzzle input) and discover
that it is mostly *air* with structures made of *rock*.

Your scan traces the path of each solid rock structure and reports the
`x,y` coordinates that form the shape of the path, where `x` represents
distance to the right and `y` represents distance down. Each path
appears as a single line of text in your scan. After the first point of
each path, each point indicates the end of a straight horizontal or
vertical line to be drawn from the previous point. For example:

498,4 -> 498,6 -> 496,6
503,4 -> 502,4 -> 502,9 -> 494,9

This scan means that there are two paths of rock; the first path
consists of two straight lines, and the second path consists of three
straight lines. (Specifically, the first path consists of a line of rock
from `498,4` through `498,6` and another line of rock from `498,6`
through `496,6`.)

The sand is pouring into the cave from point `500,0`.

Drawing rock as `#`, air as `.`, and the source of the sand as `+`, this
becomes:

4     5  5
9     0  0
4     0  3
0 ......+...
1 ..........
2 ..........
3 ..........
4 ....#...##
5 ....#...#.
6 ..###...#.
7 ........#.
8 ........#.
9 #########.

Sand is produced *one unit at a time*, and the next unit of sand is not
produced until the previous unit of sand *comes to rest*. A unit of sand
is large enough to fill one tile of air in your scan.

A unit of sand always falls *down one step* if possible. If the tile
immediately below is blocked (by rock or sand), the unit of sand
attempts to instead move diagonally *one step down and to the left*. If
that tile is blocked, the unit of sand attempts to instead move
diagonally *one step down and to the right*. Sand keeps moving as long
as it is able to do so, at each step trying to move down, then
down-left, then down-right. If all three possible destinations are
blocked, the unit of sand *comes to rest* and no longer moves, at which
point the next unit of sand is created back at the source.

So, drawing sand that has come to rest as `o`, the first unit of sand
simply falls straight down and then stops:

......+...
..........
..........
..........
....#...##
....#...#.
..###...#.
........#.
......o.#.
#########.

The second unit of sand then falls straight down, lands on the first
one, and then comes to rest to its left:

......+...
..........
..........
..........
....#...##
....#...#.
..###...#.
........#.
.....oo.#.
#########.

After a total of five units of sand have come to rest, they form this
pattern:

......+...
..........
..........
..........
....#...##
....#...#.
..###...#.
......o.#.
....oooo#.
#########.

After a total of 22 units of sand:

......+...
..........
......o...
.....ooo..
....#ooo##
....#ooo#.
..###ooo#.
....oooo#.
...ooooo#.
#########.

Finally, only two more units of sand can possibly come to rest:

......+...
..........
......o...
.....ooo..
....#ooo##
...o#ooo#.
..###ooo#.
....oooo#.
.o.ooooo#.
#########.

Once all *`24`* units of sand shown above have come to rest, all further
sand flows out the bottom, falling into the endless void. Just for fun,
the path any new sand takes before falling forever is shown here with
`~`:

.......+...
.......~...
......~o...
.....~ooo..
....~#ooo##
...~o#ooo#.
..~###ooo#.
..~..oooo#.
.~o.ooooo#.
~#########.
~..........
~..........
~..........

Using your scan, simulate the falling sand. *How many units of sand come
to rest before sand starts flowing into the abyss below?*

*/
public enum Day14: String {
case sample = """
498,4 -&gt; 498,6 -&gt; 496,6
503,4 -&gt; 502,4 -&gt; 502,9 -&gt; 494,9
"""

case input = """
490,51 -> 490,54 -> 486,54 -> 486,59 -> 499,59 -> 499,54 -> 492,54 -> 492,51
476,161 -> 476,156 -> 476,161 -> 478,161 -> 478,160 -> 478,161 -> 480,161 -> 480,154 -> 480,161 -> 482,161 -> 482,155 -> 482,161 -> 484,161 -> 484,158 -> 484,161 -> 486,161 -> 486,159 -> 486,161
472,79 -> 472,73 -> 472,79 -> 474,79 -> 474,69 -> 474,79 -> 476,79 -> 476,77 -> 476,79
477,148 -> 477,138 -> 477,148 -> 479,148 -> 479,144 -> 479,148 -> 481,148 -> 481,146 -> 481,148
484,132 -> 489,132
501,15 -> 506,15
485,85 -> 485,88 -> 482,88 -> 482,93 -> 499,93 -> 499,88 -> 491,88 -> 491,85
472,79 -> 472,73 -> 472,79 -> 474,79 -> 474,69 -> 474,79 -> 476,79 -> 476,77 -> 476,79
503,43 -> 514,43 -> 514,42
497,13 -> 502,13
490,51 -> 490,54 -> 486,54 -> 486,59 -> 499,59 -> 499,54 -> 492,54 -> 492,51
457,106 -> 457,99 -> 457,106 -> 459,106 -> 459,98 -> 459,106 -> 461,106 -> 461,97 -> 461,106 -> 463,106 -> 463,105 -> 463,106 -> 465,106 -> 465,99 -> 465,106 -> 467,106 -> 467,103 -> 467,106 -> 469,106 -> 469,101 -> 469,106 -> 471,106 -> 471,103 -> 471,106 -> 473,106 -> 473,100 -> 473,106
498,17 -> 503,17
457,106 -> 457,99 -> 457,106 -> 459,106 -> 459,98 -> 459,106 -> 461,106 -> 461,97 -> 461,106 -> 463,106 -> 463,105 -> 463,106 -> 465,106 -> 465,99 -> 465,106 -> 467,106 -> 467,103 -> 467,106 -> 469,106 -> 469,101 -> 469,106 -> 471,106 -> 471,103 -> 471,106 -> 473,106 -> 473,100 -> 473,106
490,51 -> 490,54 -> 486,54 -> 486,59 -> 499,59 -> 499,54 -> 492,54 -> 492,51
467,81 -> 467,82 -> 487,82 -> 487,81
481,135 -> 486,135
485,85 -> 485,88 -> 482,88 -> 482,93 -> 499,93 -> 499,88 -> 491,88 -> 491,85
476,161 -> 476,156 -> 476,161 -> 478,161 -> 478,160 -> 478,161 -> 480,161 -> 480,154 -> 480,161 -> 482,161 -> 482,155 -> 482,161 -> 484,161 -> 484,158 -> 484,161 -> 486,161 -> 486,159 -> 486,161
470,122 -> 470,123 -> 485,123 -> 485,122
491,132 -> 496,132
457,106 -> 457,99 -> 457,106 -> 459,106 -> 459,98 -> 459,106 -> 461,106 -> 461,97 -> 461,106 -> 463,106 -> 463,105 -> 463,106 -> 465,106 -> 465,99 -> 465,106 -> 467,106 -> 467,103 -> 467,106 -> 469,106 -> 469,101 -> 469,106 -> 471,106 -> 471,103 -> 471,106 -> 473,106 -> 473,100 -> 473,106
457,106 -> 457,99 -> 457,106 -> 459,106 -> 459,98 -> 459,106 -> 461,106 -> 461,97 -> 461,106 -> 463,106 -> 463,105 -> 463,106 -> 465,106 -> 465,99 -> 465,106 -> 467,106 -> 467,103 -> 467,106 -> 469,106 -> 469,101 -> 469,106 -> 471,106 -> 471,103 -> 471,106 -> 473,106 -> 473,100 -> 473,106
476,161 -> 476,156 -> 476,161 -> 478,161 -> 478,160 -> 478,161 -> 480,161 -> 480,154 -> 480,161 -> 482,161 -> 482,155 -> 482,161 -> 484,161 -> 484,158 -> 484,161 -> 486,161 -> 486,159 -> 486,161
457,106 -> 457,99 -> 457,106 -> 459,106 -> 459,98 -> 459,106 -> 461,106 -> 461,97 -> 461,106 -> 463,106 -> 463,105 -> 463,106 -> 465,106 -> 465,99 -> 465,106 -> 467,106 -> 467,103 -> 467,106 -> 469,106 -> 469,101 -> 469,106 -> 471,106 -> 471,103 -> 471,106 -> 473,106 -> 473,100 -> 473,106
457,106 -> 457,99 -> 457,106 -> 459,106 -> 459,98 -> 459,106 -> 461,106 -> 461,97 -> 461,106 -> 463,106 -> 463,105 -> 463,106 -> 465,106 -> 465,99 -> 465,106 -> 467,106 -> 467,103 -> 467,106 -> 469,106 -> 469,101 -> 469,106 -> 471,106 -> 471,103 -> 471,106 -> 473,106 -> 473,100 -> 473,106
491,17 -> 496,17
476,161 -> 476,156 -> 476,161 -> 478,161 -> 478,160 -> 478,161 -> 480,161 -> 480,154 -> 480,161 -> 482,161 -> 482,155 -> 482,161 -> 484,161 -> 484,158 -> 484,161 -> 486,161 -> 486,159 -> 486,161
497,26 -> 501,26
476,161 -> 476,156 -> 476,161 -> 478,161 -> 478,160 -> 478,161 -> 480,161 -> 480,154 -> 480,161 -> 482,161 -> 482,155 -> 482,161 -> 484,161 -> 484,158 -> 484,161 -> 486,161 -> 486,159 -> 486,161
491,22 -> 495,22
477,148 -> 477,138 -> 477,148 -> 479,148 -> 479,144 -> 479,148 -> 481,148 -> 481,146 -> 481,148
457,106 -> 457,99 -> 457,106 -> 459,106 -> 459,98 -> 459,106 -> 461,106 -> 461,97 -> 461,106 -> 463,106 -> 463,105 -> 463,106 -> 465,106 -> 465,99 -> 465,106 -> 467,106 -> 467,103 -> 467,106 -> 469,106 -> 469,101 -> 469,106 -> 471,106 -> 471,103 -> 471,106 -> 473,106 -> 473,100 -> 473,106
476,161 -> 476,156 -> 476,161 -> 478,161 -> 478,160 -> 478,161 -> 480,161 -> 480,154 -> 480,161 -> 482,161 -> 482,155 -> 482,161 -> 484,161 -> 484,158 -> 484,161 -> 486,161 -> 486,159 -> 486,161
480,129 -> 485,129
490,51 -> 490,54 -> 486,54 -> 486,59 -> 499,59 -> 499,54 -> 492,54 -> 492,51
477,132 -> 482,132
477,148 -> 477,138 -> 477,148 -> 479,148 -> 479,144 -> 479,148 -> 481,148 -> 481,146 -> 481,148
476,161 -> 476,156 -> 476,161 -> 478,161 -> 478,160 -> 478,161 -> 480,161 -> 480,154 -> 480,161 -> 482,161 -> 482,155 -> 482,161 -> 484,161 -> 484,158 -> 484,161 -> 486,161 -> 486,159 -> 486,161
488,20 -> 492,20
492,48 -> 506,48 -> 506,47
457,106 -> 457,99 -> 457,106 -> 459,106 -> 459,98 -> 459,106 -> 461,106 -> 461,97 -> 461,106 -> 463,106 -> 463,105 -> 463,106 -> 465,106 -> 465,99 -> 465,106 -> 467,106 -> 467,103 -> 467,106 -> 469,106 -> 469,101 -> 469,106 -> 471,106 -> 471,103 -> 471,106 -> 473,106 -> 473,100 -> 473,106
477,148 -> 477,138 -> 477,148 -> 479,148 -> 479,144 -> 479,148 -> 481,148 -> 481,146 -> 481,148
474,135 -> 479,135
479,64 -> 484,64
510,29 -> 510,33 -> 506,33 -> 506,39 -> 517,39 -> 517,33 -> 512,33 -> 512,29
486,64 -> 491,64
490,66 -> 495,66
476,161 -> 476,156 -> 476,161 -> 478,161 -> 478,160 -> 478,161 -> 480,161 -> 480,154 -> 480,161 -> 482,161 -> 482,155 -> 482,161 -> 484,161 -> 484,158 -> 484,161 -> 486,161 -> 486,159 -> 486,161
472,79 -> 472,73 -> 472,79 -> 474,79 -> 474,69 -> 474,79 -> 476,79 -> 476,77 -> 476,79
494,24 -> 498,24
476,161 -> 476,156 -> 476,161 -> 478,161 -> 478,160 -> 478,161 -> 480,161 -> 480,154 -> 480,161 -> 482,161 -> 482,155 -> 482,161 -> 484,161 -> 484,158 -> 484,161 -> 486,161 -> 486,159 -> 486,161
471,109 -> 471,112 -> 467,112 -> 467,120 -> 477,120 -> 477,112 -> 475,112 -> 475,109
503,43 -> 514,43 -> 514,42
477,148 -> 477,138 -> 477,148 -> 479,148 -> 479,144 -> 479,148 -> 481,148 -> 481,146 -> 481,148
485,85 -> 485,88 -> 482,88 -> 482,93 -> 499,93 -> 499,88 -> 491,88 -> 491,85
476,161 -> 476,156 -> 476,161 -> 478,161 -> 478,160 -> 478,161 -> 480,161 -> 480,154 -> 480,161 -> 482,161 -> 482,155 -> 482,161 -> 484,161 -> 484,158 -> 484,161 -> 486,161 -> 486,159 -> 486,161
457,106 -> 457,99 -> 457,106 -> 459,106 -> 459,98 -> 459,106 -> 461,106 -> 461,97 -> 461,106 -> 463,106 -> 463,105 -> 463,106 -> 465,106 -> 465,99 -> 465,106 -> 467,106 -> 467,103 -> 467,106 -> 469,106 -> 469,101 -> 469,106 -> 471,106 -> 471,103 -> 471,106 -> 473,106 -> 473,100 -> 473,106
457,106 -> 457,99 -> 457,106 -> 459,106 -> 459,98 -> 459,106 -> 461,106 -> 461,97 -> 461,106 -> 463,106 -> 463,105 -> 463,106 -> 465,106 -> 465,99 -> 465,106 -> 467,106 -> 467,103 -> 467,106 -> 469,106 -> 469,101 -> 469,106 -> 471,106 -> 471,103 -> 471,106 -> 473,106 -> 473,100 -> 473,106
510,29 -> 510,33 -> 506,33 -> 506,39 -> 517,39 -> 517,33 -> 512,33 -> 512,29
488,135 -> 493,135
472,79 -> 472,73 -> 472,79 -> 474,79 -> 474,69 -> 474,79 -> 476,79 -> 476,77 -> 476,79
467,81 -> 467,82 -> 487,82 -> 487,81
483,126 -> 488,126
457,106 -> 457,99 -> 457,106 -> 459,106 -> 459,98 -> 459,106 -> 461,106 -> 461,97 -> 461,106 -> 463,106 -> 463,105 -> 463,106 -> 465,106 -> 465,99 -> 465,106 -> 467,106 -> 467,103 -> 467,106 -> 469,106 -> 469,101 -> 469,106 -> 471,106 -> 471,103 -> 471,106 -> 473,106 -> 473,100 -> 473,106
483,66 -> 488,66
457,106 -> 457,99 -> 457,106 -> 459,106 -> 459,98 -> 459,106 -> 461,106 -> 461,97 -> 461,106 -> 463,106 -> 463,105 -> 463,106 -> 465,106 -> 465,99 -> 465,106 -> 467,106 -> 467,103 -> 467,106 -> 469,106 -> 469,101 -> 469,106 -> 471,106 -> 471,103 -> 471,106 -> 473,106 -> 473,100 -> 473,106
477,148 -> 477,138 -> 477,148 -> 479,148 -> 479,144 -> 479,148 -> 481,148 -> 481,146 -> 481,148
457,106 -> 457,99 -> 457,106 -> 459,106 -> 459,98 -> 459,106 -> 461,106 -> 461,97 -> 461,106 -> 463,106 -> 463,105 -> 463,106 -> 465,106 -> 465,99 -> 465,106 -> 467,106 -> 467,103 -> 467,106 -> 469,106 -> 469,101 -> 469,106 -> 471,106 -> 471,103 -> 471,106 -> 473,106 -> 473,100 -> 473,106
476,161 -> 476,156 -> 476,161 -> 478,161 -> 478,160 -> 478,161 -> 480,161 -> 480,154 -> 480,161 -> 482,161 -> 482,155 -> 482,161 -> 484,161 -> 484,158 -> 484,161 -> 486,161 -> 486,159 -> 486,161
476,66 -> 481,66
472,79 -> 472,73 -> 472,79 -> 474,79 -> 474,69 -> 474,79 -> 476,79 -> 476,77 -> 476,79
457,106 -> 457,99 -> 457,106 -> 459,106 -> 459,98 -> 459,106 -> 461,106 -> 461,97 -> 461,106 -> 463,106 -> 463,105 -> 463,106 -> 465,106 -> 465,99 -> 465,106 -> 467,106 -> 467,103 -> 467,106 -> 469,106 -> 469,101 -> 469,106 -> 471,106 -> 471,103 -> 471,106 -> 473,106 -> 473,100 -> 473,106
476,161 -> 476,156 -> 476,161 -> 478,161 -> 478,160 -> 478,161 -> 480,161 -> 480,154 -> 480,161 -> 482,161 -> 482,155 -> 482,161 -> 484,161 -> 484,158 -> 484,161 -> 486,161 -> 486,159 -> 486,161
494,15 -> 499,15
476,161 -> 476,156 -> 476,161 -> 478,161 -> 478,160 -> 478,161 -> 480,161 -> 480,154 -> 480,161 -> 482,161 -> 482,155 -> 482,161 -> 484,161 -> 484,158 -> 484,161 -> 486,161 -> 486,159 -> 486,161
476,161 -> 476,156 -> 476,161 -> 478,161 -> 478,160 -> 478,161 -> 480,161 -> 480,154 -> 480,161 -> 482,161 -> 482,155 -> 482,161 -> 484,161 -> 484,158 -> 484,161 -> 486,161 -> 486,159 -> 486,161
485,85 -> 485,88 -> 482,88 -> 482,93 -> 499,93 -> 499,88 -> 491,88 -> 491,85
485,22 -> 489,22
487,129 -> 492,129
477,148 -> 477,138 -> 477,148 -> 479,148 -> 479,144 -> 479,148 -> 481,148 -> 481,146 -> 481,148
471,109 -> 471,112 -> 467,112 -> 467,120 -> 477,120 -> 477,112 -> 475,112 -> 475,109
457,106 -> 457,99 -> 457,106 -> 459,106 -> 459,98 -> 459,106 -> 461,106 -> 461,97 -> 461,106 -> 463,106 -> 463,105 -> 463,106 -> 465,106 -> 465,99 -> 465,106 -> 467,106 -> 467,103 -> 467,106 -> 469,106 -> 469,101 -> 469,106 -> 471,106 -> 471,103 -> 471,106 -> 473,106 -> 473,100 -> 473,106
485,85 -> 485,88 -> 482,88 -> 482,93 -> 499,93 -> 499,88 -> 491,88 -> 491,85
457,106 -> 457,99 -> 457,106 -> 459,106 -> 459,98 -> 459,106 -> 461,106 -> 461,97 -> 461,106 -> 463,106 -> 463,105 -> 463,106 -> 465,106 -> 465,99 -> 465,106 -> 467,106 -> 467,103 -> 467,106 -> 469,106 -> 469,101 -> 469,106 -> 471,106 -> 471,103 -> 471,106 -> 473,106 -> 473,100 -> 473,106
457,106 -> 457,99 -> 457,106 -> 459,106 -> 459,98 -> 459,106 -> 461,106 -> 461,97 -> 461,106 -> 463,106 -> 463,105 -> 463,106 -> 465,106 -> 465,99 -> 465,106 -> 467,106 -> 467,103 -> 467,106 -> 469,106 -> 469,101 -> 469,106 -> 471,106 -> 471,103 -> 471,106 -> 473,106 -> 473,100 -> 473,106
488,24 -> 492,24
490,51 -> 490,54 -> 486,54 -> 486,59 -> 499,59 -> 499,54 -> 492,54 -> 492,51
472,79 -> 472,73 -> 472,79 -> 474,79 -> 474,69 -> 474,79 -> 476,79 -> 476,77 -> 476,79
476,161 -> 476,156 -> 476,161 -> 478,161 -> 478,160 -> 478,161 -> 480,161 -> 480,154 -> 480,161 -> 482,161 -> 482,155 -> 482,161 -> 484,161 -> 484,158 -> 484,161 -> 486,161 -> 486,159 -> 486,161
485,85 -> 485,88 -> 482,88 -> 482,93 -> 499,93 -> 499,88 -> 491,88 -> 491,85
472,79 -> 472,73 -> 472,79 -> 474,79 -> 474,69 -> 474,79 -> 476,79 -> 476,77 -> 476,79
477,148 -> 477,138 -> 477,148 -> 479,148 -> 479,144 -> 479,148 -> 481,148 -> 481,146 -> 481,148
457,106 -> 457,99 -> 457,106 -> 459,106 -> 459,98 -> 459,106 -> 461,106 -> 461,97 -> 461,106 -> 463,106 -> 463,105 -> 463,106 -> 465,106 -> 465,99 -> 465,106 -> 467,106 -> 467,103 -> 467,106 -> 469,106 -> 469,101 -> 469,106 -> 471,106 -> 471,103 -> 471,106 -> 473,106 -> 473,100 -> 473,106
510,29 -> 510,33 -> 506,33 -> 506,39 -> 517,39 -> 517,33 -> 512,33 -> 512,29
495,135 -> 500,135
471,109 -> 471,112 -> 467,112 -> 467,120 -> 477,120 -> 477,112 -> 475,112 -> 475,109
510,29 -> 510,33 -> 506,33 -> 506,39 -> 517,39 -> 517,33 -> 512,33 -> 512,29
457,106 -> 457,99 -> 457,106 -> 459,106 -> 459,98 -> 459,106 -> 461,106 -> 461,97 -> 461,106 -> 463,106 -> 463,105 -> 463,106 -> 465,106 -> 465,99 -> 465,106 -> 467,106 -> 467,103 -> 467,106 -> 469,106 -> 469,101 -> 469,106 -> 471,106 -> 471,103 -> 471,106 -> 473,106 -> 473,100 -> 473,106
457,106 -> 457,99 -> 457,106 -> 459,106 -> 459,98 -> 459,106 -> 461,106 -> 461,97 -> 461,106 -> 463,106 -> 463,105 -> 463,106 -> 465,106 -> 465,99 -> 465,106 -> 467,106 -> 467,103 -> 467,106 -> 469,106 -> 469,101 -> 469,106 -> 471,106 -> 471,103 -> 471,106 -> 473,106 -> 473,100 -> 473,106
471,109 -> 471,112 -> 467,112 -> 467,120 -> 477,120 -> 477,112 -> 475,112 -> 475,109
482,24 -> 486,24
471,109 -> 471,112 -> 467,112 -> 467,120 -> 477,120 -> 477,112 -> 475,112 -> 475,109
510,29 -> 510,33 -> 506,33 -> 506,39 -> 517,39 -> 517,33 -> 512,33 -> 512,29
457,106 -> 457,99 -> 457,106 -> 459,106 -> 459,98 -> 459,106 -> 461,106 -> 461,97 -> 461,106 -> 463,106 -> 463,105 -> 463,106 -> 465,106 -> 465,99 -> 465,106 -> 467,106 -> 467,103 -> 467,106 -> 469,106 -> 469,101 -> 469,106 -> 471,106 -> 471,103 -> 471,106 -> 473,106 -> 473,100 -> 473,106
491,26 -> 495,26
470,122 -> 470,123 -> 485,123 -> 485,122
505,17 -> 510,17
470,122 -> 470,123 -> 485,123 -> 485,122
510,29 -> 510,33 -> 506,33 -> 506,39 -> 517,39 -> 517,33 -> 512,33 -> 512,29
485,26 -> 489,26
471,109 -> 471,112 -> 467,112 -> 467,120 -> 477,120 -> 477,112 -> 475,112 -> 475,109
457,106 -> 457,99 -> 457,106 -> 459,106 -> 459,98 -> 459,106 -> 461,106 -> 461,97 -> 461,106 -> 463,106 -> 463,105 -> 463,106 -> 465,106 -> 465,99 -> 465,106 -> 467,106 -> 467,103 -> 467,106 -> 469,106 -> 469,101 -> 469,106 -> 471,106 -> 471,103 -> 471,106 -> 473,106 -> 473,100 -> 473,106
471,109 -> 471,112 -> 467,112 -> 467,120 -> 477,120 -> 477,112 -> 475,112 -> 475,109
457,106 -> 457,99 -> 457,106 -> 459,106 -> 459,98 -> 459,106 -> 461,106 -> 461,97 -> 461,106 -> 463,106 -> 463,105 -> 463,106 -> 465,106 -> 465,99 -> 465,106 -> 467,106 -> 467,103 -> 467,106 -> 469,106 -> 469,101 -> 469,106 -> 471,106 -> 471,103 -> 471,106 -> 473,106 -> 473,100 -> 473,106
485,85 -> 485,88 -> 482,88 -> 482,93 -> 499,93 -> 499,88 -> 491,88 -> 491,85
457,106 -> 457,99 -> 457,106 -> 459,106 -> 459,98 -> 459,106 -> 461,106 -> 461,97 -> 461,106 -> 463,106 -> 463,105 -> 463,106 -> 465,106 -> 465,99 -> 465,106 -> 467,106 -> 467,103 -> 467,106 -> 469,106 -> 469,101 -> 469,106 -> 471,106 -> 471,103 -> 471,106 -> 473,106 -> 473,100 -> 473,106
472,79 -> 472,73 -> 472,79 -> 474,79 -> 474,69 -> 474,79 -> 476,79 -> 476,77 -> 476,79
510,29 -> 510,33 -> 506,33 -> 506,39 -> 517,39 -> 517,33 -> 512,33 -> 512,29
467,81 -> 467,82 -> 487,82 -> 487,81
479,26 -> 483,26
492,48 -> 506,48 -> 506,47
457,106 -> 457,99 -> 457,106 -> 459,106 -> 459,98 -> 459,106 -> 461,106 -> 461,97 -> 461,106 -> 463,106 -> 463,105 -> 463,106 -> 465,106 -> 465,99 -> 465,106 -> 467,106 -> 467,103 -> 467,106 -> 469,106 -> 469,101 -> 469,106 -> 471,106 -> 471,103 -> 471,106 -> 473,106 -> 473,100 -> 473,106
476,161 -> 476,156 -> 476,161 -> 478,161 -> 478,160 -> 478,161 -> 480,161 -> 480,154 -> 480,161 -> 482,161 -> 482,155 -> 482,161 -> 484,161 -> 484,158 -> 484,161 -> 486,161 -> 486,159 -> 486,161
490,51 -> 490,54 -> 486,54 -> 486,59 -> 499,59 -> 499,54 -> 492,54 -> 492,51
482,62 -> 487,62
476,161 -> 476,156 -> 476,161 -> 478,161 -> 478,160 -> 478,161 -> 480,161 -> 480,154 -> 480,161 -> 482,161 -> 482,155 -> 482,161 -> 484,161 -> 484,158 -> 484,161 -> 486,161 -> 486,159 -> 486,161
490,51 -> 490,54 -> 486,54 -> 486,59 -> 499,59 -> 499,54 -> 492,54 -> 492,51
457,106 -> 457,99 -> 457,106 -> 459,106 -> 459,98 -> 459,106 -> 461,106 -> 461,97 -> 461,106 -> 463,106 -> 463,105 -> 463,106 -> 465,106 -> 465,99 -> 465,106 -> 467,106 -> 467,103 -> 467,106 -> 469,106 -> 469,101 -> 469,106 -> 471,106 -> 471,103 -> 471,106 -> 473,106 -> 473,100 -> 473,106
"""
}
