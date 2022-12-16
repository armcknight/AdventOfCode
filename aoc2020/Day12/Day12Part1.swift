//
//  Day12Part1.swift
//  aoc2020
//
//  Created by Andrew McKnight on 12/9/20.
//

import aocHelpers
import Foundation

public struct Orientation {
    var facing = 0 // follow the unit circle; E = 0 or 360; N = 90; W = 180; S = 270
    var north = 0
    var east = 0
}

public extension Day12 {
    var part1: Int {
        let final = rawValue.lines.map({ line -> (String, Int) in
            var x = line
            let a = String(x.removeFirst())
            let b = Int(x)!
            return (a, b)
        }).reduce(into: Orientation()) { (result, next) in
            if next.0 == "N" {
                result.north += next.1
            } else if next.0 == "E" {
                result.east += next.1
            } else if next.0 == "W" {
                result.east -= next.1
            } else if next.0 == "S" {
                result.north -= next.1
            } else if next.0 == "L" {
                result.facing = (result.facing + next.1) % 360
            } else if next.0 == "R" {
                var new = result.facing - next.1
                while new < 0 {
                    new += 360
                }
                result.facing = new
            } else if next.0 == "F"{
                if result.facing == 90 {
                    result.north += next.1
                } else if result.facing == 0 {
                    result.east += next.1
                } else if result.facing == 180 {
                    result.east -= next.1
                } else if result.facing == 270 {
                    result.north -= next.1
                }
            } else { fatalError("unknown command") }
        }
        
        return abs(final.north) + abs(final.east)
    }
}
