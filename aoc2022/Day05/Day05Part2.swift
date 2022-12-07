//
//  Day05Part2.swift
//  aoc2022
//
//  Created by Andrew McKnight on Dec 4, 2022.
//

import aocHelpers
import Foundation

public extension Day05 {
    static func part2(input: ([[String]], String)) -> String {
        var stacks = input.0
        input.1.lines.map { line -> (amount: Int, from: Int, to: Int) in
            let result = try! line.regexResult(from: #"move (\d*) from (\d*) to (\d*)"#)
            return (Int(result[1, line])!, Int(result[2, line])! - 1, Int(result[3, line])! - 1)
        }.forEach {
            let items = stacks[$0.from].reversed()[0 ..< $0.amount].reversed()
            for _ in 0 ..< $0.amount { stacks[$0.from].removeLast() }
            stacks[$0.to].append(contentsOf: items)
        }

        return stacks.map({ $0.last! }).joined()
    }
}
