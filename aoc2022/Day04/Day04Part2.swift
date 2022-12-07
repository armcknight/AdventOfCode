//
//  Day04Part2.swift
//  aoc2022
//
//  Created by Andrew McKnight on Dec 4, 2022.
//

import aocHelpers
import Foundation

public extension Day04 {
    var part2: Int {
        return rawValue.lines.map { line -> (ClosedRange<Int>, ClosedRange<Int>) in
            let ranges = line.split(separator: ",").map { rangeDesc -> ClosedRange<Int> in
                let bounds = String(rangeDesc).split(separator: "-").map { bound -> Int in
                    String(bound).integerValue
                }
                return bounds[0]...bounds[1]
            }
            return (ranges[0], ranges[1])
        }.reduce(0, { partialResult, nextRangePair in
            return partialResult + (nextRangePair.0.overlaps(other: nextRangePair.1) || nextRangePair.1.overlaps(other: nextRangePair.0) ? 1 : 0)
        })
    }
}
