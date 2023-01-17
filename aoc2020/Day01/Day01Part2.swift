//
//  Part2.swift
//  aoc2020-Day1
//
//  Created by Andrew McKnight on 12/9/20.
//

import Foundation

public extension Day01 {
    var part2: Int {
        let list = rawValue.ints
        for x in list {
            for y in list {
                for z in list {
                    if x + y + z == 2020 {
                        return x * y * z
                    }
                }
            }
        }
        return 0
    }
}
