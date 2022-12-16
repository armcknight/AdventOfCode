//
//  Day03Part1.swift
//  aoc2021
//
//  Created by Andrew McKnight on Nov 30, 2021.
//

import aocHelpers
import SwiftArmcknight
import Foundation

func counts(lines: [String]) -> [Int] {
    lines.reduce(into: Array<Int>(repeating: 0, count: lines.first!.count)) { (result, next) in
        var i = 0
        Array(next).forEach {
            if $0 == "1" {
                result[i] += 1
            }
            i += 1
        }
    }
}

public extension Day03 {
    var part1: Int {
        let lines = rawValue.lines
        var i = 0
        let gamma = counts(lines: lines).reversed().reduce(into: 0) { (result, next) in
            if next > lines.count / 2 {
                result += 2 ** i
            }
            i += 1
        }
        let epsilon = gamma ^ String(repeating: "1", count: lines.first!.count).decimalValueOfBinary

        return epsilon * gamma
    }
}
