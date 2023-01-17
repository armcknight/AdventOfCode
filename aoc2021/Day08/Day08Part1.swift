//
//  Day08Part1.swift
//  aoc2021
//
//  Created by Andrew McKnight on Dec 5, 2021.
//

import Foundation

public extension Day08 {
    var part1: Int {
        let targetCounts = [2, 3, 4, 7] // counts for 1, 7, 4 and 8, respectively
        let cleaned = rawValue.lines.map { line -> [[String]] in
            let leftAndRight = line.split(separator: "|").map { String ($0) }
            let values = leftAndRight.map {
                $0.trimmingCharacters(in: .whitespacesAndNewlines).split(separator: " ").map { String($0) }
            }
            return values
        }.map { inputSet in
            (inputSet.first!, inputSet.last!)
        }
        let counts = cleaned.reduce(into: [Int: Int]()) { result, next in
            let counts = next.1.map(\.count).counts.filter({ frequency in
                targetCounts.contains(frequency.0)
            })
            counts.forEach { frequency in
                result[frequency.0, default: 0] += frequency.1
            }
        }

        return counts.reduce(0) { result, next in
            result + next.value
        }
    }
}
