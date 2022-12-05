//
//  Day09Description.swift
//  aoc2015
//
//  Created by Andrew McKnight on Dec 4, 2022.
//

/**
## --- Day 9: All in a Single Night ---

Every year, Santa manages to deliver all of his presents in a single
night.

This year, however, he has some <span
title="Bonus points if you recognize all of the locations.">new
locations</span> to visit; his elves have provided him the distances
between every pair of locations. He can start and end at any two
(different) locations he wants, but he must visit each location exactly
once. What is the *shortest distance* he can travel to achieve this?

For example, given the following distances:

London to Dublin = 464
London to Belfast = 518
Dublin to Belfast = 141

The possible routes are therefore:

Dublin -> London -> Belfast = 982
London -> Dublin -> Belfast = 605
London -> Belfast -> Dublin = 659
Dublin -> Belfast -> London = 659
Belfast -> Dublin -> London = 605
Belfast -> London -> Dublin = 982

The shortest of these is `London -> Dublin -> Belfast = 605`, and so the
answer is `605` in this example.

What is the distance of the shortest route?

*/
public enum Day09: String {
case sample = """
ondon to Dublin = 464
London to Belfast = 518
Dublin to Belfast = 141

"""

case input = """
Faerun to Norrath = 129
Faerun to Tristram = 58
Faerun to AlphaCentauri = 13
Faerun to Arbre = 24
Faerun to Snowdin = 60
Faerun to Tambi = 71
Faerun to Straylight = 67
Norrath to Tristram = 142
Norrath to AlphaCentauri = 15
Norrath to Arbre = 135
Norrath to Snowdin = 75
Norrath to Tambi = 82
Norrath to Straylight = 54
Tristram to AlphaCentauri = 118
Tristram to Arbre = 122
Tristram to Snowdin = 103
Tristram to Tambi = 49
Tristram to Straylight = 97
AlphaCentauri to Arbre = 116
AlphaCentauri to Snowdin = 12
AlphaCentauri to Tambi = 18
AlphaCentauri to Straylight = 91
Arbre to Snowdin = 129
Arbre to Tambi = 53
Arbre to Straylight = 40
Snowdin to Tambi = 15
Snowdin to Straylight = 99
Tambi to Straylight = 70

"""
}
