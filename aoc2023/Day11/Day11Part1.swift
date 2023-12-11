//
//  Day11Part1.swift
//  aoc2023
//
//  Created by Andrew McKnight on Dec 11, 2023.
//

import Foundation
import SwiftArmcknight

public extension Day11 {
    func compute(multiplier: Int) -> Int {
        let grid = rawValue.characterGrid
        let transposed = rawValue.transpose
        
        let emptyRows = grid.enumerated().filter { row in
            row.element.filter { char in
                char == "#"
            }.count == 0
        }.map { $0.offset }
                
        let emptyCols = transposed.enumerated().filter { col in
            col.element.filter { char in
                char == "#"
            }.count == 0
        }.map { $0.offset }
        
        let galaxies = grid.enumerated().reduce(into: [(row: Int, col: Int)]()) { partialResult, row in
            partialResult.append(contentsOf: row.element.enumerated().reduce(into: [(row: Int, col: Int)]()) { partialResult, col in
                if col.element == "#" {
                    partialResult.append((row: row.offset, col: col.offset))
                }
            })
        }
        
        var distances = 0
        for i in 0..<galaxies.count {
            for j in 0..<i {
                let maxRow = max(galaxies[i].row, galaxies[j].row)
                let minRow = min(galaxies[i].row, galaxies[j].row)
                let maxCol = max(galaxies[i].col, galaxies[j].col)
                let minCol = min(galaxies[i].col, galaxies[j].col)

                let transitedEmptyRows = emptyRows.filter { row in
                    minRow < row && row < maxRow
                }.count
                let transitedEmptyCols = emptyCols.filter { col in
                    minCol < col && col < maxCol
                }.count

                let distance = maxRow - minRow + maxCol - minCol - transitedEmptyRows + transitedEmptyRows * multiplier - transitedEmptyCols + transitedEmptyCols * multiplier
                distances += distance
            }
        }
        
        return distances
    }
    
    var part1: Int {
        compute(multiplier: 2)
    }
}
