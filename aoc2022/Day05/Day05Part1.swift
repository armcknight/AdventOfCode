//
//  Day05Part1.swift
//  aoc2022
//
//  Created by Andrew McKnight on Dec 4, 2022.
//

import aocHelpers
import Foundation
import SwiftArmcknight

extension String {
    /**
     * convert
     * ```
     *     [D]
     * [N] [C]
     * [Z] [M] [P]
     * ```
     * to
     * ```
     * [
     *  [ " ", "[", "[" ],
     *  [ " ", "N", "Z" ],
     *  [ " ", "]", "]" ],
     *  [ "[", "[", "[" ],
     *  [ "D", "C", "M" ],
     *  ... etc
     * ]
     * ```
     * then take every row not containing a bracket.
     */
    var stacks: [[String]] {
        transpose.filter {
            !($0.contains("[") || $0.contains("]"))
        }.map {
            Array($0).filter {
                $0.rangeOfCharacter(from: .decimalDigits) == nil
            }
        }.filter {
            !(Set($0).count == 1 && $0[0] == " ")
        }.map {
            $0.filter {
                $0 != " "
            }
        }
    }
}

public extension Day05 {
    var part1: String {
        let parts = rawValue.components(separatedBy: "\n\n")
        var stacks = parts[0].stacks
        print("stacks: \(stacks)")
        parts[1].lines.map { line -> (amount: Int, from: Int, to: Int) in
            let result = try! line.regexResult(from: #"move (\d*) from (\d*) to (\d*)"#)
            return (Int(result[1, line])!, Int(result[2, line])! - 1, Int(result[3, line])! - 1)
        }.forEach {
            for _ in 0 ..< $0.amount {
                let item = stacks[$0.from].removeFirst()
                stacks[$0.to].insert(item, at: 0)
            }
            print("stacks: \(stacks)")
        }

        return stacks.map({ $0.first! }).joined()
    }
}
