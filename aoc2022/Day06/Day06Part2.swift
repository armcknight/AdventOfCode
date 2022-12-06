//
//  Day06Part2.swift
//  aoc2022
//
//  Created by Andrew McKnight on Dec 4, 2022.
//

import aocHelpers
import Foundation

public func findMessage(input: String) -> Int {
    return Array(input).windows(ofSize: 14).firstIndex {
        return Set($0).count == 14
    }! + 14
}

public extension Day06 {
    var part2: Int {
        findMessage(input: rawValue)
    }
}
