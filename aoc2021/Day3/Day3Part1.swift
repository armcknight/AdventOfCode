//
//  Day3Part1.swift
//  aoc2021
//
//  Created by Andrew McKnight on Nov 30, 2021.
//

import aocHelpers
import Foundation

precedencegroup ExponentiationPrecedence {
    associativity: right
    higherThan: MultiplicationPrecedence
}

infix operator **: ExponentiationPrecedence

public func **<T>(base: T, power: T) -> T where T: BinaryInteger {
    return exponentiate(base, power)
}

func exponentiate<T>(_ base: T, _ power: T) -> T where T: BinaryInteger {
    if power == 0 { return 1 }
    var result = base
    var mutablePower = power
    while mutablePower > 1 {
        result *= base
        mutablePower -= 1 as T
    }
    return result
}

func counts(lines: [String]) -> (zeros: [Int], ones: [Int]) {
    let ones = lines.reduce(into: Array<Int>(repeating: 0, count: lines.first!.count)) { (result, next) in
        var i = 0
        Array(next).forEach {
            if $0 == "1" {
                result[i] += 1
            }
            i += 1
        }
    }
    let zeros = lines.reduce(into: Array<Int>(repeating: 0, count: lines.first!.count)) { (result, next) in
        var i = 0
        Array(next).forEach {
            if $0 == "0" {
                result[i] += 1
            }
            i += 1
        }
    }
    return (zeros, ones)
}

public func day3Part1(_ input: String) -> Int {
    let lines = input.lines
    var i = 0
    let gamma = counts(lines: lines).ones.reversed().reduce(into: 0) { (result, next) in
        if next > lines.count / 2 {
            result += 2 ** i
        }
        i += 1
    }
    let epsilon = gamma ^ decimalValue(binaryNumber: String(repeating: "1", count: lines.first!.count)) 

    return epsilon * gamma
}
