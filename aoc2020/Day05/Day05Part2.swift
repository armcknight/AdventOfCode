//
//  Day05Part2.swift
//  aoc2020
//
//  Created by Andrew McKnight on Dec 18, 2020.
//

import aocHelpers
import Foundation

public func day05Part2(_ input: String) -> Int? {
    let list = input.split(separator: "\n").map({seatID(code: String($0))}).sorted()
    var i = 0
    while (i < list.count - 1) {
        let a = list[i]
        let b = list[i+1]
        if b - a == 2 {
            return a + 1
        }
        i += 1
    }
    return nil
}
