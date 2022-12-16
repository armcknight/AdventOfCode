//
//  Day02Part1.swift
//  aoc2020
//
//  Created by Andrew McKnight on Dec 18, 2020.
//

import aocHelpers
import Foundation

public extension Day02 {
    var part1: Int {
        let array = rawValue.components(separatedBy: "\n")
        let regex = try! NSRegularExpression(pattern: #"(\d*)\-(\d*) (\w): (.*)"#, options: [])
        var part1Result = 0
        array.forEach { next in
            let range = NSRange(next.startIndex..<next.endIndex, in: next)
            let match = regex.firstMatch(in: next, options: [], range: range)
            let a = Int(next[Range(match!.range(at: 1), in: next)!])!
            let b = Int(next[Range(match!.range(at: 2), in: next)!])!
            let letter = next[Range(match!.range(at: 3), in: next)!]
            let password = next[Range(match!.range(at: 4), in: next)!]
            func isValidForPart1() -> Bool {
                let occurrences = password.reduce(into: 0) { (innerResult, nextCharacter) in
                    if String(nextCharacter) == letter {
                        innerResult += 1
                    }
                }
                return occurrences >= a && occurrences <= b
            }
            if isValidForPart1() {
                part1Result += 1
            }
        }
        return part1Result
    }
}
