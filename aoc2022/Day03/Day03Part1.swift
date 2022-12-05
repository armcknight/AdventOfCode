//
//  Day03Part1.swift
//  aoc2022
//
//  Created by Andrew McKnight on Dec 4, 2022.
//

import aocHelpers
import Foundation

public let priorities = Array("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ").reduce(into: [String: Int]()) { partialResult, next in
    partialResult[String(next)] = partialResult.count + 1
}

extension String {
    var midpoint: Index {
        index(startIndex, offsetBy: count / 2)
    }
    var halves: (String, String) {
        (String(self[startIndex ..< midpoint]), String(self[midpoint ..< endIndex]))
    }
}

public extension Day03 {
    var part1: Int {
        let halves = rawValue.lines.map { $0.halves }
        return halves.reduce(into: 0) { partialResult, next in
            let firstHalf = Set(Array(next.0))
            let secondHalf = Set(Array(next.1))
            let intersection = firstHalf.intersection(secondHalf)
            partialResult += intersection.reduce(into: 0, {
                $0 += priorities[String($1)]!
            })
        }
    }
}
