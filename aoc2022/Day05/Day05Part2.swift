//
//  Day05Part2.swift
//  aoc2022
//
//  Created by Andrew McKnight on Dec 4, 2022.
//

import aocHelpers
import Foundation

public extension Day05 {
    var part2: String {
        let parts = rawValue.components(separatedBy: "\n\n")
        var stacks = parts[0].stacks
        parts[1].lines.map { line -> (amount: Int, from: Int, to: Int) in
            let result = try! line.regexResult(from: #"move (\d*) from (\d*) to (\d*)"#)
            return (Int(result[1, line])!, Int(result[2, line])! - 1, Int(result[3, line])! - 1)
        }.forEach {
            let items = stacks[$0.from][0 ..< $0.amount]
            for _ in 0 ..< $0.amount { stacks[$0.from].removeFirst() }
            stacks[$0.to].insert(contentsOf: items, at: 0)
        }

        return stacks.map({ $0.first! }).joined()
    }
}
