//
//  Day06Part1.swift
//  aoc2021
//
//  Created by Andrew McKnight on Dec 5, 2021.
//

import Foundation

public extension Day06 {
    var part1: Int {
        var fish = rawValue.split(separator: ",").map { $0.integerValue }
        (0..<80).forEach { day in
            var newFish = [Int]()
            fish = fish.map { nextFish -> Int in
                if nextFish == 0 {
                    newFish.append(8)
                    return 6
                } else {
                    return nextFish - 1
                }
            }
            fish.append(contentsOf: newFish)
        }
        return fish.count
    }
}
