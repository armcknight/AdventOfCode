//
//  Day06Part2.swift
//  aoc2021
//
//  Created by Andrew McKnight on Dec 5, 2021.
//

import aocHelpers
import Foundation

public extension Day06 {
    var part2: Int {
        return simulate0(input: rawValue)
    }

    func simulate0(input: String) -> Int {
        var fish = input.ints(separator: ",").reduce(into: Array(repeating: 0, count: 9)) { (result, next) in
            result[next] += 1
        }
        for _ in 0 ..< 256 {
            let hatchlings = fish.first!
            for i in 0..<8 {
                fish[i] = fish[i+1]
            }
            fish[6] += hatchlings
            fish[8] = hatchlings
        }
        return fish.sum
    }

    /* these are the most efficient solutions I've found but I'm not certain why they work yet; they don't involve a LSFR (left-shift feedback register) as there's no shifting of each value down to represent ages of counts; instead, the 7 and 8 positions seem to represent age, but then the value at 7 is added to each day in a rotating fashion and I'm not sure why that accomplishes counts and ages */

    /// from https://www.reddit.com/r/adventofcode/comments/r9z49j/comment/hnfue6a/?utm_source=share&utm_medium=web2x&context=3
    func simulate1(input: String) -> Int {
        var fish = input.ints(separator: ",").counts
        (0 ..< 256).forEach {
            fish[($0 + 7) % 9, default: 0] += fish[$0 % 9] ?? 0
        }
        return fish.values.reduce(0, +)
    }

    /// from https://gist.github.com/natecook1000/b169012fdbaeb9324be0455afb0a7c2b
    func simulate2(input: String) -> Int {
        var fish = input.ints(separator: ",").counts
        (0 ..< 256).forEach {
            let hatchlings = fish[$0 % 7] ?? 0

            fish[$0 % 7, default: 0] += fish[7] ?? 0

            fish[7] = fish[8] ?? 0
            fish[8] = hatchlings
        }
        return fish.values.reduce(0, +)
    }
}
