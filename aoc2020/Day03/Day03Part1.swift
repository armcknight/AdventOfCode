//
//  Day03Part1.swift
//  aoc2020
//
//  Created by Andrew McKnight on Dec 18, 2020.
//

import aocHelpers
import Foundation

func treesOnPath(forest: String, right: Int, down: Int) -> Int {
    let array = forest.split(separator: "\n")
    var downProgress = 0
    var rightProgress = 0
    var treeCount = 0
    repeat {
        downProgress += down
        let line = array[downProgress]
        rightProgress = (rightProgress + right) % line.count
        print("rightProgress: \(rightProgress); downProgress: \(downProgress)")
        if String(line[line.index(line.startIndex, offsetBy: rightProgress)]) == "#" {
            treeCount += 1
        }
        print("treeCount: \(treeCount)")
    } while downProgress < array.count - 1
    return treeCount
}

public extension Day03 {
    var part1: Int {
        return treesOnPath(forest: rawValue, right: 3, down: 1)
    }
}
