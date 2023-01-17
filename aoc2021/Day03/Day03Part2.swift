//
//  Day03Part2.swift
//  aoc2021
//
//  Created by Andrew McKnight on Nov 30, 2021.
//

import SwiftArmcknight
import Foundation

func mostCommontDigit(idx: Int, lines: [String]) -> String {
    let count = lines.reduce(into: 0) { (result, next) in
        if Array(next)[idx] == "1" {
            result += 1
        }
    }
    return count >= (lines.count / 2) + (lines.count % 2) ? "1" : "0"
}

public extension Day03 {
    var part2: Int {
        let lines = rawValue.lines
        
        var i = 0
        var o2filtered = lines
        var co2filtered = lines
        while co2filtered.count > 1 || o2filtered.count > 1 {
            let mostCommonDigit = mostCommontDigit(idx: i, lines: o2filtered)
            if o2filtered.count > 1 {
                let mostCommonDigit = mostCommontDigit(idx: i, lines: o2filtered)
                o2filtered = o2filtered.filter { line in
                    let lineSplit = Array(line).map { String($0) }
                    return lineSplit[i] == mostCommonDigit
                }
            }
            if co2filtered.count > 1 {
                let mostCommonDigit = mostCommontDigit(idx: i, lines: co2filtered)
                let leastCommonDigit = mostCommonDigit == "1" ? "0" : "1"
                co2filtered = co2filtered.filter { line in
                    let lineSplit = Array(line).map { String($0) }
                    return lineSplit[i] == leastCommonDigit
                }
            }
            i += 1
        }
        
        let o2 = o2filtered.first!.decimalValueOfBinary
        let co2 = co2filtered.first!.decimalValueOfBinary
        
        return o2 * co2
    }
}
