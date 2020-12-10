//
//  Part2.swift
//  aoc2020-Day1
//
//  Created by Andrew McKnight on 12/9/20.
//

import aocHelpers
import Foundation

public func find2020By3(_ input: String) -> Int? {
    let list = input.integers
    for x in list {
        for y in list {
            for z in list {
                if x + y + z == 2020 {
                    return x * y * z
                }
            }
        }
    }
    return nil
}
