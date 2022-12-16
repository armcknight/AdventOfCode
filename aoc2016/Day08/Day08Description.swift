//
//  Day08Description.swift
//  aoc2016
//
//  Created by Andrew McKnight on Dec 4, 2022.
//

/**
## --- Day 8: Two-Factor Authentication ---

You come across a door implementing what you can only assume is an
implementation of [two-factor
authentication](https://en.wikipedia.org/wiki/Multi-factor_authentication)
after a long game of
[requirements](https://en.wikipedia.org/wiki/Requirement)
[telephone](https://en.wikipedia.org/wiki/Chinese_whispers).

To get past the door, you first swipe a keycard (no problem; there was
one on a nearby desk). Then, it displays a code on a [little
screen](https://www.google.com/search?q=tiny+lcd&tbm=isch), and you type
that code on a keypad. Then, presumably, the door unlocks.

Unfortunately, the screen has been <span
title="BUT BY WHOM?!">smashed</span>. After a few minutes, you've taken
everything apart and figured out how it works. Now you just have to work
out what the screen *would* have displayed.

The magnetic strip on the card you swiped encodes a series of
instructions for the screen; these instructions are your puzzle input.
The screen is *`50` pixels wide and `6` pixels tall*, all of which start
*off*, and is capable of three somewhat peculiar operations:

-   `rect AxB` turns *on* all of the pixels in a rectangle at the
top-left of the screen which is `A` wide and `B` tall.
-   `rotate row y=A by B` shifts all of the pixels in row `A` (0 is the
top row) *right* by `B` pixels. Pixels that would fall off the right
end appear at the left end of the row.
-   `rotate column x=A by B` shifts all of the pixels in column `A` (0
is the left column) *down* by `B` pixels. Pixels that would fall off
the bottom appear at the top of the column.

For example, here is a simple sequence on a smaller screen:

-   `rect 3x2` creates a small rectangle in the top-left corner:

###....
###....
.......

-   `rotate column x=1 by 1` rotates the second column down by one
pixel:

#.#....
###....
.#.....

-   `rotate row y=0 by 4` rotates the top row right by four pixels:

....#.#
###....
.#.....

-   `rotate column x=1 by 1` again rotates the second column down by one
pixel, causing the bottom pixel to wrap back to the top:

.#..#.#
#.#....
.#.....

As you can see, this display technology is extremely powerful, and will
soon dominate the tiny-code-displaying-screen market. That's what the
advertisement on the back of the display tries to convince you, anyway.

There seems to be an intermediate check of the voltage used by the
display: after you swipe your card, if the screen did work, *how many
pixels should be lit?*

*/
public enum Day08: String {
case sample = """
0
"""

case input = """
rect 1x1
rotate row y=0 by 5
rect 1x1
rotate row y=0 by 6
rect 1x1
rotate row y=0 by 5
rect 1x1
rotate row y=0 by 2
rect 1x1
rotate row y=0 by 5
rect 2x1
rotate row y=0 by 2
rect 1x1
rotate row y=0 by 4
rect 1x1
rotate row y=0 by 3
rect 2x1
rotate row y=0 by 7
rect 3x1
rotate row y=0 by 3
rect 1x1
rotate row y=0 by 3
rect 1x2
rotate row y=1 by 13
rotate column x=0 by 1
rect 2x1
rotate row y=0 by 5
rotate column x=0 by 1
rect 3x1
rotate row y=0 by 18
rotate column x=13 by 1
rotate column x=7 by 2
rotate column x=2 by 3
rotate column x=0 by 1
rect 17x1
rotate row y=3 by 13
rotate row y=1 by 37
rotate row y=0 by 11
rotate column x=7 by 1
rotate column x=6 by 1
rotate column x=4 by 1
rotate column x=0 by 1
rect 10x1
rotate row y=2 by 37
rotate column x=19 by 2
rotate column x=9 by 2
rotate row y=3 by 5
rotate row y=2 by 1
rotate row y=1 by 4
rotate row y=0 by 4
rect 1x4
rotate column x=25 by 3
rotate row y=3 by 5
rotate row y=2 by 2
rotate row y=1 by 1
rotate row y=0 by 1
rect 1x5
rotate row y=2 by 10
rotate column x=39 by 1
rotate column x=35 by 1
rotate column x=29 by 1
rotate column x=19 by 1
rotate column x=7 by 2
rotate row y=4 by 22
rotate row y=3 by 5
rotate row y=1 by 21
rotate row y=0 by 10
rotate column x=2 by 2
rotate column x=0 by 2
rect 4x2
rotate column x=46 by 2
rotate column x=44 by 2
rotate column x=42 by 1
rotate column x=41 by 1
rotate column x=40 by 2
rotate column x=38 by 2
rotate column x=37 by 3
rotate column x=35 by 1
rotate column x=33 by 2
rotate column x=32 by 1
rotate column x=31 by 2
rotate column x=30 by 1
rotate column x=28 by 1
rotate column x=27 by 3
rotate column x=26 by 1
rotate column x=23 by 2
rotate column x=22 by 1
rotate column x=21 by 1
rotate column x=20 by 1
rotate column x=19 by 1
rotate column x=18 by 2
rotate column x=16 by 2
rotate column x=15 by 1
rotate column x=13 by 1
rotate column x=12 by 1
rotate column x=11 by 1
rotate column x=10 by 1
rotate column x=7 by 1
rotate column x=6 by 1
rotate column x=5 by 1
rotate column x=3 by 2
rotate column x=2 by 1
rotate column x=1 by 1
rotate column x=0 by 1
rect 49x1
rotate row y=2 by 34
rotate column x=44 by 1
rotate column x=40 by 2
rotate column x=39 by 1
rotate column x=35 by 4
rotate column x=34 by 1
rotate column x=30 by 4
rotate column x=29 by 1
rotate column x=24 by 1
rotate column x=15 by 4
rotate column x=14 by 1
rotate column x=13 by 3
rotate column x=10 by 4
rotate column x=9 by 1
rotate column x=5 by 4
rotate column x=4 by 3
rotate row y=5 by 20
rotate row y=4 by 20
rotate row y=3 by 48
rotate row y=2 by 20
rotate row y=1 by 41
rotate column x=47 by 5
rotate column x=46 by 5
rotate column x=45 by 4
rotate column x=43 by 5
rotate column x=41 by 5
rotate column x=33 by 1
rotate column x=32 by 3
rotate column x=23 by 5
rotate column x=22 by 1
rotate column x=21 by 2
rotate column x=18 by 2
rotate column x=17 by 3
rotate column x=16 by 2
rotate column x=13 by 5
rotate column x=12 by 5
rotate column x=11 by 5
rotate column x=3 by 5
rotate column x=2 by 5
rotate column x=1 by 5
"""
}
