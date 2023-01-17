//
//  Day15Part1.swift
//  aoc2021
//
//  Created by Andrew McKnight on Dec 5, 2021.
//

import Foundation

public extension Day15 {
    var part1: Int {
        var grid = rawValue.intGrid
        grid[0][0] = 0
        var path = [(row: Int, col: Int, val: Int)]()
        var sums = [[Int]]()
        for row in 0..<grid.count {
            for col in 0..<grid.count {
                var frames = Array<Int>()
                let current = grid[row][col]
                if row > 0 {
                    frames.append(grid[row - 1][col])
                }
                if col > 0 {
                    frames.append(grid[row][col - 1])
                }
                grid[row][col] = (frames.sorted().first ?? 0) + current
//                print((grid as Array<Array<CustomStringConvertible>>).gridDescription)
            }
        }

        return grid.last!.last!
    }
}
