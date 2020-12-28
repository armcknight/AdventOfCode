//
//  Day13Part2.swift
//  aoc2020
//
//  Created by Andrew McKnight on Dec 18, 2020.
//

import aocHelpers
import Foundation

public func day13Part2(_ input: String) -> Int {
    var lines = input.lines
    let time = lines.removeFirst().integerValue
    let bussesAndOffsets = lines[0]
        .split(separator: ",")
        .reduce(into: [(String, Int)](), { (result, next) in
            result.append((String(next), result.count))
        })
        .filter({ $0.0 != "x" })
        .reduce(into: [(Int, Int)]()) { (result, next) in
            guard next.0 != "x" else { return }
            result.append((next.0.integerValue, next.1))
        }

    return -1
}
