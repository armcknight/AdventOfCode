//
//  Day2Part2.swift
//  aoc2021
//
//  Created by Andrew McKnight on Nov 30, 2021.
//

import aocHelpers
import Foundation

public func day2Part2(_ input: String) -> Int {
    Day2Part2.refactored(input)
}

enum Day2Part2 {
    static func original(_ input: String) -> Int {
        var h = 0
        var v = 0
        var aim = 0
        input.lines.map({ (line) -> (String, Int) in
            let components = line.split(separator: " ")
            return (String(components.first!), components.last!.integerValue)
        }).forEach {
            if $0.0 == "up" {
                aim -= $0.1
            } else if $0.0 == "down" {
                aim += $0.1
            } else {
                h += $0.1
                v += aim * $0.1
            }
        }
        return v * h
    }

    static func refactored(_ input: String) -> Int {
        var aim = 0
        return input.lines.stringsAndInts.reduce(into: [0, 0]) { // v, h
            switch $1.0 {
            case "forward":
                $0[0] += aim * $1.1
                $0[1] += $1.1
            default: aim += $1.1 * ($1.0 == "up" ? -1 : 1)
            }
        }.reduce(1, *)
    }
}
