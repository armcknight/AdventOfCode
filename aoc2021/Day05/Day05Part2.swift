//
//  Day05Part2.swift
//  aoc2021
//
//  Created by Andrew McKnight on Nov 30, 2021.
//

import aocHelpers
import Foundation

public func day05Part2(_ input: String) -> Int {
    var maxX = 0
    var maxY = 0
    let edges = input.lines.map { line -> ((Int, Int), (Int, Int)) in
        var edge: ((Int, Int), (Int, Int))? = nil
        try! line.enumerateMatches(with: #"(\d*),(\d*) -> (\d*),(\d*)"#) { (result) in
            let x1 = Int(result[1, line])!
            let y1 = Int(result[2, line])!
            let x2 = Int(result[3, line])!
            let y2 = Int(result[4, line])!
            maxX = max(max(maxX, x1 + 1), max(maxX, x2 + 1))
            maxY = max(max(maxY, y1 + 1), max(maxY, y2 + 1))
            edge = ((x1, y1), (x2, y2))
        }
        return edge!
    }

    let initialGrid = Array<[Int]>(repeating: Array<Int>(repeating: 0, count: maxY), count: maxX)
    let grid = edges.reduce(into: initialGrid) { (grid, nextEdge) in
        if nextEdge.0.0 == nextEdge.1.0 || nextEdge.0.1 == nextEdge.1.1 {
            let x1 = nextEdge.0.0 < nextEdge.1.0 ? nextEdge.0.0 : nextEdge.1.0
            let x2 = x1 == nextEdge.0.0 ? nextEdge.1.0 : nextEdge.0.0
            let y1 = nextEdge.0.1 < nextEdge.1.1 ? nextEdge.0.1 : nextEdge.1.1
            let y2 = y1 == nextEdge.0.1 ? nextEdge.1.1 : nextEdge.0.1
            if x1 == x2 {
                for y in (y1...y2) {
                    grid[x1][y] += 1
                }
            } else {
                for x in (x1...x2) {
                    grid[x][y1] += 1
                }
            }
        } else {
            let x1 = nextEdge.0.0 < nextEdge.1.0 ? nextEdge.0.0 : nextEdge.1.0
            let x2 = x1 == nextEdge.0.0 ? nextEdge.1.0 : nextEdge.0.0
            let y1 = x1 == nextEdge.0.0 ? nextEdge.0.1 : nextEdge.1.1
            let y2 = y1 == nextEdge.0.1 ? nextEdge.1.1 : nextEdge.0.1
            let xsGtxe = x1 > x2
            let ysGtye = y1 > y2
            var x = x1
            var y = y1
            while ((xsGtxe && x >= x2) || x <= x2) && ((ysGtye && y >= y2) || y <= y2) {
                grid[x][y] += 1
                x = xsGtxe ? x - 1 : x + 1
                y = ysGtye ? y - 1 : y + 1
            }
        }
    }

    return grid.reduce(0) { result, next in
        result + next.reduce(0) { result, next in
            result + (next >= 2 ? 1 : 0)
        }
    }
}
