//
//  Day1Part1.swift
//  aoc2021
//
//  Created by Andrew McKnight on Nov 30, 2021.
//

import aocHelpers
import Foundation

public func day1Part1(_ input: String) -> Int {
    let depths = input.lineIntegers
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
