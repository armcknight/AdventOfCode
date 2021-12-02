//
//  Day1Part2.swift
//  aoc2021
//
//  Created by Andrew McKnight on Nov 30, 2021.
//

import aocHelpers
import Foundation

public func day1Part2(_ input: String) -> Int {
    return Day1Part2.best(input)
}

enum Day1Part2 {
    static func original(_ input: String) -> Int {
        let depths = input.ints
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

    static func refactored(_ input: String) -> Int {
        input.ints.sums(windowSize: 3).pairs.count { $0.b > $0.a }
    }

    /// Not my solution, but it was pointed out that to compare two consecutive windows, you don't need to compare the values of the elements they have in common. So for `[1, 2, 3, 4, 5]` yielding 3-windows `[[1, 2, 3], [2, 3, 4], [3, 4, 5]]`, to compare the sums of the first two windows, you have `1 + 2 + 3 <> 2 + 3 + 4` -> `1 <> 4`, because both sides have `2 + 3`. This avoids having to actually compute the window sums, and requires less overall space for 4-windows vs 3-windows.
    static func best(_ input: String) -> Int {
        input.ints.windows(ofSize: 4).count { $0.last! > $0.first! }
    }
}
