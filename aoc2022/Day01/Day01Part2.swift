//
//  Day01Part2.swift
//  aoc2022
//
//  Created by Andrew McKnight on Dec 4, 2022.
//

import aocHelpers
import Foundation
import FastMath
import PippinLibrary

public extension Day01 {
    var part2: Int {
        rawValue.components(separatedBy: "\n\n").map { $0.ints.sum }.sorted().reversed()[0..<3].sum
    }
}