//
//  Day03Part1.swift
//  aoc2021
//
//  Created by Andrew McKnight on Nov 30, 2021.
//

import aocHelpers
import FastMath
import Foundation

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

public func day03Part1(_ input: String) -> Int {
    let lines = input.lines
    var i = 0
    let gamma = counts(lines: lines).ones.reversed().reduce(into: 0) { (result, next) in
        if next > lines.count / 2 {
            result += 2 ** i
        }
        i += 1
    }
    let epsilon = gamma ^ String(repeating: "1", count: lines.first!.count).decimalValueOfBinary

    return epsilon * gamma
}
