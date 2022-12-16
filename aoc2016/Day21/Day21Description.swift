//
//  Day21Description.swift
//  aoc2016
//
//  Created by Andrew McKnight on Dec 4, 2022.
//

/**
## --- Day 21: Scrambled Letters and Hash ---

The computer system you're breaking into uses a <span
title="I do not like them, Security-Account-Manager-I-Am! I do not like scrambled letters and hash!">weird
scrambling function</span> to store its passwords. It shouldn't be much
trouble to create your own scrambled password so you can add it to the
system; you just have to implement the scrambler.

The scrambling function is a series of operations (the exact list is
provided in your puzzle input). Starting with the password to be
scrambled, apply each operation in succession to the string. The
individual operations behave as follows:

-   `swap position X with position Y` means that the letters at indexes
`X` and `Y` (counting from `0`) should be *swapped*.
-   `swap letter X with letter Y` means that the letters `X` and `Y`
should be *swapped* (regardless of where they appear in the string).
-   `rotate left/right X steps` means that the whole string should be
*rotated*; for example, one right rotation would turn `abcd` into
`dabc`.
-   `rotate based on position of letter X` means that the whole string
should be *rotated to the right* based on the *index* of letter `X`
(counting from `0`) as determined *before* this instruction does any
rotations. Once the index is determined, rotate the string to the
right one time, plus a number of times equal to that index, plus one
additional time if the index was at least `4`.
-   `reverse positions X through Y` means that the span of letters at
indexes `X` through `Y` (including the letters at `X` and `Y`)
should be *reversed in order*.
-   `move position X to position Y` means that the letter which is at
index `X` should be *removed* from the string, then *inserted* such
that it ends up at index `Y`.

For example, suppose you start with `abcde` and perform the following
operations:

-   `swap position 4 with position 0` swaps the first and last letters,
producing the input for the next step, `ebcda`.
-   `swap letter d with letter b` swaps the positions of `d` and `b`:
`edcba`.
-   `reverse positions 0 through 4` causes the entire string to be
reversed, producing `abcde`.
-   `rotate left 1 step` shifts all letters left one position, causing
the first letter to wrap to the end of the string: `bcdea`.
-   `move position 1 to position 4` removes the letter at position `1`
(`c`), then inserts it at position `4` (the end of the string):
`bdeac`.
-   `move position 3 to position 0` removes the letter at position `3`
(`a`), then inserts it at position `0` (the front of the string):
`abdec`.
-   `rotate based on position of letter b` finds the index of letter `b`
(`1`), then rotates the string right once plus a number of times
equal to that index (`2`): `ecabd`.
-   `rotate based on position of letter d` finds the index of letter `d`
(`4`), then rotates the string right once, plus a number of times
equal to that index, plus an additional time because the index was
at least `4`, for a total of `6` right rotations: `decab`.

After these steps, the resulting scrambled password is `decab`.

Now, you just need to generate a new scrambled password and you can
access the system. Given the list of scrambling operations in your
puzzle input, *what is the result of scrambling `abcdefgh`*?

*/
public enum Day21: String {
case sample = """
wap position X with position Y
"""

case input = """
swap letter a with letter d
move position 6 to position 4
move position 5 to position 1
swap letter h with letter e
rotate based on position of letter a
move position 6 to position 2
reverse positions 0 through 1
rotate based on position of letter h
rotate based on position of letter g
rotate based on position of letter h
reverse positions 4 through 7
swap letter a with letter f
swap position 2 with position 7
move position 7 to position 5
reverse positions 0 through 5
rotate based on position of letter f
rotate right 4 steps
swap position 3 with position 0
move position 1 to position 2
reverse positions 4 through 6
swap position 3 with position 5
swap letter a with letter c
swap position 5 with position 2
swap position 7 with position 2
move position 2 to position 5
rotate based on position of letter h
rotate right 2 steps
swap position 3 with position 4
move position 0 to position 1
reverse positions 1 through 7
reverse positions 1 through 4
rotate based on position of letter b
rotate right 7 steps
rotate left 0 steps
swap position 6 with position 1
reverse positions 1 through 3
reverse positions 0 through 3
move position 0 to position 4
rotate based on position of letter f
reverse positions 0 through 7
reverse positions 0 through 1
move position 1 to position 7
move position 7 to position 6
rotate based on position of letter b
reverse positions 3 through 5
reverse positions 0 through 3
swap letter c with letter h
reverse positions 3 through 5
swap position 3 with position 6
swap letter d with letter g
move position 5 to position 6
swap position 6 with position 2
rotate right 5 steps
swap letter e with letter g
rotate based on position of letter e
rotate based on position of letter c
swap letter g with letter e
rotate based on position of letter b
rotate based on position of letter b
swap position 0 with position 2
move position 6 to position 0
move position 5 to position 0
rotate left 2 steps
move position 0 to position 5
rotate left 7 steps
swap letter b with letter g
rotate based on position of letter d
swap letter h with letter e
swap letter d with letter c
rotate based on position of letter f
move position 5 to position 0
rotate left 5 steps
swap position 0 with position 7
swap position 0 with position 3
rotate left 4 steps
rotate left 1 step
rotate right 6 steps
swap position 0 with position 1
reverse positions 4 through 6
reverse positions 4 through 6
move position 6 to position 3
move position 7 to position 4
rotate right 4 steps
swap letter g with letter d
swap letter c with letter e
swap letter e with letter h
rotate right 5 steps
rotate based on position of letter g
rotate based on position of letter g
rotate left 3 steps
swap letter h with letter g
reverse positions 0 through 4
rotate right 4 steps
move position 6 to position 4
rotate based on position of letter c
swap position 2 with position 6
swap position 7 with position 2
rotate right 1 step
swap position 3 with position 1
swap position 4 with position 6
"""
}
