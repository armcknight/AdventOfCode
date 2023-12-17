//
//  Day15Part1.swift
//  aoc2023
//
//  Created by Andrew McKnight on Dec 16, 2023.
//

import Foundation
import SwiftArmcknight

public extension Day15 {
    var part1: Int {
        rawValue.split(separator: ",").reduce(0) { partialResult, next in
            partialResult + next.reduce(into: 0) { partialResult, char in
                partialResult = ((partialResult + Int(char.asciiValue!)) * 17) % 256
            }
        }
    }
}
