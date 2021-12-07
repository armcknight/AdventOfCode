//
//  Day07Part2.swift
//  aoc2021
//
//  Created by Andrew McKnight on Dec 5, 2021.
//

import aocHelpers
import FastMath
import Foundation

public extension Day07 {
    var part2: Int {
        let starts = rawValue.ints(separator: ",")

        let average = Int(starts.mean().rounded(.down))
        return starts.reduce(0) { (result, next) -> Int in
            result + abs(next - average).triangularNumber()
        }
    }
}
