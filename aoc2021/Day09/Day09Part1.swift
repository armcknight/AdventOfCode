//
//  Day09Part1.swift
//  aoc2021
//
//  Created by Andrew McKnight on Dec 5, 2021.
//

import Foundation

public extension Day09 {
    var part1: Int {
        let grid = rawValue.intGrid
        let filtered = grid.enumerated().map { row in
            row.1.enumerated().map { col -> Int in
                grid.neighbors4Array(row: row.0, col: col.0).count(where: { $0 <= col.1 }) == 0 ? col.1 + 1 : 0
            }
        }

        let describable = filtered as Array<Array<CustomStringConvertible>>
        print(describable.gridDescription)

        return filtered.reduce(0) { rowResult, next in
            rowResult + next.sum
        }
    }
}
