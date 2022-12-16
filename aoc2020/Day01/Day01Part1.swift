//
//  Day1.swift
//  aoc2020
//
//  Created by Andrew McKnight on 12/9/20.
//

import aocHelpers
import Foundation

public extension Day01 {
    var part1: Int {
        let list = rawValue.ints
        for x in list {
            for y in list {
                if x + y == 2020 {
                    return x * y
                }
            }
        }
        return 0
    }
}
