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
        for rowIdx in 1 ..< grid.count - 1 {
            for colIdx in 1 ..< grid[rowIdx].count - 1 {
                let others = grid.neighboringRowAndColMembers(row: rowIdx, col: colIdx)
                if [others.rowLeft, others.rowRight, others.colUp, others.colDown].reduce(false, { partialResult, others in
                    partialResult || others.filter{
                        $0 >= grid[rowIdx][colIdx]
                    }.count == 0
                }) {
                    visible += 1
                }
            }
        }
        return grid.count * 2 + (grid[0].count - 2) * 2 + visible
    }
}
