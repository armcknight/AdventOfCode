//
//  Day11Part1.swift
//  aoc2021
//
//  Created by Andrew McKnight on Dec 5, 2021.
//

import aocHelpers
import Foundation

public extension Day11 {
    var part1: Int {
        var grid = rawValue.intGrid
        func flash(row: Int, col: Int) -> Set<CGPoint> {
            if grid[row][col] > 9 { return Set() }
            grid[row][col] += 1
            var toFlash = Set<CGPoint>()
            if grid[row][col] > 9 {
                toFlash.insert(CGPoint(x: row, y: col))
                grid.neighbors8Coordinates(row: row, col: col).forEach {
                    toFlash.formUnion(flash(row: Int($0.x), col: Int($0.y)))
                }
            }
            return toFlash
        }
        func step() -> Int {
            var toFlash = Set<CGPoint>()
            grid.enumerated().forEach { row in
                grid[row.0].enumerated().forEach { col in
                    toFlash.formUnion(flash(row: row.0, col: col.0))
                }
            }
            toFlash.forEach {
                grid[Int($0.x)][Int($0.y)] = 0
            }
            return toFlash.count
        }
        return (0 ..< 100).reduce(0) { result, _ in
            let describable = grid as Array<Array<CustomStringConvertible>>
            print(describable.gridDescription)

            return result + step()
        }
    }
}
