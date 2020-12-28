//
//  Day13Part1.swift
//  aoc2020
//
//  Created by Andrew McKnight on Dec 18, 2020.
//

import aocHelpers
import Foundation

public func day13Part1(_ input: String) -> Int {
    var lines = input.lines
    let time = lines.removeFirst().integerValue
    let busses = lines[0].split(separator: ",").filter({ $0 != "x" }).map({ $0.integerValue })
    let nextDepartures = busses.reduce(into: [(Int, Int)]()) { (result, next) in
        result.append((next, Int(ceil(Double(time) / Double(next))) * next - time))
    }
    let sorted = nextDepartures.sorted { (a, b) -> Bool in
        return a.1 < b.1
    }

    return sorted.first!.0 * sorted.first!.1
}
