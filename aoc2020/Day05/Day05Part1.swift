//
//  Day05Part1.swift
//  aoc2020
//
//  Created by Andrew McKnight on Dec 18, 2020.
//

import Foundation

func seatID(code: String) -> Int {
    var minRow = 0
    var maxRow = 127
    var minCol = 0
    var maxCol = 7
    for char in code {
        if char == "B" {
            minRow += Int(ceil(Double((maxRow - minRow)) / 2.0))
        } else if char == "F" {
            maxRow -= Int(floor(Double((maxRow - minRow)) / 2.0))
        } else if char == "R" {
            minCol += Int(ceil(Double((maxCol - minCol)) / 2.0))
        } else {
            maxCol -= Int(floor(Double((maxCol - minCol)) / 2.0))
        }
    }
    return minRow * 8 + minCol
}

public extension Day05 {
    var part1: Int {
        let list = rawValue.split(separator: "\n").map({seatID(code: String($0))}).sorted()
        return list.last!
    }
}
