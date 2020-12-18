//
//  Day2Part2.swift
//  aoc2020
//
//  Created by Andrew McKnight on Dec 18, 2020.
//

import aocHelpers
import Foundation

public func day2Part2(_ input: String) -> Int {
    let array = input.components(separatedBy: "\n")
    let regex = try! NSRegularExpression(pattern: #"(\d*)\-(\d*) (\w): (.*)"#, options: [])
    var part2Result = 0
    array.forEach { next in
        let range = NSRange(next.startIndex..<next.endIndex, in: next)
        let match = regex.firstMatch(in: next, options: [], range: range)
        let a = Int(next[Range(match!.range(at: 1), in: next)!])!
        let b = Int(next[Range(match!.range(at: 2), in: next)!])!
        let letter = next[Range(match!.range(at: 3), in: next)!]
        let password = next[Range(match!.range(at: 4), in: next)!]
        func isValidForPart2() -> Bool {
            let matchAtA = String(password[password.index(password.startIndex, offsetBy: a - 1)]) == letter
            let matchAtB =  String(password[password.index(password.startIndex, offsetBy: b - 1)]) == letter
            return (matchAtA && !matchAtB) || (!matchAtA && matchAtB)
        }
        if isValidForPart2() {
            part2Result += 1
        }
    }
    return part2Result
}
