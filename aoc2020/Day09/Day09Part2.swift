//
//  Day09Part2.swift
//  aoc2020
//
//  Created by Andrew McKnight on Dec 18, 2020.
//

import aocHelpers
import Foundation

func findWeakness(codes: [Int], errorCode: Int) -> Int? {
    for i in 0..<codes.count {
        for j in i+1..<codes.count {
            let nextRange = Array<Int>(codes[i...j])
            let nextSum = nextRange.reduce(0, { (partial, next) -> Int in
                partial + next
            })
            if nextSum > errorCode {
                break
            } else if nextSum == errorCode {
                let sorted = nextRange.sorted()
                return sorted.first! + sorted.last!
            }
        }
    }
    return nil
}

public func day09Part2(_ input: String, codeAge: Int) -> Int {
    let codes = input.split(separator: "\n").map({Int($0)!})
    return findWeakness(codes: codes, errorCode: day09Part1(input, codeAge: codeAge))!
}
