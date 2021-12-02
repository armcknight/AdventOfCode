//
//  Day10Part2.swift
//  aoc2020
//
//  Created by Andrew McKnight on 12/9/20.
//

import aocHelpers
import Foundation

var permutations = [[Int]]()

/// Doesn't move the first and last elements as those must remain fixed
func permutations(array: [Int]) -> Int {
    if permutations.contains(array) {
        return 0
    }
    permutations.append(array)

    var t = 0
    for i in 1 ..< array.count - 1 {
        var tempArray = array
        _ = tempArray.remove(at: i)

        if permutations.contains(tempArray) {
            continue
        }

        let diff = tempArray[i] - tempArray[i - 1]
        if 1 <= diff && diff <= 3 {
            t += 1 + permutations(array: tempArray)
        }
    }
    return t
}

public func day10Part2(input: String) -> Int {
    let sortedInput = input.ints.sorted()
    let sortedRatings = [0] + sortedInput + [sortedInput.last! + 3]
    return permutations(array: sortedRatings) + 1
}
