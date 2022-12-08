//
//  Day08Part1.swift
//  aoc2022
//
//  Created by Andrew McKnight on Dec 4, 2022.
//

import aocHelpers
import Foundation

public extension Day08 {
    var part1: Int {
        let grid = rawValue.intGrid
        var visible = 0
        grid.enumerate(allOffsets: 1) { row, col, height in
            let ranges = [
                
            ]

            let others = grid.sightLineRanges(row: row, col: col)
            if [
                others.rowLeft,
                others.rowRight,
                others.colUp,
                others.colDown
            ].reduce(false, { partialResult, others in
                partialResult || others.filter{
                    $0 >= height
                }.count == 0
            }) {
                visible += 1
            }
        }
        return grid.count * 2 + (grid[0].count - 2) * 2 + visible
    }
}
