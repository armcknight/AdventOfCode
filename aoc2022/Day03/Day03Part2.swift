//
//  Day03Part2.swift
//  aoc2022
//
//  Created by Andrew McKnight on Dec 4, 2022.
//

import aocHelpers
import Foundation
import SwiftArmcknight

public extension Day03 {
    var part2: Int {
        rawValue.lines.chunk(intoSubarraysOfSize: 3).reduce(into: 0) {
            $0 += priorities[String(Set(Array($1[0])).intersection(Set(Array($1[1]))).intersection(Set(Array($1[2]))).first!)]!
        }
    }
}
