//
//  Day01Part1.swift
//  aoc2022
//
//  Created by Andrew McKnight on Dec 4, 2022.
//

import Foundation
import SwiftArmcknight

public extension Day01 {
    var part1: Int {
        rawValue.components(separatedBy: "\n\n").reduce(into: 0) { partialResult, next in
            partialResult = max(partialResult, String(next).ints.sum)
        }
    }
}
