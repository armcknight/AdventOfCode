//
//  Day04Part1.swift
//  aoc2020
//
//  Created by Andrew McKnight on Dec 18, 2020.
//

import aocHelpers
import Foundation

public extension Day04 {
    var part1: Int {
        return rawValue.replacingOccurrences(of: "\n\n", with: ";")
            .split(separator: ";")
            .filter({$0.count > 0})
            .map({String($0)})
            .reduce(0, { (partial, next) -> Int in
                let fields = next.replacingOccurrences(of: "\n", with: " ")
                    .split(separator: " ")
                let hasCID = fields.contains { (string) -> Bool in
                    string.contains("cid")
                }
                let valid = (hasCID && fields.count == 8) || (!hasCID && fields.count == 7)
                return partial + (valid ? 1 : 0)
            })
    }
}
