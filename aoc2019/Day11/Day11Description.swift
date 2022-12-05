//
//  Day11Description.swift
//  aoc2019
//
//  Created by Andrew McKnight on Dec 4, 2022.
//

/**
## --- Day 11: Space Police ---

On the way to Jupiter, you're [pulled
over](https://www.youtube.com/watch?v=KwY28rpyKDE) by the *Space
Police*.

"Attention, unmarked spacecraft! You are in violation of Space Law! All
spacecraft must have a clearly visible *registration identifier*! You
have 24 hours to comply or be sent to [Space
Jail](https://www.youtube.com/watch?v=BVn1oQL9sWg&t=5)!"

Not wanting to be sent to Space Jail, you radio back to the Elves on
Earth for help. Although it takes almost three hours for their reply
signal to reach you, they send instructions for how to power up the
*emergency hull painting robot* and even provide a small [Intcode
program](9) (your puzzle input) that will cause it to paint your ship
appropriately.

There's just one problem: you don't have an emergency hull painting
robot.

You'll need to build a new emergency hull painting robot. The robot
needs to be able to move around on the grid of square panels on the side
of your ship, detect the color of its current panel, and paint its
current panel *black* or *white*. (All of the panels are currently
*black*.)

The Intcode program will serve as the brain of the robot. The program
uses input instructions to access the robot's camera: provide `0` if the
robot is over a *black* panel or `1` if the robot is over a *white*
panel. Then, the program will output two values:

-   First, it will output a value indicating the *color to paint the
panel* the robot is over: `0` means to paint the panel *black*, and
`1` means to paint the panel *white*.
-   Second, it will output a value indicating the *direction the robot
should turn*: `0` means it should turn *left 90 degrees*, and `1`
means it should turn *right 90 degrees*.

After the robot turns, it should always move *forward exactly one
panel*. The robot starts facing *up*.

The robot will continue running for a while like this and halt when it
is finished drawing. Do not restart the Intcode computer inside the
robot during this process.

For example, suppose the robot is about to start running. Drawing black
panels as `.`, white panels as `#`, and the robot pointing the direction
it is facing (`< ^ > v`), the initial state and region near the robot
looks like this:

.....
.....
..^..
.....
.....

The panel under the robot (not visible here because a `^` is shown
instead) is also black, and so any input instructions at this point
should be provided `0`. Suppose the robot eventually outputs `1` (paint
white) and then `0` (turn left). After taking these actions and moving
forward one panel, the region now looks like this:

.....
.....
.<#..
.....
.....

Input instructions should still be provided `0`. Next, the robot might
output `0` (paint black) and then `0` (turn left):

.....
.....
..#..
.v...
.....

After more outputs (`1,0`, `1,0`):

.....
.....
..^..
.##..
.....

The robot is now back where it started, but because it is now on a white
panel, input instructions should be provided `1`. After several more
outputs (`0,1`, `1,0`, `1,0`), the area looks like this:

.....
..<#.
...#.
.##..
.....

Before you deploy the robot, you should probably have an estimate of the
area it will cover: specifically, you need to know the *number of panels
it paints at least once*, regardless of color. In the example above, the
robot painted *`6` panels* at least once. (It painted its starting panel
twice, but that panel is [still only counted
once](https://www.youtube.com/watch?v=KjsSvjA5TuE); it also never
painted the panel it ended on.)

Build a new emergency hull painting robot and run the Intcode program on
it. *How many panels does it paint at least once?*

*/
public enum Day11: String {
case sample = """

"""

case input = """
3,8,1005,8,361,1106,0,11,0,0,0,104,1,104,0,3,8,102,-1,8,10,101,1,10,10,4,10,108,0,8,10,4,10,1001,8,0,28,2,1104,18,10,1006,0,65,3,8,102,-1,8,10,1001,10,1,10,4,10,108,1,8,10,4,10,1001,8,0,57,1,1101,5,10,2,108,15,10,2,102,12,10,3,8,1002,8,-1,10,101,1,10,10,4,10,108,0,8,10,4,10,102,1,8,91,2,1005,4,10,2,1107,10,10,1006,0,16,2,109,19,10,3,8,1002,8,-1,10,1001,10,1,10,4,10,1008,8,1,10,4,10,101,0,8,129,1,104,3,10,1,1008,9,10,1006,0,65,1,104,5,10,3,8,1002,8,-1,10,101,1,10,10,4,10,108,1,8,10,4,10,102,1,8,165,1,1106,11,10,1,1106,18,10,1,8,11,10,1,4,11,10,3,8,1002,8,-1,10,101,1,10,10,4,10,108,1,8,10,4,10,1001,8,0,203,2,1003,11,10,1,1105,13,10,1,101,13,10,3,8,102,-1,8,10,101,1,10,10,4,10,108,0,8,10,4,10,101,0,8,237,2,7,4,10,1006,0,73,1,1003,7,10,1006,0,44,3,8,102,-1,8,10,1001,10,1,10,4,10,108,1,8,10,4,10,101,0,8,273,2,108,14,10,3,8,102,-1,8,10,101,1,10,10,4,10,108,0,8,10,4,10,102,1,8,299,1,1107,6,10,1006,0,85,1,1107,20,10,1,1008,18,10,3,8,1002,8,-1,10,1001,10,1,10,4,10,1008,8,0,10,4,10,1001,8,0,337,2,107,18,10,101,1,9,9,1007,9,951,10,1005,10,15,99,109,683,104,0,104,1,21102,1,825594852248,1,21101,378,0,0,1105,1,482,21101,0,387240006552,1,21101,0,389,0,1106,0,482,3,10,104,0,104,1,3,10,104,0,104,0,3,10,104,0,104,1,3,10,104,0,104,1,3,10,104,0,104,0,3,10,104,0,104,1,21101,0,29032025091,1,21101,436,0,0,1106,0,482,21101,29033143299,0,1,21102,1,447,0,1105,1,482,3,10,104,0,104,0,3,10,104,0,104,0,21101,988669698916,0,1,21101,0,470,0,1106,0,482,21101,0,709052072804,1,21102,1,481,0,1106,0,482,99,109,2,21202,-1,1,1,21101,0,40,2,21101,0,513,3,21101,503,0,0,1106,0,546,109,-2,2105,1,0,0,1,0,0,1,109,2,3,10,204,-1,1001,508,509,524,4,0,1001,508,1,508,108,4,508,10,1006,10,540,1101,0,0,508,109,-2,2105,1,0,0,109,4,1202,-1,1,545,1207,-3,0,10,1006,10,563,21102,0,1,-3,21202,-3,1,1,22101,0,-2,2,21102,1,1,3,21101,582,0,0,1105,1,587,109,-4,2106,0,0,109,5,1207,-3,1,10,1006,10,610,2207,-4,-2,10,1006,10,610,21202,-4,1,-4,1106,0,678,22102,1,-4,1,21201,-3,-1,2,21202,-2,2,3,21102,629,1,0,1106,0,587,22102,1,1,-4,21101,0,1,-1,2207,-4,-2,10,1006,10,648,21102,0,1,-1,22202,-2,-1,-2,2107,0,-3,10,1006,10,670,21202,-1,1,1,21101,670,0,0,105,1,545,21202,-2,-1,-2,22201,-4,-2,-4,109,-5,2106,0,0

"""
}
