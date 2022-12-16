//
//  Day22Description.swift
//  aoc2019
//
//  Created by Andrew McKnight on Dec 4, 2022.
//

/**
## --- Day 22: Slam Shuffle ---

There isn't much to do while you wait for the droids to repair your
ship. At least you're drifting in the right direction. You decide to
practice a new [card shuffle](https://en.wikipedia.org/wiki/Shuffling)
you've been working on.

Digging through the ship's storage, you find a deck of *space cards*!
Just like <span
title="What do you mean, you've never heard of space cards? They're all the rage in Zozo.">any
deck of space cards</span>, there are 10007 cards in the deck numbered
`0` through `10006`. The deck must be new - they're still in *factory
order*, with `0` on the top, then `1`, then `2`, and so on, all the way
through to `10006` on the bottom.

You've been practicing three different *techniques* that you use while
shuffling. Suppose you have a deck of only 10 cards (numbered `0`
through `9`):

*To `deal into new stack`*, create a new stack of cards by dealing the
top card of the deck onto the top of the new stack repeatedly until you
run out of cards:

Top          Bottom
0 1 2 3 4 5 6 7 8 9   Your deck
New stack

1 2 3 4 5 6 7 8 9   Your deck
0   New stack

2 3 4 5 6 7 8 9   Your deck
1 0   New stack

3 4 5 6 7 8 9   Your deck
2 1 0   New stack

Several steps later...

9   Your deck
8 7 6 5 4 3 2 1 0   New stack

Your deck
9 8 7 6 5 4 3 2 1 0   New stack

Finally, pick up the new stack you've just created and use it as the
deck for the next technique.

*To `cut N` cards*, take the top `N` cards off the top of the deck and
move them as a single unit to the bottom of the deck, retaining their
order. For example, to `cut 3`:

Top          Bottom
0 1 2 3 4 5 6 7 8 9   Your deck

3 4 5 6 7 8 9   Your deck
0 1 2                 Cut cards

3 4 5 6 7 8 9         Your deck
0 1 2   Cut cards

3 4 5 6 7 8 9 0 1 2   Your deck

You've also been getting pretty good at a version of this technique
where `N` is negative! In that case, cut (the absolute value of) `N`
cards from the bottom of the deck onto the top. For example, to
`cut -4`:

Top          Bottom
0 1 2 3 4 5 6 7 8 9   Your deck

0 1 2 3 4 5           Your deck
6 7 8 9   Cut cards

0 1 2 3 4 5   Your deck
6 7 8 9               Cut cards

6 7 8 9 0 1 2 3 4 5   Your deck

*To `deal with increment N`*, start by clearing enough space on your
table to lay out all of the cards individually in a long line. Deal the
top card into the leftmost position. Then, move `N` positions to the
right and deal the next card there. If you would move into a position
past the end of the space on your table, wrap around and keep counting
from the leftmost card again. Continue this process until you run out of
cards.

For example, to `deal with increment 3`:

0 1 2 3 4 5 6 7 8 9   Your deck
. . . . . . . . . .   Space on table
^                     Current position

Deal the top card to the current position:

1 2 3 4 5 6 7 8 9   Your deck
0 . . . . . . . . .   Space on table
^                     Current position

Move the current position right 3:

1 2 3 4 5 6 7 8 9   Your deck
0 . . . . . . . . .   Space on table
^               Current position

Deal the top card:

2 3 4 5 6 7 8 9   Your deck
0 . . 1 . . . . . .   Space on table
^               Current position

Move right 3 and deal:

3 4 5 6 7 8 9   Your deck
0 . . 1 . . 2 . . .   Space on table
^         Current position

Move right 3 and deal:

4 5 6 7 8 9   Your deck
0 . . 1 . . 2 . . 3   Space on table
^   Current position

Move right 3, wrapping around, and deal:

5 6 7 8 9   Your deck
0 . 4 1 . . 2 . . 3   Space on table
^                 Current position

And so on:

0 7 4 1 8 5 2 9 6 3   Space on table

Positions on the table which already contain cards are still counted;
they're not skipped. Of course, this technique is carefully designed so
it will never put two cards in the same position or leave a position
empty.

Finally, collect the cards on the table so that the leftmost card ends
up at the top of your deck, the card to its right ends up just below the
top card, and so on, until the rightmost card ends up at the bottom of
the deck.

The complete shuffle process (your puzzle input) consists of applying
many of these techniques. Here are some examples that combine
techniques; they all start with a *factory order* deck of 10 cards:

deal with increment 7
deal into new stack
deal into new stack
Result: 0 3 6 9 2 5 8 1 4 7

cut 6
deal with increment 7
deal into new stack
Result: 3 0 7 4 1 8 5 2 9 6

deal with increment 7
deal with increment 9
cut -2
Result: 6 3 0 7 4 1 8 5 2 9

deal into new stack
cut -2
deal with increment 7
cut 8
cut -4
deal with increment 7
cut 3
deal with increment 9
deal with increment 3
cut -1
Result: 9 2 5 8 1 4 7 0 3 6

Positions within the deck count from `0` at the top, then `1` for the
card immediately below the top card, and so on to the bottom. (That is,
cards start in the position matching their number.)

After shuffling your *factory order* deck of 10007 cards, *what is the
position of card `2019`?*

*/
public enum Day22: String {
case sample = """
"""

case input = """
deal with increment 54
cut -667
deal with increment 15
cut -1826
deal with increment 55
cut -8444
deal with increment 44
cut 910
deal with increment 63
cut 4025
deal with increment 45
cut 6430
deal with increment 53
cut -3727
deal into new stack
deal with increment 6
cut -5464
deal into new stack
deal with increment 48
cut 6238
deal with increment 23
cut 8614
deal with increment 50
cut -987
deal with increment 26
cut -9808
deal with increment 47
cut -8088
deal with increment 5
deal into new stack
cut 5787
deal with increment 49
cut 795
deal with increment 2
cut -536
deal with increment 26
deal into new stack
cut -6327
deal with increment 63
cut 2511
deal with increment 38
cut -2622
deal into new stack
deal with increment 9
cut 8201
deal into new stack
deal with increment 48
cut -2470
deal with increment 19
cut 8669
deal into new stack
deal with increment 28
cut -2723
deal into new stack
deal with increment 15
cut -5101
deal into new stack
cut 464
deal with increment 68
cut 2695
deal with increment 53
cut -8523
deal with increment 32
cut -1018
deal with increment 66
cut 9127
deal with increment 3
deal into new stack
deal with increment 14
cut 725
deal into new stack
cut -2273
deal with increment 65
cut 6306
deal with increment 55
cut -6710
deal with increment 54
cut 7814
deal with increment 23
cut 8877
deal with increment 60
cut 3063
deal with increment 40
cut -2104
deal with increment 72
cut -4171
deal with increment 21
cut 7919
deal with increment 53
cut -3320
deal with increment 49
deal into new stack
cut -8201
deal into new stack
deal with increment 54
deal into new stack
cut 6321
deal with increment 50
cut 7244
deal with increment 23
"""
}
