//
//  Day18Description.swift
//  aoc2020
//
//  Created by Andrew McKnight on Dec 4, 2022.
//

/**
## --- Day 18: Operation Order ---

As you look out the window and notice a heavily-forested continent
slowly appear over the horizon, you are interrupted by the child sitting
next to you. They're curious if you could help them with their <span
title="Or &quot;maths&quot;, if you have more than one.">math</span>
homework.

Unfortunately, it seems like this "math"
<a href="https://www.youtube.com/watch?v=3QtRK7Y2pPU&amp;t=15"
target="_blank">follows different rules</a> than you remember.

The homework (your puzzle input) consists of a series of expressions
that consist of addition (`+`), multiplication (`*`), and parentheses
(`(...)`). Just like normal math, parentheses indicate that the
expression inside must be evaluated before it can be used by the
surrounding expression. Addition still finds the sum of the numbers on
both sides of the operator, and multiplication still finds the product.

However, the rules of *operator precedence* have changed. Rather than
evaluating multiplication before addition, the operators have the *same
precedence*, and are evaluated left-to-right regardless of the order in
which they appear.

For example, the steps to evaluate the expression
`1 + 2 * 3 + 4 * 5 + 6` are as follows:

1 + 2 * 3 + 4 * 5 + 6
3   * 3 + 4 * 5 + 6
9   + 4 * 5 + 6
13   * 5 + 6
65   + 6
71

Parentheses can override this order; for example, here is what happens
if parentheses are added to form `1 + (2 * 3) + (4 * (5 + 6))`:

1 + (2 * 3) + (4 * (5 + 6))
1 +    6    + (4 * (5 + 6))
7      + (4 * (5 + 6))
7      + (4 *   11   )
7      +     44
51

Here are a few more examples:

-   `2 * 3 + (4 * 5)` becomes *`26`*.
-   `5 + (8 * 3 + 9 + 3 * 4 * 3)` becomes *`437`*.
-   `5 * 9 * (7 * 3 * 3 + 9 * 3 + (8 + 6 * 4))` becomes *`12240`*.
-   `((2 + 4 * 9) * (6 + 9 * 8 + 6) + 6) + 2 + 4 * 2` becomes *`13632`*.

Before you can help with the homework, you need to understand it
yourself. *Evaluate the expression on each line of the homework; what is
the sum of the resulting values?*

*/
public enum Day18: String {
case sample = """
"""

case input = """
7 * (7 + (4 + 5) + 4)
2 * 6 + 7 * 3
5 * 5 + 8 * ((7 * 4 + 7 * 5 * 4) * 8 + 2 + 2 + 6 + 9) + 8 + 2
8 * 6 * 7 * 5 + ((5 * 7 + 5 + 4 * 3 * 5) * 7 + (3 + 3 + 3 * 2) * 7 + (4 * 3 * 4) + 3) * 9
7 * 4 * 8 + (2 + 5 * (8 + 9) * 7 * (9 + 8 + 4) + 8)
((2 * 9 + 2 * 7 * 3) + 8 * 3 * 5 * 6) + 5
6 + 5 * 6 * (9 * 9 * 8 + (5 + 5 * 3 + 8 * 3 + 7) * 6 + 6) + 5 + (9 * 8 + (2 + 3 + 2 + 2 * 3 * 9) + 7 * (8 + 3 * 3 + 3 + 5 * 7))
(5 * 4 * (5 * 9 + 6 * 8 + 4 * 3)) * 7 * 5 * 7 * (3 + 7 + 3 * 2 + 6) * (3 + 3)
((8 * 8 * 9 + 4 * 5 + 2) + 8) + 3
2 * 6 * 9 + (7 + 2 + 5 + (8 * 3)) * (9 * 6 * 9 * 9) * 5
9 + 6 + 5 * 2
4 + (5 * 6 + 6) + (3 * 3 + 8 + 8) + (5 + 4) + (9 * 8 + (6 * 4 * 2) + 5) * 6
4 + (2 + 6 * 4 + (7 + 9 * 5) * 3 + 6) * 4
6 * 9
((5 + 3) * 8 + 5 + 6) + 6
4 + 9 * 3 + 8 + 3 * (3 * (8 * 5 + 5 * 7 * 5 + 2) * 3 + 6 * (4 + 6 + 8) + 7)
8 + (4 + 2 * 2 * 2 + 5) + 2 + (7 * (7 + 7 + 7 + 7) + 7 + 2) * ((8 + 9 * 6 + 6 * 5) + 6 + 7 * 4 * (3 + 8 * 6 + 5 + 3 * 6) * 7) * 5
(4 * 7 + 4 + 6 + (6 * 5) * 6) * 6 * 8
4 * 3 + 9 + 2 * 4 * 2
5 + (4 * 3 + 8 + 6 * 7 + 9) * 2
4 * (3 + 3 + 6 + 4)
5 + (9 + (9 + 9 * 8 + 8) * 3) + 6 + 5 * 2
(8 * (3 + 2 * 5 + 5 * 4) * 6 * 3) + (2 * 8) * 6 * (3 * 8) + 9 * 4
5 * 4 + (2 * 7 + 7 * (4 + 3 * 3 + 5) + 9)
(4 * 6 * 5 + 5 * 3) * 2 * 5 * 6 * 4 + 9
6 * 8 + (7 + 4) + 5 * (3 * 9)
2 * 7 + 9 * 5 * ((7 + 4 + 2 * 6) * 3 + 5 + 4 + (8 * 9 * 4 + 3 + 7)) + 9
9 + 7 * (6 * 7 * 9 * 9 + 2) * (2 + 8 + 8) * 3 + 7
(8 * 8 * 3 * (9 * 8 + 3 + 2 + 3 * 5) + 4) + 3 + 2 + (8 + 6)
8 + 5 + 3 + 8 * ((2 * 8 + 7 + 7 * 4) + 7) + 8
9 * 3 * 2 + 6
2 * 9 + (9 * 5) * 5 + 3
4 * 7 * (7 * 6 * 8 + 8) * 6 * 4 + (8 * 2 * 5 * 4 * 5 * 3)
((6 + 9 + 9 * 4 * 2 + 5) + 8 + 6 * 4) * 3 + 7 * 2 + 9
3 * 7 + 9 + 7 * (5 * 2 * (6 * 9 * 6) + 9) * 4
3 + 5 + 3 * (6 * (4 * 2 + 9 * 7 * 4) * 7) + 5
2 + 6 + 2 * 7 + (9 + 2 * 4 * (9 * 3) + 8)
(9 * (9 * 7 + 2) * 4 * 7 * (9 * 4)) * ((2 * 9) + 6 + (7 * 7 * 4 * 4) * 4 + 5)
(2 + (8 + 8 * 7 * 2) * 7 * 3 * 7 * 6) + 3 + (7 + 6 + 4) + 4 + 4 + 9
((6 + 5 + 4 * 7) + 3 + 6) + 2 * 3 + 8 + 2 * 3
(4 * (8 * 7 * 7) * (4 * 4 + 9 * 4) + (5 + 4 + 4 * 9 + 9) * (4 * 9 + 2 + 2)) * 2
((2 * 3 * 8 * 3) * 4 + 8 * (2 + 6) + 9) + 5 * 7 + 6 + ((5 + 9) + 4)
8 + (4 * 8 + 5 + 7 * 9 + 4) * 9 + (6 * 7 * 2 + 7)
(2 * 5 * 9 * 2 + 5) + ((2 + 9) + 2 * (2 * 6 + 7)) + 6 + 8 * 5
4 + (4 * 6) + 7 * 3 + 6 + 3
(3 + 4 * 4 + 3 + 4) + 2 * 2
9 * 3 + 5 * (3 + 5 * 9) + 5 + (6 + 7)
6 * ((9 + 9 + 2 + 3 * 9 + 8) + 3 + 7 * (9 * 6 + 8 + 8)) + (8 * (6 * 2 * 6 + 9 * 5) + 8 * (9 * 3 * 4 * 9 + 2 + 9) * (3 * 7 + 2 * 8 * 2 + 9))
((9 * 3 * 4 * 9) + 7 * 3 + (6 * 8 * 6 * 5 * 6) + 8 * 3) + 4
9 * 8 + 5 + 3 + (9 * 8 * 3 + 4)
(8 * (9 + 5 * 8) + 9) + 5 + 4 * 7 + 6 * (6 + 7 + 4 * 2 + 8 + 8)
(8 * (7 + 3 * 9 * 5 * 6 + 8) * (6 * 9 * 3) * (3 * 8) * 2) + 4 + 7 * 7 * 8 * 8
(8 * 9) * 6 * 8
((4 * 9 * 5) * 3 * 9) * 7
(9 + 4) * (5 * (9 * 4 * 5 * 2 * 2) * 2 * (4 + 2) + 6 + 6) * (8 + 9 + 5 + 6)
(3 * 4) * (8 * 3) + 5 * ((9 * 7 * 9 + 2) * 9 + (9 + 8) * 4 * (6 * 5 + 2 + 3 + 8 * 4)) * 4 + 8
9 * (2 * 5 * 3 + (2 * 9 * 8 * 2 * 2) + (2 * 6 * 2) * 5) * 3 + 5
9 + 4 * ((4 * 8 + 2 + 7 * 5) * 6)
9 + 3 * (5 * 4 + 7 + 9) + (4 * (4 * 8 * 8) * 7) + 9
(2 * 5 * 3 + 7) * 6 + 3 * 8 + (7 + 2 * 2) * 8
5 * 7 * (6 * 4 + 7 + 3 + 5 * 3) * (8 + 8 + (5 * 8 * 3 * 7 + 3) * 3 + (3 + 9 * 5) + 7) + (9 * (3 * 9 + 3 * 3) * 6 * 7 * 3) * 9
(6 * 2 + (9 * 7 + 6 + 8 + 7 + 6) * 8 * 8 + 2) + 3
4 + ((8 * 8 + 6 + 6) + (5 * 9 * 5 + 5) + (6 + 3 * 4) * 4)
4 + (9 * 4 + 6 + 7 + 5) * 2 * (4 + 7)
7 + 8 * 3 + (8 * (9 + 9 * 9 + 9 * 8 + 4)) + (4 + 9) * ((9 * 7) + 2)
4 * 4
(4 * (9 * 9) * 2 * 8 * 6) + 4 * (7 + 4 * 3 * 9)
(9 * 6) * 5 + ((2 + 4 * 2 * 5) * 5) * 2 + 5
8 * (7 * 4 * 6 + (2 + 6 + 9 + 7) * (4 + 7))
3 * 2 + ((8 * 5 + 8 * 4 * 7) * 8 + (7 + 5 * 6 * 5 + 4 * 5) + (8 + 7 + 2 + 3 * 2) + 2) + ((6 + 3 * 3) * 2 + (2 + 2 + 5 + 8 + 6) + 6 + 9) * 9 * 2
8 * (4 + (7 + 5 * 9)) + 7
5 * 5 + 7 + 2 * (6 * 3)
(4 * (9 + 6 + 5)) * 4 * 9 * 8 + 9 + 7
2 * (4 * 3 * 6)
(2 * 2 + 2 + 7 * 3 + 3) + (3 + (5 + 2 * 2 + 8 * 5))
(9 + 5) + 3 + 3 * 4
3 + 4 + 7 + (2 + 9 * 4 * 2) + 7
9 + 3 + 2 + (7 + (6 + 4 * 3) + 8 * 2 + 7 * 3)
((4 * 7 + 2 + 8 * 6 + 9) * 8) + 2 + 2 * 3 + (8 * 8 * 6 + 9)
(6 + 7 * 3) * 2 + 8 + (7 * 6 + 3)
3 + 5 + 7 * ((2 + 8 * 5 + 4 * 4 + 9) * 4 + (8 * 3 + 8 + 5 * 2) + (9 * 8 * 8 + 9 * 5) * (3 * 3 * 3 * 4 + 7))
(3 * 5 * (9 + 3 + 7 + 8 + 8 * 8) + (6 + 5 + 7 + 8 * 5) * 2 + 9) + 9
6 * 8 + 8 + (4 * (9 * 9) * 6) * 5
9 * 8 * 3 + (7 * 2 + 6)
2 * (3 * 9 * 5) * (2 + 4 + (3 * 2 * 4 * 9 * 9)) + 9 * ((3 * 6 * 4 * 6 + 5) + (9 + 2 * 5 + 5 + 5) + 9) + 5
3 * 8 + (6 * 3 * 9 + 3 * 2) + 4 * (3 * 3 + 2 + 7 + (2 + 6 + 8 * 7 * 9)) * 5
4 + (2 + 9 * 9 * 2 * 2) + 3 * 4 * 8
((6 * 6 * 5) + 4) + 9 + (6 * 3 * 4 + 6 * (6 * 6 * 4))
(6 * 7 * 9) * 4 + 8 * 6 * ((3 + 7 * 2 * 9) + 2)
6 + 5 * 2 * 6 * 2
(2 + 6 + 2 * 6 + 8) * 3 + (5 + 7 * 5) + 2 + 9
(2 + 5) * (4 + 3 + 2 * 5)
((7 * 2 + 9 + 8 * 2) + 3 + 3 + 7 * 3) * 3 + 8 * 3 * 2
9 * 9 * 5 + 7 * ((6 + 8 + 5 * 4) + 6)
7 * 2 + 3 * (2 * 2) * 8
7 * 3 + 2
7 * 4 + 7 + (3 + (9 + 3 * 4 + 5 + 8 * 9))
3 * 8 + 6 + 5 * (9 + 8 * 9 * 3 * 8) * 5
3 * (2 * 6 * (7 * 2 + 4 * 9) + (3 + 9 * 9 + 4) + 7) + 7 + (4 + (3 * 8 + 7 + 6 + 5)) * 6 + 5
(9 + 4) * 8 + 6 * 8 * 7 + 7
6 + 6 + (5 + 7 + 5) + 2 * 8 * 9
2 * (2 + 4 * (4 + 7 + 4 * 8 * 7 * 3)) + ((5 + 4 * 9) * 4) * 4 + 5 + 5
2 * 6 * 7 * (5 * 7 * (8 * 8 + 6) + 7 * (3 + 4 + 2 * 9))
((9 * 6 + 4 + 8 + 7 * 6) + 6) + 4 * 2
8 + (8 + (5 * 6 + 8 * 2 * 5 + 3) + 5) + 7 * 2 * (4 + 6 + 3 + 7) + 6
6 * 6 + 4 * 5 * (2 * (3 + 9 * 3 + 6) + (3 + 8 + 4 + 3 * 3 * 7) + 4 + (5 * 5 + 2 * 8 + 7))
(9 * 8 + 6 * 8 * 2) * 4 * 3 + 9 + 3 * (2 + 3)
6 * 2 * 9
2 * 4 * 8
9 + (5 + 3 * (5 * 6 * 8 * 7) * (7 * 3 * 7 + 2 * 2 + 7) + 9 * 2) * 6
7 * 3 + 4 * (4 * 2 * (3 + 8 + 5 * 6 + 2 + 6) * (5 + 7) + (3 + 5 * 4 + 2 + 2 + 6) * 6) * (8 + 5 * 5 + 4 * 6)
5 + (4 + 9)
8 * (3 + 9 * 5) + 3 + 7 * 3
(2 + 5 + 7 * 8 + 4) * (6 + 7) + 5 * 6 * 2
((9 + 8 + 5 * 8 * 4 + 7) * 6 + 9) * 3 * 7
4 * ((6 + 6 + 4 * 5 * 7) * 6 * 2 + 5 + 3 + 7) * 7 + 3 * 6 + 3
6 * 7 * 4 * 7 * 3
2 + 4 * 5 * 4 + (9 + (9 * 7) + 4 * 6) * 3
(2 + 9 + 7 * 3 * (5 + 5 * 7 + 3) * 4) * 6 * 2 * 9
(6 * 2 * 2 + 3 * 7) * (4 + 8 * 6 + 5 + 2) + 4 + 6
5 + (4 + 6 + (9 * 5 + 6 + 5 * 2) + 4) + 4 * 8
3 + 6 + ((4 * 4 * 6 * 7 + 6) * 5 * 3 * 7) * (3 * 8 + 6 + 8 + 5) + 8
3 * 8 + (4 + (9 * 5 * 3 * 9 + 7 + 5)) + 2
4 * 9 * 2 * 4 + 4 * 8
(6 + 2 * (5 * 5 + 2 * 3) * 5) * 7 + (2 + 2 + 2)
7 * (3 + 3 + 9) * 7
8 * 7 + (4 + 9 + 6 * 6 + 3) * (2 * 2 * (9 * 2 * 6))
8 + (6 + 2 + 9 + 2) + (5 + 7) * (6 + (8 * 6 + 9 + 8 * 6) + 7 + (2 + 2 + 9 * 3) * 4 + 4) * ((6 * 3 * 3 * 6 * 2) * (5 * 2 + 4) + (4 * 4 + 7 + 6 + 4 * 3) * 9) + 9
((5 + 2 + 6 * 3 * 7 * 2) * 7 * 3 * (8 * 4 * 2 * 6 * 5) * 8 * 7) + 8 * 8 * 9 * 6
4 + 9 + (9 + 8 * 9 + 5 + 3) * 7 + 6 * 9
7 + 9 * (5 * 5 + 9 * 2 * 3 * 5) * 5 * 9
((3 * 9 * 2 + 2 * 4) * 7) * 7 * 9
3 * 5 + 5 + (3 * 9 * 7 * 6 + 8 + (4 * 6 + 7 + 8 * 5)) + 8 * 4
9 * 9 + 5 + 2
(7 * 8 + 6 + 5) + 7
(5 * 2 + 2 + 7) * 2 * (8 + 4 + 9 * 6) * 2 * (8 + 6 * 3 * 3 + 9)
6 * 2 + 5 + (8 + 8 * 6 + 9)
3 + (2 + 7) + (4 + 4 * 4) + 5 * (9 * 4 * 4 * 3 + 5 + 8) * (5 * (8 * 9 + 9 * 7 * 4) + 3 * 9 * 2)
6 * 4
2 + 7 + 5 * (8 + 2 * 2 * 6 * 6 + (5 * 6 + 9 + 6 * 6))
7 * ((8 + 9) + (7 * 8 * 5 * 3 * 2) + 4) + 7 * 6
2 + (8 + 3 * 6 * (5 * 9 + 9 + 8 * 8 * 2) * 5 + 5) + 5 + 3
((5 + 5 + 2 * 8) + 6 + (3 * 9 * 3 * 9 + 8)) + ((2 + 4 + 7 * 9) + 9 * 5 + 2 + 9) * 5 * 5 + (9 + 4) * 9
6 + (7 + 7 + 4 * 5 + 5) * (3 + (5 * 5 + 4) + (6 * 2 * 9 * 3 + 4)) * 4
2 + 2 * (8 * 6 + 5 * 9 + 7 * 3) * 2
(2 * 7 * 2 * 2) * 4 * 4
(3 + 5 * (4 + 2 * 7 * 4 + 4 + 9)) + 7 + 7 * 8 + 2 * 5
(7 + 4 * 6 + 3 + (7 + 5 + 3 + 2 * 4) + (6 + 9)) + 6 * 8 * 7 + 4 * 9
4 + 2 + 8 * 3 + 5 + (6 * 5 + 7)
(6 + 9 + 9 + 8 * 3 + 2) + 8 * 7
5 * 9 + 7 + 5 * (2 * (9 * 5 * 2 * 9 + 9) * 5 * (7 * 5 * 2) * 9 * 6) + 4
(7 + 2) + 3
4 * 7 * 3 * (8 * 7 + 4) + 6 + (2 + 7 * 2 + (3 * 4 + 4 + 2 + 2) * 4)
8 + (9 * 9 + (9 * 9)) * 9 * 9 + 6 + 9
(2 * 8 * (2 * 6 + 2) * 9) * 3 + (4 * (9 + 6 * 9 + 6)) * 9 + 2 + 3
8 + (2 + 4 + 5 + 7 * 2) * 7 * 5 + 8 + 9
4 + 3 + (6 + (3 + 5 + 2 + 2 * 4) + (6 * 8 * 6 * 7 + 7 + 2) * 9 * 7 * 7)
((6 * 4 * 7) + 5 + 8 + 8 + 6) * 6 + 9 + 3
4 + 4 + (5 + 7 * 9 + 9 * (4 * 4 * 4 + 6 * 2 * 5))
5 + (9 * 3 + 2 + 9 + (3 + 9 * 4 * 7)) * (7 + 8) * 8 + 3 * (6 + 2 * 4 + 2 * 5)
7 + (9 * 4 * 3 * 4 + (7 + 3 * 4 + 8 * 5)) + 8 + 8 + 6
3 + 3 * 7 + (5 * 8) + (6 * (8 * 7)) + 7
6 * (2 * 9 * 9 + 6 + 3) * (5 * 9 * 7 + 4 * 6 + 7) + (4 + 4 * (4 * 3 + 5))
2 + 9 + 7 + (2 + 8 + 8) + 5 + 9
4 * 6 * (3 + 8 + 2 * 4) + 7 + 5 + (3 + 9 + 3 + 3 * 5)
8 + ((5 + 5) + 2 + 3)
(9 + 2 + 4 + 7) + (4 * 7 + 3 + 4) * 9 + 6
8 + 5 * (9 + 9 * 4) * 6 * 4 + (8 * 2 * 3 + 7 * 7)
8 + (2 + (3 * 5 + 7 * 3) * 8 * 9 * 2) * (6 + 5 * 2 + 9) + 3 * 8 + 7
3 * (5 * 6 + 3 * 7) + 6 + 8
6 + (5 * 9 + (4 + 9 + 9) * 6 * (8 + 5 * 7) * 5)
4 + (3 + 8) + 8 * 9 * (3 * (6 * 9 + 7 * 9 + 8 * 5)) + 6
(2 + 5) * 4 * 6 + ((2 * 4) * (9 * 6 + 8) + 7) * 9 * 6
7 * 4
4 * 8 * 9 + (6 * 4 * 6 + 5 + 7) * 3 * (4 * 5 + 9 + 6 * 5)
6 + (5 + 4 * 3 + 8 * 3 * (9 * 4 + 7 * 2)) * 6 + 5 + 5
4 + 8 * 7 * 2 + 2
((9 * 6 + 2 + 8 * 2 + 9) + 7 + 3 * 9 * 6 + 9) * 4
5 + 7 * 8 + (2 * 3 * (3 + 3) + 8 + 3)
3 * (8 * 2 + 3 + 3 + 6 + 2)
8 + 7 * 6 * 2 * (5 + 5 + 4) * 6
(3 * (8 * 2 * 9 * 8) * 6) + 3 * ((9 + 7 * 7 * 9 * 2) + 2 + 2 + 4 + 6 + 9) * 9 * (9 * 6 + 7 + 3 * 8) + (4 + (4 * 7 + 5))
3 * ((9 + 2 + 6) * 3 * 9 + 9 * (8 + 4))
((4 * 2) * (6 * 7 + 6 + 5 * 2 + 2) + 6) * 9 + (5 * 6 * 8 * 5 * (2 + 6 * 9 * 2) + 6) + 7 * 6 + (8 * 5 + 9 * (2 + 6) + 8)
(6 * (3 * 9 + 5 + 7 * 4) + (5 + 8 * 7 * 5 * 8) * 6 + 2) + 2 + 2 + 6 * 5 + (3 + 6 + 3 + 9 * 9 + 8)
6 * 4 * (4 + (9 + 9 * 3 * 3)) + 5 + 7
7 * (5 * 8 + 3) * 8 + 6
6 + 5 + 4 + (2 * (6 * 3 * 5 + 8 + 6) * 7 + 9 * 3) + (2 * 8 * 2 + 7)
7 + 9 * 8 * 8 * (2 + (5 * 7 + 2) + 7)
7 * (2 + 4 + 3 + 7 + (3 + 5) + (7 * 5 * 7 * 9 * 4)) + 2
8 * 2 * (8 * 8 + (3 + 2 * 9 + 6) * 3 + 8 + (2 + 2)) * (9 * 4 + (4 + 8 + 5 * 2 + 8 * 6) + 2 + 9 * 6) * 7 * (6 + 8 + (9 * 5 + 3))
3 * (4 * 8 * 3 + 3 * 6)
7 * 7 * (8 + 9 * 4 * 7) + 6 + 3 * 8
7 + (5 * (7 * 3 * 5))
(4 + 3 + 9) * 9 + 7 * ((7 * 8 + 9 * 3) + 8)
6 + 8 + (3 + 7 + 7 * 2 + 9) * 5 * 9
((7 + 3 + 7) + 9 + 9 * 6) + 6 + ((3 + 6 + 8 * 6 * 7) * 2 + (7 * 5 + 8 * 8 * 7 + 7))
(6 * 4 + 6) * 9 * 2 * 8 + 2
8 + 6 + 9
8 + 9 + 9 + 9 + (3 + 3 + 5 + 9 + 3 * 9)
(9 + 4 + (7 + 6 * 3 * 9 + 2 * 2) * 7 * 8 * 7) * 3 + 4 + 7
3 + 3 * 6 + (5 + 9) + (2 * 9 * 7 * 3)
3 * 6 + 8 * 2 + 3
8 * (2 + (2 * 2 * 9 * 4 * 8 + 4) * 2 * 2) * 3 * 5
(3 + 9 + 4 * 5 + (7 * 6 * 6) * 9) + ((7 * 9) * 2 + 3 + 9 + 4) + 5 + (2 * 5 * 2 * 5) * 6 + 7
4 + (6 + 3 * 5 * 7) + 9 * 2 * (3 + 2 * 4 * 2 + (2 * 8 * 9 + 4))
4 + 3 * (8 + 4)
7 * 6
9 + 7 * (9 * 4 + 4 + 9 + 5 * 2)
(7 * 7 + 8) + 3 * 5 * 3
(6 + 7 * 2 + 5) * (4 + 5 * 6 * 3 * (4 + 4 * 5 * 2 + 6 * 2) + 4) + 9 * 7
(8 + 7 + 5 + 8) + 2 * (7 + 4 * 8 + (2 + 2 + 5 + 4 * 5 + 4)) + 6 + (3 * 5) + 3
3 * 7 * (9 * (2 * 4 * 3 * 8) + 5 * 4 * 5 + 8) * 4 * 4
7 + 4 + (9 * 3 + 4 * 5 + 4)
((5 * 5 * 4) + 9) * (3 * 6 * 6 * (9 + 8 + 7 + 4 * 3)) + 6
(8 + 9 * 8 * 7 * 5 * 6) * 6
7 + 2 + 5 * (8 * 7) * 9 * 4
3 * 4 * 6 * 4 * 6 + 6
9 * 4 * 7 * 8 + (7 + 4 * (2 + 5) + (8 * 9 * 6 + 4 + 8) * 7)
(7 + 6 * 6 * 7 * 3) * (4 * 7 * 6) + 8 + 9 + 7
7 + 9 * (4 * 9 * 2 * (7 * 6 * 7) + 3) + ((6 * 8 * 3 * 6 * 9) * 4 * 3 + 2 * (6 + 3))
7 + (2 + (3 + 4 + 5 + 6 * 7 * 2) + 7 + 3 * (2 * 6 + 3 + 9 * 7 * 9))
(6 * 5 + 8) + (4 * (8 + 9 + 6) * (7 + 6)) * 3 + 9
3 * 8 * (3 + 3 + 5) * 8
2 * (6 + 3 * (6 + 6 * 2) + 8 * (4 * 4)) + 9 + (2 * 3 * 8 + 2) * 7 + 6
4 * 4 + 5 * 5 * 5 * 6
2 * 8 + (5 + 8 + 6)
5 * (6 * 7 * (6 + 8 + 9) * 8 + (3 + 8 + 2 + 2 + 7)) * 4 + 3 * 5
((4 + 9 + 3 * 3 + 9 * 3) * 2 + 2 + (5 + 6) + 2) + (3 * 2)
6 + 2 * (7 * (2 * 6 * 7) + 8) * 2 * 3 * 3
2 * ((8 + 2) + 5 + 3 + 4) * 7 * 7 * (3 + 6 * 7)
(9 + 5 + 6 * 5 + (5 * 9 * 2 * 4 + 9) + (8 + 3 * 2)) + 7
(4 + 2 + (3 + 7 + 3 * 3)) * 9 * (9 * 2 * 6 * 4 * 4 * (4 * 9))
4 + (9 + 6 * 8 + (6 + 6 * 2) + 3) * (5 * (2 * 3 * 5 * 5 * 5) * 5 * 7) + (5 * 6)
5 * 4 + 4 * 9
(3 + 7 * 7) * ((2 * 4 + 8 + 2) * (9 + 7 + 7 * 8) * 4 + (8 + 4 + 2 * 4 * 5) + 8 + 6) + (9 + 8 * 6 + 4 + 2 + 5) * 6
(4 + 7 * 3 + 7) + (5 * 9) * 6 + 7
5 * 3 * (6 * 6 * 5 + (5 * 8)) * 8
((3 * 7) * 5 * 3) + 3 * 3 + 6
(8 + 8 + 3) * (7 * 9 * (6 * 6) + 7 * 5 + 6) + 6
3 * (3 * 7) * 5 * ((4 + 5) * 4 + (2 * 5 * 7 * 4 * 3) + 5)
(3 + 6 + 4 + 8) + 9 + (7 * 5 * 7 * 3 + 5 * 6)
6 * (3 + (3 * 8 * 6 + 3 + 5 * 9))
(5 * 6) * 4 * 4 + (3 + 4) * 7
7 + 2 * 9
5 + ((4 + 7 + 5 * 4 * 5) + 5 * 3 + 8 + (3 + 6 * 6 + 4))
3 * 7 + (3 + 4 * 9 + (6 * 5 * 4) + 7)
7 + (8 + 7 + 8 + 5 * 6) * 3 * 3
8 + ((8 + 3 + 9) * (3 * 4 + 7 * 4 + 3)) * 9 + 9 + 8
6 + (7 * 7 + 8 + 2 * 4) * 6 * (8 + 8 * 7 + 5 + 5 * 6) * 2 + 9
4 * 2 + 4 * (8 + 6 * (3 * 9 * 6) * 8 * 8 + 7) * 5
((6 * 2 + 2 + 2 * 8) + 3 + 4 + 9 * 9 + 6) * 8 + 3
(4 + 2 * 5 * 3 + 5) * 7
5 + 8 * (2 + 9 * 5 + 4 + (3 + 4 * 6) + 3) + 4 + 7
4 + 5 * 3 * (9 * 7)
4 + (2 + (4 * 9 * 6) + 7 * 9 * 9 + 2) * (2 + 8 * (4 + 4 * 5 + 4 * 2)) * 3
((6 + 7 + 2 * 7 * 3) * 7 + (7 * 7 + 5 + 3 + 6) + 2) + (4 * 5 + 3 + (7 * 9 * 2 + 8 * 9) * 9) + 5 * 7
6 + 2 + (6 * 9) + 3
3 + 3 + ((7 * 6 + 8) * (6 + 5 * 5 + 8) + 5 + (7 + 9) + 4 + 4)
6 * 7 * 8 + (5 * 5 + 9 * 7 * 8 + 4) + 4
(6 + 4 * 8 * 6) * (4 * 6) + 7 + 8 * 8 * (9 + 4 + 4 * 6 + 7)
3 * 5 * (9 + 3) + 9 * 4 + 6
(5 + 4 + 5 + 6) * (5 + 5 * (4 * 7 * 4 + 7) * 2 + 3 + 8) + 9
6 * 6 + (9 * 2 * (2 + 8 + 3 + 7 * 2) * (6 + 2 * 2))
7 + 4 * (9 * 4 * 9 * 9) + 9 + (5 + 8 * (6 * 7 * 7 + 2 * 5 + 8)) * 2
((8 * 2) * 8 + 8) * 8 + 3
8 + 8 + ((6 * 2 + 5) + (3 + 9 * 3 * 6)) * 6 * 8
3 + (2 * 3 * 2 * 6 + 3) + 3
(4 + (7 * 9 + 9 + 2) + (6 + 4 * 8) + 2) + 6 * (7 + 8 + 6 + 2 * 3 + 8)
5 * 6 + (3 * (7 + 7 * 6)) * 6 * 7
(6 + 6 + 6 * 4) * 3 + 3 + ((4 + 8 + 8 + 2 + 3) + 7 * 4)
6 * 8 * (5 * 8 + 9 + 9 + 9 + 4) * 2 * 2 + 9
9 + 8 + (6 * 7 + 4 * 6)
4 * 9 + (3 + (7 + 8 + 5) + 9 * 4)
2 + (4 + 7) + 3 * 3
2 + 4 + ((5 * 7 + 6 + 7 * 3) + 7 * (8 + 6 * 4 + 7 + 5) + 3 * 4 + 9) * 8 + 6 * 7
5 + 2 * (5 * 3 * 7 + (3 + 7) + (6 + 4))
(3 * 9 * 7) + ((6 + 7) + (5 + 2 * 4 * 7 * 3)) * 8 + 8
9 * 5 * 4 * (5 + 4 + 5) + 2
(6 * 9) + ((7 + 2 * 6 + 5 * 5 + 5) * 4 + 7) + (5 + 7 + 5 + 3 * 9 * 5)
(3 * 3 * 2 * 6 + (6 + 6 * 4 * 7 * 5) + 5) + 8 + 3 + 5 * 5
((9 * 3) * (5 + 9 + 2) + 5) + 4 + 3 + (8 + 7) + 7 + 9
(4 * 9 * 2 * (9 * 9 * 2 * 6 + 4) * (8 + 9 * 4 * 6 * 3) * (3 + 6 + 4)) * 5 * (2 * 2 * 2 * 7 + 5) + 2 + 5
(6 + 4 * 9 * 6 + (5 + 3 + 9 * 6)) + 5 * 3
3 * (8 + 7 * 8 + 6 * 7) * (5 + 2 + 6 + (2 + 7 + 5)) + 3 * 5
4 + 8 * 6 * (8 * 9) + 9 + (3 + 9 + 2 + 2 + 3 * 4)
5 + (6 + 5 + 2 + 8) + 6 + 4 * 6
9 + ((7 * 9 * 7 * 9 * 5) * 8) * 9
3 + 6 + (9 + 3 + 7 + 7 * 8) + 5 + 7 * (8 * 5 * 8 * (4 * 8 * 8 * 9 * 9 * 7))
5 * 2 * 4 + 7 + 7
3 * (8 * (4 * 8) + (5 * 5 * 8 + 9 * 9 * 3) + 9 + 6 * 5) * (4 * (5 + 7 * 6 + 6 * 3) + 6 + 3) + 4 * 4 + (6 + 3 * 7 + 3)
4 + 4 + 2 + 3 * ((5 * 6 * 7) * 8 + 6 * (9 * 8 * 3 + 8 * 3 + 6) * 8)
8 + ((5 + 2 + 9 * 3 + 8) + 3 * (6 + 9 * 5 + 6) * 8 + 2)
(8 * 6 + 3 + 5) * 4 + 4 * 7 + (3 * 5) + 6
3 + (8 + (4 + 9) * (3 + 5 + 9 * 2 + 6) + 9 + 8) * 4 + 6 * 9
2 + 3 + 8 + ((8 * 6 * 5 * 2) + 9 * (4 + 5 + 6 + 7 * 3 * 7) + 7 * 3) * 2
(3 * 6 + 3) + 6 * 5 + 7 + 2 + 4
6 + (5 + 6 * 2 + 3) * 7
4 + (9 + (6 * 7) * 3 * 9 + 6)
9 * 4 * 6 * 5 + (7 * 6 * 9 * (8 * 3 * 6 * 4 + 2 + 7) * (8 * 5 + 3 * 6 + 3))
(9 + (4 * 3 + 8 + 2 * 3 * 7) + 7 + (6 * 9 + 9 + 7 * 5 * 6) + 3 + 9) * 6 * 3 + 2 + 7
5 * 2 * 9 + (4 * 8 * 5 + (2 + 3 + 3 + 8 + 6) + 8) + 3 + 4
4 + 5 * (5 + 4 * 9 * (9 + 6 * 4)) + 3 + 6 + 4
9 + 4 * (5 * 8 + (8 + 7 + 4 * 8 + 2)) + 5 + 2 * 6
2 * 8 + (4 * (2 + 2 * 3 + 2 + 2) * (4 + 9 + 5 * 7) * 2 * (5 + 7)) + ((8 * 8) * (2 + 9 + 6 + 8 * 6)) + 6 + (7 + (5 + 2 + 9 * 6) + 7 * 7 * 6 * 5)
4 * 8 + 8 + (5 * 3 + 2 + 2 * 7 * 3)
7 * 5 + 2 * (8 * 7 * 6 + (8 * 7) * 4 + 2) * 7
2 + 6 * ((5 + 7 + 2 + 7 + 8) * 9 + (8 + 4) * 2)
(2 + 7 * 3 * (9 * 8 * 3 * 2 + 7 * 2) * 5 * 9) * 7 * 9 * 5 * 4 + 8
6 * 6 * 4 + (9 * 7 * (2 * 5 * 4 + 8 + 2) + 4 + 3) * 3
2 + 7 * 4 * (4 * (9 + 5 * 6)) + 7
6 * (2 * 3 * 9 * 2 * 4 + (7 + 7 + 5 * 6 * 3)) * 3 * (8 + 6) + (8 * 9 * (5 + 6 + 4 + 3 * 3 * 4) * 2) * 5
(8 + (8 + 6)) * 6 + 2
9 + ((8 + 5 * 3 * 2) + 4 * 6) + 8 + 4 * 5 + 3
4 * 3 + 4 + (6 * 8 + (6 + 3 * 9) + 8 + (3 + 6 * 3) + (7 * 8 + 9)) * 4 + 7
7 + (8 + 6) + 8 + 6 * 9
(5 + (4 + 6) + 8 * 9 + (8 * 6 + 7 * 4 + 2) * 8) * 6 * 9
4 * 7 + (7 * 8 + 6 * 7 * 7) * (6 + 7 + 8 + (2 * 7 * 2 * 3 * 3))
((3 + 7 + 3 + 6 + 6 * 4) * (3 * 6 * 7 + 5 + 3 + 3) + 7 + 2 * (4 * 4 * 6 + 5) * 6) + 8
((2 * 3) + (2 + 2 + 3) + (2 + 5 * 4 * 4 * 2 + 5) * 4 * 6 + 2) + 5 + 5 + 5
8 * (5 * 9 + 5 + 4 + 3) * ((4 * 5 + 5 * 8 + 9 + 2) * (7 + 4 * 4 + 6 + 8)) + 6 + 9
(3 * 3 + 3 + (4 * 9) * 5) + ((9 + 3 * 6 * 9 * 4 * 5) * 8 + 3 * 5 * 3 + 7) + 4 * 3
(2 * 6 * 4 * 3 * 7) * (2 + (8 + 5 + 4 + 2 * 8) + (2 * 8 + 9 * 6 + 2 + 8) + 9 + 2 + 2) * 5 * (5 + 3 + 4)
9 * (8 + 6) + 7
5 + (8 + (2 + 2 + 3 * 2 + 8 + 3)) * 9 + (8 * 8 * 2) * (3 + 8 + 6 * 7 * 9 + 2) * (4 + 7 * 9 + 8)
((9 * 9 * 9) + (7 * 7 * 6)) + (5 * (8 * 4 * 4) + 3 + 2 + 5 + 6) + (5 * 9 * 8 + 2 * 2 * 5) + 8 * (7 * 2 + 8 + 3 * 3 + 3)
(4 * 8 * 5 * 7 * 6) + (2 + 2 * (5 * 7 + 8 * 2 * 3 + 5) * 9 * 9 * 5) * 2 + 4 * 6 + 9
(4 * 6) * (5 * 2 + (9 + 5)) + 7 + 8 * 2 * 3
((2 * 3 * 6 * 4 * 6 * 2) + 4 + 5 + (8 + 8 + 5) + 6 + (7 * 6 + 9 + 3 * 6)) + 2 * 9
5 + (2 + 2 * 5 * (3 + 6 * 6 * 2) * 5 * (7 + 4 + 3 * 2)) + 6 * 9 * 8 * (7 * 6 * 8 + (9 * 2 + 3 + 2 * 6))
(7 * 9 * 3 * 4 * 8) + 7 * 3 * (8 * 4 * (7 + 7 * 4 + 8 * 3) + (7 + 6 * 4) * 9 * 7)
9 * (9 + 3 * (7 + 4 * 9) + (5 + 9 * 2 + 5)) * (5 + 8 * 8)
8 * (6 + (7 + 8) + 8 * 4 + 7) + 7
2 + ((6 * 8 + 5 + 2 + 8) * 5 + 8) + 9
(6 * 2 + 7 * 8 + 4 + 7) + 5 * 7 + 7 * 3
2 * 4 * 4 + (4 * 6 + (9 * 5 * 5 * 5 + 8) * 6)
4 * 7 * 9 + ((2 + 3) * 2 + 2 + 6 * (7 * 2)) + 7
2 + (9 * 6 + (3 * 3) + 3 + 4) * 2 * (8 + 7 * 6 + 4 + 5 * 3) + 8 * 2
7 * 7 * (4 * 6 * 5) + 8 + (2 * 2 + 4 + 2 * 8) * 3
8 * 6 + ((6 + 2 + 3 * 4) + 8)
5 + (4 + 9 * 3) * 4 * 9 + ((8 + 3 + 2 * 5 * 9 + 9) * 5 + 3 + (8 + 9) * 4 + 6) + 8
8 * 6 * 3 * (3 + 2 * 5) + (6 + 8 * 2 + 4) * 8
(2 * (2 * 6 + 3) * 6 + 5 + 7) + 9 + 4
7 * 2 * 3 * (3 + (7 + 2) + 4 * 5)
2 + 9 * 8 + (4 + 4 + 6 * 2) * (7 * 4) + 8
(5 * 4 + 6) + (2 + 5 * 3) * 7 + 5 * 2 + 5
7 * 5 + 9 * 8 * 3 + (5 + 3)
9 * (3 * 8 + 6 * 4 * (3 + 6 * 7 + 5)) + 8 * 3
6 * 4 * 9 * 6 + ((5 + 4) * (3 + 8 + 5 + 6))
(8 + 8) + 2 + 7 + 5 + 9
9 * 3 + 3 + (2 * 4 * (9 + 8 * 2 + 9 + 3) + 2 + 9 * 9)
4 * (2 * 3 + 9 + (2 + 3) * (6 + 2)) * 2 + 5 + (4 + 2 * 5 + 8 + (8 * 5 * 4) * 2) + 5
3 * 5 + 8 + ((9 + 4 + 8 + 4 * 5 + 7) + 6)
4 * (2 + 3) + (8 * 6 + 6 + 7 + (9 * 3 * 3 * 8 * 3)) + 5 * 5 * (2 + 7 * (6 + 5 * 6 + 3 + 4) + 5 + 9 + 2)
(9 * 4 + 2 + 6 + (4 + 8 * 8 + 9 + 3 * 5) + (8 * 8 * 4)) + ((8 + 2 * 7 + 9 * 4 * 7) * 7 + 6 + 3 * 2 + 8) * 2 * 9 * (8 + (6 + 8 + 8 * 5 * 9 * 8)) * 5
6 + 2 + (9 * 6 * 8) + (3 * 2 + (6 * 3 + 2 * 9))
5 * 3 * 3 * 6 * (2 * 5 * 9 * 8) * 9
2 * 8 + 2 * 3 + (6 * 4 * 3 + (6 + 3 * 7 + 2 * 8) * 4)
9 * (7 * 4 * 4 * 5 + 9 + 5) * 4 + 2 * (2 + 8)
7 * 5 + 6 + 4 + 5 + 3
(9 + 4 + 7 + 2) * 4 + 2 * 4 + (3 + 6 * 9 * (2 + 6 + 2 + 8) + 3 + 9) * 7
7 * 9 + (7 + 3) + 8 * (4 + 2 + 5) + 7
8 + 4 + (3 * 9 + 9 + (8 + 5 + 4 + 6 * 4) * 4 + 9)
(4 + 6 * (3 + 9 * 6 * 5 * 9 + 4) * (2 * 9 * 2 * 7) * (7 * 6 + 9 + 3)) + 6 * (6 + (7 * 8 * 3 + 4 * 6))
((7 * 9 * 4 * 4) * 8 * 7 + 8 + 9 + 5) + 9
7 * ((7 * 8 * 3) * 2 * (8 * 7 + 2) + (3 + 2 * 6 * 9) * 5 * 8) * 4
(6 * 9) + (7 + 6 + (5 + 9 + 6 + 7 + 4 * 6))
3 * 6 + 8 + 7 + (6 + (2 + 9 + 4 + 3))
(9 * 5 + 6 * 5 * 9 * (5 + 2 * 2 + 3)) * (7 + 3 + 2 + 4 * 3) + (6 * 3 * 7 + (3 + 6) * 3) * (6 + 7) + 7
5 + 3 + 6 * ((9 + 6 + 8 + 6 * 5) + 6 * 6 + 5 + 3 + (5 * 9))
9 + (5 + (8 * 8 * 8 * 5 + 8 * 9) * 5) * 7 + 8
(7 + 2 * 7 * 6) + 6 + 9 + 7
7 + 8 + ((5 * 6 * 2) * (4 * 5 * 7 + 8 * 8)) * (9 * 5 + 8 * (5 * 3 * 3 * 5 + 3 * 3) * 9 * 9) * 9 * 6
((8 * 5 + 6 * 6) + 2 + (4 + 2 * 2 * 9 * 7 * 7)) * (7 + 9) + (9 + 3 + 7 * 8 + 4) * 5
"""
}