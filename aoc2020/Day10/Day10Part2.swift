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
//    print("counting permutations in \(array)")

    if permutations.contains(array) {
//        print("already counted \(array)")
        return 0
    }
    permutations.append(array)

    var t = 0
    for i in 1 ..< array.count - 1 {
        var tempArray = array
        let removed = tempArray.remove(at: i)

        if permutations.contains(tempArray) {
//            print("already counted \(array)")
            continue
        }

//        print("next permutation: \(tempArray) after removing \(removed)")

        let diff = tempArray[i] - tempArray[i - 1]
        if 1 <= diff && diff <= 3 {
//            print("valid permutation: \(tempArray)")
            t += 1 + permutations(array: tempArray)
        }
    }
//    print("\(array) contains \(t) valid permutations")
    return t
}

public func day10Part2(input: String) -> Int {
    let sortedInput = input.lineIntegers.sorted()
    let sortedRatings = [0] + sortedInput + [sortedInput.last! + 3]
    return permutations(array: sortedRatings) + 1
}
