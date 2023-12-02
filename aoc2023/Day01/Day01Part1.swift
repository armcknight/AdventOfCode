//
//  Day01Part1.swift
//  aoc2023
//
//  Created by Andrew McKnight on Dec 2, 2023.
//

import Foundation
import SwiftArmcknight
import Then

public extension Day01 {
    var part1: Int {
        rawValue.lines.reduce(into: 0) { partialResult, line in
            let numbers = line.trimmingPrefix { char in
                CharacterSet.letters.contains(char.unicodeScalars.first!)
            }.reversed().trimmingPrefix { char in
                CharacterSet.letters.contains(char.unicodeScalars.first!)
            }
            let a = String(numbers.first!)
            let b = String(numbers.last!)
            partialResult += Int(b + a)!
        }
    }
}
