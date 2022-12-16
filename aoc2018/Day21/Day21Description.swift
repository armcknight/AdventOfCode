//
//  Day21Description.swift
//  aoc2018
//
//  Created by Andrew McKnight on Dec 4, 2022.
//

/**
## --- Day 21: Chronal Conversion ---

You should have been watching where you were going, because as you
wander the new North Pole base, you trip and fall into a very deep hole!

<span title="The old time travel hole gag! Classic.">Just
kidding.</span> You're falling through time again.

If you keep up your current pace, you should have resolved all of the
temporal anomalies by the next time the device activates. Since you have
very little interest in browsing history in 500-year increments for the
rest of your life, you need to find a way to get back to your present
time.

After a little research, you discover two important facts about the
behavior of the device:

First, you discover that the device is hard-wired to always send you
back in time in 500-year increments. Changing this is probably not
feasible.

Second, you discover the *activation system* (your puzzle input) for the
time travel module. Currently, it appears to *run forever without
halting*.

If you can cause the activation system to *halt* at a specific moment,
maybe you can make the device send you so far back in time that you
cause an [integer
underflow](https://cwe.mitre.org/data/definitions/191.html) *in time
itself* and wrap around back to your current time!

The device executes the program as specified in [manual section one](16)
and [manual section two](19).

Your goal is to figure out how the program works and cause it to halt.
You can only control *register `0`*; every other register begins at `0`
as usual.

Because time travel is a dangerous activity, the activation system
begins with a few instructions which verify that *bitwise AND* (via
`bani`) does a *numeric* operation and *not* an operation as if the
inputs were interpreted as strings. If the test fails, it enters an
infinite loop re-running the test instead of allowing the program to
execute normally. If the test passes, the program continues, and assumes
that *all other bitwise operations* (`banr`, `bori`, and `borr`) also
interpret their inputs as *numbers*. (Clearly, the Elves who wrote this
system were worried that someone might introduce a bug while trying to
emulate this system with a scripting language.)

*What is the lowest non-negative integer value for register `0` that
causes the program to halt after executing the fewest instructions?*
(Executing the same instruction multiple times counts as multiple
instructions executed.)

*/
public enum Day21: String {
case sample = """
"""

case input = """
#ip 1
seti 123 0 4
bani 4 456 4
eqri 4 72 4
addr 4 1 1
seti 0 0 1
seti 0 0 4
bori 4 65536 5
seti 10704114 0 4
bani 5 255 2
addr 4 2 4
bani 4 16777215 4
muli 4 65899 4
bani 4 16777215 4
gtir 256 5 2
addr 2 1 1
addi 1 1 1
seti 27 2 1
seti 0 4 2
addi 2 1 3
muli 3 256 3
gtrr 3 5 3
addr 3 1 1
addi 1 1 1
seti 25 5 1
addi 2 1 2
seti 17 5 1
setr 2 6 5
seti 7 8 1
eqrr 4 0 2
addr 2 1 1
seti 5 3 1
"""
}
