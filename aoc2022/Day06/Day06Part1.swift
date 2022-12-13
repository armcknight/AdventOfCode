//
//  Day06Part1.swift
//  aoc2022
//
//  Created by Andrew McKnight on Dec 4, 2022.
//

import aocHelpers
import Foundation
import SwiftArmcknight

public extension Day06 {
    var part1: Int {
        return Array(rawValue).windows(ofSize: 4).firstIndex {
            return Set($0).count == 4
        }! + 4
    }
}
