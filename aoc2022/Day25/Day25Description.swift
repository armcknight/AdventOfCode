//
//  Day25Description.swift
//  aoc2022
//
//  Created by Andrew McKnight on Dec 4, 2022.
//

/**
## --- Day 25: Full of Hot Air ---

As the expedition finally reaches the extraction point, several large
<a href="https://en.wikipedia.org/wiki/Hot_air_balloon"
target="_blank">hot air balloons</a> drift down to meet you. Crews
quickly start unloading the equipment the balloons brought: many hot air
balloon kits, some fuel tanks, and a *fuel heating machine*.

The fuel heating machine is a new addition to the process. When this
mountain was a volcano, the ambient temperature was more reasonable;
now, it's so cold that the fuel won't work at all without being warmed
up first.

The Elves, seemingly in an attempt to make the new machine feel welcome,
have already attached a pair of
<a href="https://en.wikipedia.org/wiki/Googly_eyes"
target="_blank">googly eyes</a> and started calling it "Bob".

To heat the fuel, Bob needs to know the total amount of fuel that will
be processed ahead of time so it can correctly calibrate heat output and
flow rate. This amount is simply the *sum* of the fuel requirements of
all of the hot air balloons, and those fuel requirements are even listed
clearly on the side of each hot air balloon's burner.

You assume the Elves will have no trouble adding up some numbers and are
about to go back to figuring out which balloon is yours when you get a
tap on the shoulder. Apparently, the fuel requirements use numbers
written in a format the Elves don't recognize; predictably, they'd like
your help deciphering them.

You make a list of all of the fuel requirements (your puzzle input), but
you don't recognize the number format either. For example:

1=-0-2
12111
2=0=
21
2=01
111
20012
112
1=-1=
1-12
12
1=
122

Fortunately, Bob is labeled with a support phone number. Not to be
deterred, you call and ask for help.

"That's right, just supply the fuel amount to the-- oh, for more than
one burner? No problem, you just need to add together our Special
Numeral-Analogue Fuel Units. Patent pending! They're way better than
normal numbers for--"

You mention that it's quite cold up here and ask if they can skip ahead.

"Okay, our Special Numeral-Analogue Fuel Units - SNAFU for short - are
sort of like normal numbers. You know how starting on the right, normal
numbers have a ones place, a tens place, a hundreds place, and so on,
where the digit in each place tells you how many of that value you
have?"

"SNAFU works the same way, except it uses powers of five instead of ten.
Starting from the right, you have a ones place, a fives place, a
twenty-fives place, a one-hundred-and-twenty-fives place, and so on.
It's that easy!"

You ask why some of the digits look like `-` or `=` instead of "digits".

"You know, I never did ask the engineers why they did that. Instead of
using digits four through zero, the digits are *`2`*, *`1`*, *`0`*,
*minus* (written `-`), and *double-minus* (written `=`). Minus is worth
-1, and double-minus is worth -2."

"So, because ten (in normal numbers) is two fives and no ones, in SNAFU
it is written `20`. Since eight (in normal numbers) is two fives minus
two ones, it is written `2=`."

"You can do it the other direction, too. Say you have the SNAFU number
`2=-01`. That's `2` in the 625s place, `=` (double-minus) in the 125s
place, `-` (minus) in the 25s place, `0` in the 5s place, and `1` in the
1s place. (2 times 625) plus (-2 times 125) plus (-1 times 25) plus (0
times 5) plus (1 times 1). That's 1250 plus -250 plus -25 plus 0 plus 1.
*976*!"

"I see here that you're connected via our premium uplink service, so
I'll transmit our handy SNAFU brochure to you now. Did you need anything
else?"

You ask if the fuel will even work in these temperatures.

"Wait, it's *how* cold? There's no *way* the fuel - or *any* fuel -
would work in those conditions! There are only a few places in the--
where did you say you are again?"

Just then, you notice one of the Elves pour a few drops from a
snowflake-shaped container into one of the fuel tanks, thank the support
representative for their time, and disconnect the call.

The SNAFU brochure contains a few more examples of decimal ("normal")
numbers and their SNAFU counterparts:

Decimal          SNAFU
1              1
2              2
3             1=
4             1-
5             10
6             11
7             12
8             2=
9             2-
10             20
15            1=0
20            1-0
2022         1=11-2
12345        1-0---0
314159265  1121-1110-1=0

Based on this process, the SNAFU numbers in the example above can be
converted to decimal numbers as follows:

SNAFU  Decimal
1=-0-2     1747
12111      906
2=0=      198
21       11
2=01      201
111       31
20012     1257
112       32
1=-1=      353
1-12      107
12        7
1=        3
122       37

In decimal, the sum of these numbers is `4890`.

As you go to input this number on Bob's console, you discover that some
buttons you expected are missing. Instead, you are met with buttons
labeled `=`, `-`, `0`, `1`, and `2`. Bob needs the input value expressed
as a SNAFU number, not in decimal.

Reversing the process, you can determine that for the decimal number
`4890`, the SNAFU number you need to supply to Bob's console is
*`2=-1=0`*.

The Elves are starting to get cold. *What SNAFU number do you supply to
Bob's console?*

*/
public enum Day25: String {
case sample = """
1=-0-2
12111
2=0=
21
2=01
111
20012
112
1=-1=
1-12
12
1=
122
"""

case input = """
1-0-0020
1=0---1=1=201
10=02-0=1
1-12-=111201-1212
110=-222=0201=
10--2=20
2=12=-02222021=02-
1-1-1=-1
2=2=2--00-2121=02-1
201-1-210-
1212-11=
2=---10
2=1-02200001211
1===1-2==2-1
10=--=-=00
22-0=
2==0-1022=02
11221=-==-1-20-0
100
10-=22===1=00=0
2=0
1=1=0101=20
2--0=02-11021-
1222011-2--2=
22
20==00=122
2=1-010
20-=222-=2-1002-2
2=
122==01==12202-=
120202
2112=2-0202-12-02
1-=
11=
1101-1==2--
1=0=00=2=0-=02
1021--
1=02-=201122-=12-1
1==0=200=02=2=-2=22
1=21=10211-2222
21-0
1==21=
12=-220002-1=-21=2
1100-=-
1201=02=-111=00-0=
10=-=0122100==1--2
21=-12
10=21-0-2-200022
2102=-2--=1-2=2-1
1=1211101
2002=02--===
1200-
11--20-=-
10-20-0
1=2=
20100-22-0
12==-1
22=0011
2-200222=1121
201-2-=2==00-
1=-=0=--0===2
21=----2==020
1=1-20-=1=-02-2--2=
21
1=202110111=000
2-22-002=
10=1-001
1-002-221000=02
2==---1-0
1012=0--=00--10
1-2=21-2
1=1
11-
1-10--122-12
20
1==
2010=-2-2==2=--
1=11=
10-=
1=-=2--2-110=100
100==--01==
1-1-20=--1-2-0212
20-1001002-
2=1-
1==-2-0-102=-
1-1
12-1-0=2=-22--=10
10=21-02--=-=22
110210-12210--1-=-
1==1--2=21
1-0200=2-2-
22==-00=-
1-=2=-20-202=20111
2=0=-1=
1=-212=1=2
10-220=02
100-
1==02=0021
10=-1222-
1-212==
12-012=
1-0-102-1=-=-01=1-=1
1-
11211
2-0
1=0=
1=0=111000--=12=1
1-1-011==0102-
2==02202=2-=2
11---01-=--=2-02
1==0120-01=0-=0
1=-=2=1-=0=0==212=
212211110=
1=20101-==1
"""
}
