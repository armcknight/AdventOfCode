//
//  Day1.swift
//  aoc2020
//
//  Created by Andrew McKnight on 12/9/20.
//

import aocHelpers
import Foundation

public func find2020By2(_ input: String) -> Int? {
    let list = input.integers
    for x in list {
        for y in list {
            if x + y == 2020 {
                return x * y
            }
        }
    }
    return nil
}
