//
//  Day9Part1.swift
//  aoc2020
//
//  Created by Andrew McKnight on Dec 18, 2020.
//

import aocHelpers
import Foundation

func findError(codes: [Int], codeAge: Int) -> Int? {
    var accepted = [Int]()
    func isValid(code: Int) -> Bool {
        for i in max(0, accepted.count - codeAge)..<accepted.count {
            for j in max(0, accepted.count - codeAge)..<accepted.count {
                if i == j {
                    continue
                }
                let a = accepted[i]
                let b = accepted[j]
                if a + b == code {
                    print("code == a + b => \(code) == \(a) + \(b)")
                    return true
                }
            }
        }
        return false
    }
    var i = 0
    for number in codes {
        if i < codeAge {
            print("accepting preamble code: \(number)")
            accepted.append(number)
        } else if isValid(code: number) {
            print("accepting valid code: \(number)")
            accepted.append(number)
        } else {
            return number
        }
        i += 1
    }
    return nil
}

public func day9Part1(_ input: String, codeAge: Int) -> Int {
    let codes = input.split(separator: "\n").map({Int($0)!})
    return findError(codes: codes, codeAge: codeAge)!
}
