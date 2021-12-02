//
//  Day1Part1.swift
//  aoc2021
//
//  Created by Andrew McKnight on Nov 30, 2021.
//

import aocHelpers
import Foundation

public func day1Part1(_ input: String) -> Int {
    Day1Part1.refactored(input)
}

enum Day1Part1 {
    static func original(_ input: String) -> Int {
        let depths = input.ints
        var increases = 0
        for i in 0 ..< depths.count - 1 {
            let current = depths[i]
            let next = depths[i + 1]
            if next > current {
                increases += 1
            }
        }
        return increases
    }

    static func refactored(_ input: String) -> Int {
        input.ints.pairs.count { $0.b > $0.a}
    }
}
