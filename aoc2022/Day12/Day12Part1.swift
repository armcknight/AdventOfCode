//
//  Day12Part1.swift
//  aoc2022
//
//  Created by Andrew McKnight on Dec 4, 2022.
//

import aocHelpers
import Foundation
import SwiftArmcknight

let letters = Array(arrayLiteral: "abcdefghijklmnopqrstuvwxyz").enumerated().reduce(into: [String: Int]()) { partialResult, next in
    partialResult[next.element] = next.offset
}
public extension Day12 {
    var part1: Int {
        var startPosition: (row: Int, col: Int)!
        var endPosition: (row: Int, col: Int)!
        let grid = rawValue.lines.enumerated().map { row -> [Int] in
            Array(arrayLiteral: row.element).enumerated().map { col -> Int in
                if col.element == "S" {
                    startPosition = (row.offset, col.offset)
                    return -1
                }
                if col.element == "E" {
                    endPosition = (row.offset, col.offset)
                    return 100
                }
                return letters[col.element]!
            }
        }

        var currentPosition = startPosition!

        
        for row in grid.enumerated() {
            for col in row.element.enumerated() {

            }
        }
        while (currentPosition.row != endPosition.col && currentPosition.row != endPosition.col) {
            let neighbors: (Int?, Int?, Int?, Int?) = grid.neighbors4(row: currentPosition.row, col: currentPosition.col)

        }

        return -1
    }
}
