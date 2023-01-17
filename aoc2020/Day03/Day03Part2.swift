//
//  Day03Part2.swift
//  aoc2020
//
//  Created by Andrew McKnight on Dec 18, 2020.
//

import Foundation

public extension Day03 {
    var part2: Int {
        let forest = rawValue
        let a = treesOnPath(forest: forest, right: 1, down: 1)
        let b = treesOnPath(forest: forest, right: 3, down: 1)
        let c = treesOnPath(forest: forest, right: 5, down: 1)
        let d = treesOnPath(forest: forest, right: 7, down: 1)
        let e = treesOnPath(forest: forest, right: 1, down: 2)
        return a*b*c*d*e
    }
}
