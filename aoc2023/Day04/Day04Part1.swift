//
//  Day04Part1.swift
//  aoc2023
//
//  Created by Andrew McKnight on Dec 3, 2023.
//

import Foundation
import SwiftArmcknight

public extension Day04 {
    var part1: Int {
        rawValue.lines.reduce(0) { partialResult, line in
            let parts = line.split(separator: ":")[1].split(separator: "|")
            let winningNumbers = Set(String(parts[0]).ints(separator: " "))
            let cardNumbers = Set(String(parts[1]).ints(separator: " "))
            let matches = winningNumbers.intersection(cardNumbers)
//            print("winningNumbers: \(winningNumbers); cardNumbers: \(cardNumbers); matches: \(matches)")
            if matches.isEmpty {
                return partialResult
            }
            return partialResult + (2 ** (matches.count - 1))
        }
    }
}
