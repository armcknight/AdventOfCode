//
//  Day1Part2.swift
//  aoc2021
//
//  Created by Andrew McKnight on Nov 30, 2021.
//

import aocHelpers
import Foundation

public func day1Part2(_ input: String) -> Int {
    let depths = input.lineIntegers
    var increases = 0
    for i in 0 ..< depths.count - 3 {
        let a1 = depths[i]
        let a2 = depths[i + 1]
        let a3 = depths[i + 2]
        let sumA = a1 + a2 + a3

        let b1 = depths[i + 1]
        let b2 = depths[i + 2]
        let b3 = depths[i + 3]
        let sumB = b1 + b2 + b3

        if sumB > sumA {
            increases += 1
        }
    }
    return increases
}
