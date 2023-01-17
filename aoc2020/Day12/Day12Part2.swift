//
//  Day12Part2.swift
//  aoc2020
//
//  Created by Andrew McKnight on 12/9/20.
//

import Foundation

public extension Day12 {
    var part2: Int {
        let final = rawValue.lines.map({ line -> (String, Int) in
            var x = line
            let a = String(x.removeFirst())
            let b = Int(x)!
            return (a, b)
        }).reduce(into: (waypoint: Orientation(facing: 0, north: 1, east: 10), ship: Orientation())) { (result, next) in
            if next.0 == "N" {
                result.waypoint.north += next.1
            } else if next.0 == "E" {
                result.waypoint.east += next.1
            } else if next.0 == "W" {
                result.waypoint.east -= next.1
            } else if next.0 == "S" {
                result.waypoint.north -= next.1
            } else if next.0 == "L" {
                for _ in stride(from: 0, to: next.1, by: 90) {
                    let north = result.waypoint.east
                    let east = result.waypoint.north * -1
                    result.waypoint.north = north
                    result.waypoint.east = east
                }
            } else if next.0 == "R" {
                for _ in stride(from: 0, to: next.1, by: 90) {
                    let north = result.waypoint.east * -1
                    let east = result.waypoint.north
                    result.waypoint.north = north
                    result.waypoint.east = east
                }
            } else if next.0 == "F"{
                for _ in 0 ..< next.1 {
                    result.ship.north += result.waypoint.north
                    result.ship.east += result.waypoint.east
                }
            } else { fatalError("unknown command") }
        }
        
        return abs(final.ship.north) + abs(final.ship.east)
    }
}
