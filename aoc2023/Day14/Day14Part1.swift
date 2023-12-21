//
//  Day14Part1.swift
//  aoc2023
//
//  Created by Andrew McKnight on Dec 16, 2023.
//

import Foundation
import SwiftArmcknight

public extension Day14 {
    var part1: Int {
        var grid = rawValue.characterGrid
//        print(grid.printGrid())
        var load = 0
        for rowIdx in 1..<grid.count {
            let row = grid[rowIdx]
            for colIdx in 0..<row.count {
                let col = row[colIdx]
                guard col == "O" else { continue }
                let northSightLine: [String] = grid.northSightLine(row: rowIdx, col: colIdx)
//                print(northSightLine)
                if let firstStopIndex = northSightLine.lastIndex(where: { $0 == "#" || $0 == "O" }) {
                    if firstStopIndex < rowIdx - 1 {
//                        print("moving to grid[\(firstStopIndex + 1)][\(colIdx)]")
                        grid[firstStopIndex + 1][colIdx] = "O"
                        grid[rowIdx][colIdx] = "."
                    }
                } else {
//                    print("moving to top")
                    grid[0][colIdx] = "O"
                    grid[rowIdx][colIdx] = "."
                }
//                print(grid.printGrid(rowIndicator: rowIdx, colIndicator: colIdx))
            }
        }
        return grid.enumerated().reduce(0) { partialResult, row in
            partialResult + (grid.count - row.offset) * row.element.filter({ $0 == "O" }).count
        }
    }
}
