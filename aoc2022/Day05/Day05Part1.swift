//
//  Day05Part1.swift
//  aoc2022
//
//  Created by Andrew McKnight on Dec 4, 2022.
//

import aocHelpers
import Foundation
import PippinLibrary

extension Array<String> {
    /**
     * Given columnar input, return an array of columns, each of which is represented as an array of its elements.
     * For example, given the array of strings:
     * ```
     * [
     *  "a b c",
     *  "d e f",
     *  "g h i"
     * ]
     * ```
     * the result is `[["a", "d", "g"], ["b", "e", "h"], ["c", "f", "i"]]`.
     */
    var columns: [[String]] {
        guard count > 0 else { return [] }
        var columns = [[String]]()
        let numberOfCols = first!.components(separatedBy: .whitespaces).count
        for _ in 0 ..< numberOfCols {
            columns.append([String]())
        }
        forEach {
            let colElements = $0.components(separatedBy: .whitespaces)
            assert(colElements.count == numberOfCols)
            for i in 0 ..< numberOfCols {
                columns[i].append(colElements[i])
            }
        }
        return columns
    }
}

extension String {
    /**
     * Given columnar input, return an array of columns, each of which is represented as an array of its elements.
     * For example, given the string:
     * ```
     * """
     * a b c
     * d e f
     * g h i
     * """
     * ```
     * the result is `[["a", "d", "g"], ["b", "e", "h"], ["c", "f", "i"]]`.
     * - warning: The strings must all have the same number of elements delimited by whitespace.
     */
    var columns: [[String]] {
        guard count > 0 else { return [] }
        return lines.columns
    }
}

public extension Day05 {
    struct Problem {
        struct Stack {

        }

        struct Instruction {

        }

        var stack: Stack
        var instructions: [Instruction]
    }

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
