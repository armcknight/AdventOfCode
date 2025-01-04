//
//  Day16Part1.swift
//  aoc2023
//
//  Created by Andrew McKnight on Dec 16, 2023.
//

import Foundation
import SwiftArmcknight

public extension Day16 {
    var part1: Int {
        var grid = rawValue.characterGrid
        
        func fillRow(row: Int, start: Int, end: Int) {
            for i in start..<end {
                grid[row][i] = "#"
            }
        }
        func fillCol(col: Int, start: Int, end: Int) {
            for i in start..<end {
                grid[i][col] = "#"
            }
        }
        func navigate(row: Int, col: Int, direction: Direction) -> Bool {
            print(grid.printGrid(rowIndicator: row, colIndicator: col))
            let nextSightLine: [String]
            switch direction {
            case .north:
                nextSightLine = grid.northSightLine(row: row, col: col, fromLocation: true)
                guard let nextChange = nextSightLine.firstIndex(where: { $0 != "." && $0 != "|" }) else {
                    fillCol(col: col, start: 0, end: row - 1)
                    return false
                }
                let char = nextSightLine[nextChange]
                fillCol(col: col, start: nextChange + 1, end: row - 1)
                if char == "-" {
                    let east = navigate(row: row - nextChange, col: col, direction: .east)
                    let west = navigate(row: row - nextChange, col: col, direction: .west)
                    return east || west
                } else if char == "/" {
                    return navigate(row: row - nextChange, col: col, direction: .east)
                } else /* if char == "\\" */ {
                    return navigate(row: row - nextChange, col: col, direction: .west)
                }
            case .east:
                nextSightLine = grid.eastSightLine(row: row, col: col)
                guard let nextChange = nextSightLine.firstIndex(where: { $0 != "." && $0 != "-" }) else {
                    fillRow(row: row, start: col + 1, end: grid.count)
                    return false
                }
                let char = nextSightLine[nextChange]
                fillRow(row: row, start: col + 1, end: grid.first!.count - nextChange - 1)
                if char == "|" {
                    let north = navigate(row: row , col: col + nextChange, direction: .north)
                    let south = navigate(row: row, col: col + nextChange, direction: .south)
                    return north || south
                } else if char == "/" {
                    return navigate(row: row, col: col + nextChange, direction: .north)
                } else /* if char == "\\" */ {
                    return navigate(row: row, col: col + nextChange, direction: .south)
                }
            case .west:
                nextSightLine = grid.westSightLine(row: row, col: col, fromLocation: true)
                guard let nextChange = nextSightLine.firstIndex(where: { $0 != "." && $0 != "-" }) else {
                    fillRow(row: row, start: 0, end: col - 1)
                    return false
                }
                let char = nextSightLine[nextChange]
                fillRow(row: row, start: nextChange + 1, end: col - 1)
                if char == "|" {
                    let north = navigate(row: row , col: col - nextChange, direction: .north)
                    let south = navigate(row: row, col: col - nextChange, direction: .south)
                    return north || south
                } else if char == "/" {
                    return navigate(row: row, col: col - nextChange, direction: .south)
                } else /* if char == "\\" */ {
                    return navigate(row: row, col: col - nextChange, direction: .north)
                }
            case .south:
                nextSightLine = grid.southSightLine(row: row, col: col)
                guard let nextChange = nextSightLine.firstIndex(where: { $0 != "." && $0 != "|" }) else {
                    fillCol(col: col, start: row + 1, end: grid.count)
                    return false
                }
                let char = nextSightLine[nextChange]
                fillCol(col: col, start: row + 1, end: nextChange - 1)
                if char == "-" {
                    let east = navigate(row: row + nextChange, col: col, direction: .east)
                    let west = navigate(row: row + nextChange, col: col, direction: .west)
                    return east || west
                } else if char == "/" {
                    return navigate(row: row + nextChange, col: col, direction: .west)
                } else /* if char == "\\" */ {
                    return navigate(row: row + nextChange, col: col, direction: .east)
                }
            }
        }
        
        navigate(row: 0, col: 0, direction: .east)
        return -1
    }
}
