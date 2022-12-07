//
//  Day07Part2.swift
//  aoc2022
//
//  Created by Andrew McKnight on Dec 4, 2022.
//

import aocHelpers
import Foundation

public extension Day07 {
    var part2: Int {
        buildFilesystem(input: rawValue)
        let available = 70000000 - root.totalSize()
        let needed = 30000000 - available
        let sorted = allDirectories.map { $0.totalSize() }.sorted()
        let result = sorted.first {
            $0 >= needed
        }!

        return result
    }
}
