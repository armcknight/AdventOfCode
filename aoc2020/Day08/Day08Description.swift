//
//  Day08Description.swift
//  aoc2020
//
//  Created by Andrew McKnight on Dec 4, 2022.
//

/**
## --- Day 8: Handheld Halting ---

Your flight to the major airline hub reaches cruising altitude without
incident. While you consider checking the in-flight menu for one of
those drinks that come with a little umbrella, you are interrupted by
the kid sitting next to you.

Their <a href="https://en.wikipedia.org/wiki/Handheld_game_console"
target="_blank">handheld game console</a> won't turn on! They ask if you
can take a look.

You narrow the problem down to a strange *infinite loop* in the <span
title="A trendy new line of encrypted footwear?">boot code</span> (your
puzzle input) of the device. You should be able to fix it, but first you
need to be able to run the code in isolation.

The boot code is represented as a text file with one *instruction* per
line of text. Each instruction consists of an *operation* (`acc`, `jmp`,
or `nop`) and an *argument* (a signed number like `+4` or `-20`).

-   `acc` increases or decreases a single global value called the
*accumulator* by the value given in the argument. For example,
`acc +7` would increase the accumulator by 7. The accumulator starts
at `0`. After an `acc` instruction, the instruction immediately
below it is executed next.
-   `jmp` *jumps* to a new instruction relative to itself. The next
instruction to execute is found using the argument as an *offset*
from the `jmp` instruction; for example, `jmp +2` would skip the
next instruction, `jmp +1` would continue to the instruction
immediately below it, and `jmp -20` would cause the instruction 20
lines above to be executed next.
-   `nop` stands for *No OPeration* - it does nothing. The instruction
immediately below it is executed next.

For example, consider the following program:

nop +0
acc +1
jmp +4
acc +3
jmp -3
acc -99
acc +1
jmp -4
acc +6

These instructions are visited in this order:

nop +0  | 1
acc +1  | 2, 8(!)
jmp +4  | 3
acc +3  | 6
jmp -3  | 7
acc -99 |
acc +1  | 4
jmp -4  | 5
acc +6  |

First, the `nop +0` does nothing. Then, the accumulator is increased
from 0 to 1 (`acc +1`) and `jmp +4` sets the next instruction to the
other `acc +1` near the bottom. After it increases the accumulator from
1 to 2, `jmp -4` executes, setting the next instruction to the only
`acc +3`. It sets the accumulator to 5, and `jmp -3` causes the program
to continue back at the first `acc +1`.

This is an *infinite loop*: with this sequence of jumps, the program
will run forever. The moment the program tries to run any instruction a
second time, you know it will never terminate.

Immediately *before* the program would run an instruction a second time,
the value in the accumulator is *`5`*.

Run your copy of the boot code. Immediately before any instruction is
executed a second time, *what value is in the accumulator?*

 Your puzzle answer was 1087.

 --- Part Two ---

 After some careful analysis, you believe that exactly one instruction is corrupted.

 Somewhere in the program, either a jmp is supposed to be a nop, or a nop is supposed to be a jmp. (No acc instructions were harmed in the corruption of this boot code.)

 The program is supposed to terminate by attempting to execute an instruction immediately after the last instruction in the file. By changing exactly one jmp or nop, you can repair the boot code and make it terminate correctly.

 For example, consider the same program from above:

 nop +0
 acc +1
 jmp +4
 acc +3
 jmp -3
 acc -99
 acc +1
 jmp -4
 acc +6
 If you change the first instruction from nop +0 to jmp +0, it would create a single-instruction infinite loop, never leaving that instruction. If you change almost any of the jmp instructions, the program will still eventually find another jmp instruction and loop forever.

 However, if you change the second-to-last instruction (from jmp -4 to nop -4), the program terminates! The instructions are visited in this order:

 nop +0  | 1
 acc +1  | 2
 jmp +4  | 3
 acc +3  |
 jmp -3  |
 acc -99 |
 acc +1  | 4
 nop -4  | 5
 acc +6  | 6
 After the last instruction (acc +6), the program terminates by attempting to run the instruction below the last instruction in the file. With this change, after the program terminates, the accumulator contains the value 8 (acc +1, acc +1, acc +6).

 Fix the program so that it terminates normally by changing exactly one jmp (to nop) or nop (to jmp). What is the value of the accumulator after the program terminates?

 Your puzzle answer was 780.

*/
public enum Day08: String {
case sample = """
nop +0
acc +1
jmp +4
acc +3
jmp -3
acc -99
acc +1
jmp -4
acc +6
"""

case input = """
nop +456
nop +38
acc +9
jmp +153
acc +15
nop +560
jmp +452
acc +26
acc +42
jmp +376
acc -5
acc +12
acc -5
jmp +15
jmp +1
acc -9
jmp +533
acc +19
acc +33
acc +34
jmp -6
nop +404
nop +140
acc +0
jmp +123
acc +45
acc +0
jmp +496
jmp +487
acc +9
acc +34
jmp +484
acc +0
acc -14
jmp +466
acc +40
acc +6
acc +30
jmp +444
nop +386
jmp +215
acc +43
acc +5
nop -4
jmp +535
jmp -13
acc +3
acc +7
acc +49
acc -1
jmp +245
acc +9
acc +31
nop +142
jmp +554
acc +3
jmp +493
nop +399
jmp +232
acc -16
acc +33
jmp +410
acc +33
acc +5
acc -17
jmp +272
acc -3
acc +37
jmp +181
jmp -12
nop +344
acc +5
acc -16
jmp +290
nop +530
acc +15
acc +3
jmp +343
acc +2
acc +19
jmp +298
acc +43
acc +25
acc -19
jmp +439
acc +43
acc +45
acc +20
jmp +355
acc +13
acc +24
acc -15
nop +396
jmp +215
acc -7
acc +17
jmp +441
acc -8
acc -19
jmp +505
jmp +282
acc -17
acc -8
acc +20
jmp +359
acc +26
acc +14
acc +47
acc +3
jmp +298
acc +31
nop +205
acc +0
acc +7
jmp +389
acc -5
acc +47
jmp +94
acc -13
jmp +358
acc -13
jmp +134
acc +8
acc -19
jmp +312
acc +43
acc +17
jmp +97
jmp +48
nop +253
acc +48
acc -7
acc -2
jmp +23
acc +26
acc +14
acc -14
acc +17
jmp +18
acc +14
acc +8
jmp +341
acc +35
jmp +227
acc +15
acc -7
jmp -95
acc -19
jmp -59
jmp -31
acc -6
acc -4
acc +24
jmp +84
acc -15
jmp +82
nop +74
acc +8
acc +9
acc +13
jmp +194
jmp +376
acc +34
nop -16
jmp -90
acc +4
acc +43
nop +215
jmp -147
acc +0
acc +11
acc -15
acc +23
jmp +130
acc +40
jmp +106
acc -4
acc -18
acc +18
nop +329
jmp +230
acc +19
nop +172
acc +43
jmp +304
acc +44
nop +213
nop +195
acc +6
jmp -79
acc +41
acc -11
acc +18
acc -9
jmp -25
acc +27
acc -6
acc +31
jmp -56
acc +5
acc +12
acc +32
acc +34
jmp -189
acc +32
acc +5
acc -16
jmp +301
nop +108
nop -108
jmp -141
acc -12
jmp +273
acc +3
jmp +140
acc +7
acc -11
acc -17
nop +194
jmp -122
acc -14
nop +186
acc +24
jmp +277
nop +341
acc +18
jmp -64
acc +45
acc +42
jmp +52
acc +39
nop +91
nop -8
jmp +217
acc +44
acc +15
jmp +72
acc +24
jmp -231
acc -16
nop +55
nop +262
acc +40
jmp +234
jmp -14
acc +31
nop -177
acc +40
jmp +343
acc -8
jmp -169
acc +30
acc +12
acc -11
jmp +41
acc +9
acc -9
jmp +65
acc +38
acc +14
jmp +335
acc -19
acc +38
acc +16
acc -11
jmp +230
jmp -71
acc +48
acc -13
nop -255
jmp +1
jmp -220
acc +2
jmp +157
jmp -105
acc -16
acc -5
jmp -196
acc +30
jmp +139
jmp +83
acc -3
acc -12
jmp +254
jmp -60
acc +33
jmp -37
acc +17
acc -14
jmp +93
nop +178
acc +38
acc +47
jmp -89
jmp +271
acc +43
acc +32
jmp -240
acc +26
acc +32
acc +30
nop +284
jmp +169
acc -7
acc +37
jmp +102
acc +4
jmp +86
jmp -123
acc +0
acc -14
acc +18
jmp +1
jmp -5
jmp -36
jmp +148
acc -17
acc -14
acc +28
acc +15
jmp +79
jmp -289
acc +42
acc -5
acc +13
jmp +240
acc -10
acc -18
acc -16
jmp +103
acc +21
jmp +32
nop +118
acc +22
acc -16
acc +15
jmp -186
acc -2
acc -14
acc +22
acc +16
jmp +73
acc -6
jmp -225
acc -18
nop +113
acc +50
acc -6
jmp +181
acc +41
jmp +1
nop +92
acc +23
jmp +190
acc +39
acc +0
acc +33
jmp +111
nop -63
nop -81
acc +9
acc +35
jmp +50
acc +11
jmp -295
nop +230
acc +34
acc +12
acc +47
jmp +126
acc +0
nop -1
acc +19
acc -16
jmp -360
acc +29
acc -2
jmp -110
acc +2
acc +50
jmp -36
jmp -107
jmp +178
acc -11
jmp +181
nop +115
nop +186
jmp +95
jmp +1
nop +148
acc +2
acc +49
jmp +173
acc +38
jmp +178
acc +28
acc +6
acc +15
jmp +110
acc +49
nop +100
jmp +57
acc +45
nop +65
acc +43
acc +12
jmp -272
jmp -260
nop +100
jmp -224
jmp +142
jmp +52
jmp -34
jmp -110
acc +35
nop -112
jmp +16
jmp -18
jmp -157
jmp +81
acc +1
jmp -107
acc +16
acc +23
jmp -255
acc +22
jmp +42
nop +168
acc +41
jmp -311
jmp -163
jmp +118
nop +4
acc +18
jmp +54
jmp -414
nop -181
acc +10
acc +23
jmp -321
nop -322
acc -9
jmp +101
nop -7
acc +35
acc +46
jmp -312
nop +64
nop -386
jmp -280
acc +16
jmp -156
acc +13
nop -131
jmp +1
jmp -416
jmp +15
jmp -94
jmp -330
nop +93
nop -205
acc +48
jmp -19
jmp -70
nop +21
acc -5
acc +19
jmp +62
acc +22
jmp -448
jmp -77
acc +26
acc -2
jmp +70
acc -2
acc +21
jmp -195
nop -114
jmp +107
acc +37
acc +6
jmp -436
acc +48
jmp +96
jmp -121
acc +0
jmp -74
jmp +1
acc +27
acc +2
jmp -279
acc +7
acc +0
jmp +1
jmp -413
acc +6
jmp -180
acc +18
acc +10
jmp -437
jmp -338
nop -456
jmp -463
acc +1
nop -54
jmp -168
acc +27
jmp -479
acc +42
jmp -408
jmp +85
acc -16
acc +24
jmp -391
jmp -206
nop +8
jmp +1
acc +38
nop -473
jmp -94
acc +10
acc -14
jmp -425
acc +17
nop -208
acc +39
jmp -265
acc +3
jmp -284
acc +19
acc +5
nop -111
acc +22
jmp -309
acc +12
acc +39
jmp -151
acc +33
acc -14
jmp -450
acc +16
nop +50
jmp -188
acc -13
acc +15
acc +4
jmp -484
acc +27
jmp -98
acc +34
jmp -120
jmp -537
acc +43
acc -8
acc -6
jmp -405
acc -8
nop -179
acc -11
jmp -264
acc +24
jmp -280
acc -6
acc +1
jmp -353
acc -18
jmp -58
acc +1
acc -7
acc -2
acc +44
jmp -115
nop -328
acc +27
acc +2
jmp +20
acc +14
acc +34
jmp -460
nop -445
acc -9
acc +24
acc -11
jmp -72
jmp -434
jmp -370
acc +35
acc +43
acc +45
acc +44
jmp -287
jmp -546
nop -474
acc -6
jmp -357
nop -163
nop -218
nop -342
jmp -570
acc +44
acc +4
acc +35
acc +6
jmp -541
jmp -274
acc +48
acc -18
jmp -171
acc -13
acc -14
acc +25
acc +26
jmp +1
"""
}
