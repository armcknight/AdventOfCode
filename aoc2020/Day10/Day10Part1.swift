//
//  Day10Part1.swift
//  aoc2020
//
//  Created by Andrew McKnight on 12/9/20.
//

import aocHelpers
import Foundation

public func differences(sortedRatings: [Int]) -> [Int: Int] {
    var differences = [Int: Int]()
    for i in 0 ..< sortedRatings.count - 1 {
        let a = sortedRatings[i]
        let b = sortedRatings[i + 1]
        let diff = b - a
        if let _ = differences[diff] {
            differences[diff]! += 1
        } else {
            differences[diff] = 1
        }
    }
    return differences
}

public func day10Part1(input: String) -> Int {
    let sortedInput = input.ints.sorted()
    let sortedRatings = [0] + sortedInput + [sortedInput.last! + 3]
    let diffs = differences(sortedRatings: sortedRatings)
    return (diffs[1] ?? 0) * (diffs[3] ?? 0)
}
