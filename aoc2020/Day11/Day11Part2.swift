//
//  Day11Part2.swift
//  aoc2020
//
//  Created by Andrew McKnight on 12/9/20.
//

import Foundation

public func iterateVisible(grid: [[String]], row: Int, col: Int) -> Int {
    /*
     8 directions going clockwise around X: a, b, c, d, e, f, g, h

      a   b   c
        a b c
      h h X d d
        g f e
      g   f   e

     */
    var visibleOccupiedSeats = Set<[String: Int]>()

    /// - Returns true if a seat is blocking view, false otherwise
    func test(row: Int, col: Int) -> Bool{
        let seat = grid[row][col]
        if seat == "#" {
            if visibleOccupiedSeats.insert(["x": row, "y": col]).inserted {
            }
            return true
        } else if seat == "L" {
            return true
        } else {
            return false
        }
    }

    var _row = row - 1
    var _col = col - 1
    while _col >= 0 && _row >= 0 {
        if test(row: _row, col: _col) { break }
        _col -= 1
        _row -= 1
    }
    _row = row - 1
    while _row >= 0 {
        if test(row: _row, col: col) { break }
        _row -= 1
    }
    _row = row - 1
    _col = col + 1
    while _col < grid.count && _row >= 0 {
        if test(row: _row, col: _col) { break }
        _col += 1
        _row -= 1
    }
    _col = col + 1
    while _col < grid.count {
        if test(row: row, col: _col) { break }
        _col += 1
    }
    _row = row + 1
    _col = col + 1
    while _col < grid.count && _row < grid.count {
        if test(row: _row, col: _col) { break }
        _col += 1
        _row += 1
    }
    _row = row + 1
    while _row < grid.count {
        if test(row: _row, col: col) { break }
        _row += 1
    }
    _row = row + 1
    _col = col - 1
    while _col >= 0 && _row < grid.count {
        if test(row: _row, col: _col) { break }
        _col -= 1
        _row += 1
    }
    _col = col - 1
    while _col >= 0 {
        if test(row: row, col: _col) { break }
        _col -= 1
    }

    return visibleOccupiedSeats.count
}

func transformGrid2(grid: [[String]]) -> [[String]] {
    var resultGrid = grid

    for i in 0 ..< grid.count {
        let row = grid[i]
        for j in 0 ..< row.count {
            let col = row[j]
            if col == "L" {
                if 0 == iterateVisible(grid: grid, row: i, col: j) {
                    resultGrid[i][j] = "#"
                }
            } else if col == "#" {
                if 5 <= iterateVisible(grid: grid, row: i, col: j) {
                    resultGrid[i][j] = "L"
                }
            }
        }
    }

    return resultGrid
}

public extension Day11 {
    var part2: Int {
        let grid = rawValue.characterGrid

        var lastGrid: [[String]]
        var nextGrid = grid
        repeat {
            lastGrid = nextGrid
            nextGrid = transformGrid2(grid: lastGrid)
        } while lastGrid != nextGrid

        return lastGrid.reduce(0) { (partial, next) -> Int in
            partial + next.reduce(0, { (partial, next) -> Int in
                partial + (next == "#" ? 1 : 0)
            })
        }
    }
}
