//
//  Day08Part2.swift
//  aoc2022
//
//  Created by Andrew McKnight on Dec 4, 2022.
//

import aocHelpers
import Foundation

public extension Day08 {
    var part2: Int {
        let grid = rawValue.intGrid
        var highestScore = 0
        grid.enumerate(allOffsets: 1) { row, col, height in
            let others: SightLines = grid.sightLineRanges(row: row, col: col)

            let score = [
                (others.rowLeft, true),
                (others.rowRight, false),
                (others.colUp, true),
                (others.colDown, false)
            ].reduce(1) { partialResult, others in
                var distance = 0
                var highest = -1
                for i in 0 ..< others.0.count {
                    let nextTree = others.1 ? others.0.reversed()[i] : others.0[i]
                    if nextTree >= height {
                        distance += 1
                        break
                    } else if nextTree >= highest {
                        distance += 1
                        highest = nextTree
                    } else {
                        distance += 1
                    }
                }
                return partialResult * distance
            }

            if score > highestScore {
                highestScore = score
            }
        }
        return highestScore
    }
}
