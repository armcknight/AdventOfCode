//
//  Day6Part1.swift
//  aoc2020
//
//  Created by Andrew McKnight on Dec 18, 2020.
//

import aocHelpers
import Foundation

public func day6Part1(_ input: String) -> Int {
    let groups = input.replacingOccurrences(of: "\n\n", with: ";").split(separator: ";")
    return groups.reduce(0) { (partial, next) -> Int in
        var yesses = Set<String>()
        next.split(separator: "\n").forEach {
            for question in $0 {
                yesses.insert(String(question))
            }
        }
        return partial + yesses.count
    }
}
