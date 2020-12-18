//
//  Day11Part1.swift
//  aoc2020
//
//  Created by Andrew McKnight on 12/9/20.
//

import aocHelpers
import Foundation

func iterateNeighbors(grid: [[String]], i: Int, j: Int) -> Int {
    let xMin = max(i - 1, 0)
    let xMax = min(i + 1, grid.count - 1)
    let yMin = max(j - 1, 0)
    let yMax = min(j + 1, grid[i].count - 1)

    var adjacentSeats = 0
    for x in xMin ... xMax {
        for y in yMin ... yMax {
            if x == i && y == j {
                continue
            }
            if grid[x][y] == "#" {
                adjacentSeats += 1
            }
        }
    }
    return adjacentSeats
}

func transformGrid(grid: [[String]]) -> [[String]] {
    var resultGrid = grid

    for i in 0 ..< grid.count {
        let row = grid[i]
        for j in 0 ..< row.count {
            let col = row[j]
            if col == "L" {
                if 0 == iterateNeighbors(grid: grid, i: i, j: j) {
                    resultGrid[i][j] = "#"
                }
            } else if col == "#" {
                if 4 <= iterateNeighbors(grid: grid, i: i, j: j) {
                    resultGrid[i][j] = "L"
                }
            }
        }
    }

    return resultGrid
}

public func day11Part1(input: String) -> Int {
    let grid = input.characterGrid

    var lastGrid: [[String]]
    var nextGrid = grid
    repeat {
        lastGrid = nextGrid
        nextGrid = transformGrid(grid: lastGrid)
    } while lastGrid != nextGrid

    return lastGrid.reduce(0) { (partial, next) -> Int in
        partial + next.reduce(0, { (partial, next) -> Int in
            partial + (next == "#" ? 1 : 0)
        })
    }
}
