//
//  Day07Part1.swift
//  aoc2021
//
//  Created by Andrew McKnight on Dec 5, 2021.
//

import aocHelpers
import SwiftArmcknight
import Foundation

public extension Day07 {
    var part1: Int {
        let starts = rawValue.ints(separator: ",")
        let startMedian = starts.median
        return starts.reduce(0) { (result, next) -> Int in
            result + abs(next - startMedian)
        }
    }
}
