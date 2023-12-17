//
//  Day13Part1.swift
//  aoc2023
//
//  Created by Andrew McKnight on Dec 12, 2023.
//

import Foundation
import SwiftArmcknight

public extension Day13 {
    func testSplit(grid: [[String]], index: Int, offset: Int = 0) -> Bool {
        print("testSplit with index: \(index), offset: \(offset)")
        
        let vectorIdx = index - offset
        let nextVectorIdx = index + 1 + offset
        if vectorIdx < 0 || nextVectorIdx >= grid.count {
            print("Recursion terminated with vectorIdx: \(vectorIdx) and nextVectorIdx: \(nextVectorIdx)")
            return true
        }
        let vector = grid[vectorIdx]
        let nextVector = grid[nextVectorIdx]
        print("""
        Testing match of
            vector: \(vector.joined())
        nextVector: \(nextVector.joined())
        """)
        
        for cellIdx in 0..<vector.count {
            let cell = vector[cellIdx]
            let opposingCell = nextVector[cellIdx]
            if cell != opposingCell {
                return false
            }
        }
        
        return testSplit(grid: grid, index: index, offset: offset + 1)
    }
    
    func findPotentialSplit(grid: [[String]]) -> Int? {
        for vectorIdx in 0..<grid.count {
            if vectorIdx == grid.count - 1 {
                print("No splits found")
                break
            }
            
            if testSplit(grid: grid, index: vectorIdx) {
                print("Found split at index: \(vectorIdx)")
                return vectorIdx
            }
        }
        return nil
    }
    
    var part1: Int {
        var rows = 0
        var cols = 0
        
        let grids = rawValue.paragraphs
        for nextGrid in grids {
            let grid = nextGrid.characterGrid
            print("Inspecting grid: \(grid.printGrid())")
            print("Looking for row splits")
            if let splitRow = findPotentialSplit(grid: grid) {
                rows += splitRow + 1
            } else {
                print("Looking for column splits")
                let transpose = nextGrid.transpose
                if let splitCol = findPotentialSplit(grid: transpose) {
                    cols += splitCol + 1
                }
            }
        }
        
        print("Found \(rows) row splits and \(cols) column splits")
        return cols + 100 * rows
    }
}
