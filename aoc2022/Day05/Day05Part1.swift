//
//  Day05Part1.swift
//  aoc2022
//
//  Created by Andrew McKnight on Dec 4, 2022.
//

import aocHelpers
import Foundation
import PippinLibrary

public extension Day05 {
    static func part1(input: ([[String]], String)) -> String {
        var stacks = input.0
        input.1.lines.map { line -> (amount: Int, from: Int, to: Int) in
            let result = try! line.regexResult(from: #"move (\d*) from (\d*) to (\d*)"#)
            return (Int(result[1, line])!, Int(result[2, line])! - 1, Int(result[3, line])! - 1)
        }.forEach {
            for _ in 0 ..< $0.amount {
                let item = stacks[$0.from].removeLast()
                stacks[$0.to].append(item)
            }
        }

        return stacks.map({ $0.last! }).joined()
    }
}
