//
//  Day03Part1.swift
//  aoc2023
//
//  Created by Andrew McKnight on Dec 2, 2023.
//

import Foundation
import SwiftArmcknight

public extension Day03 {
    var part1: Int {
        let grid = rawValue.characterGrid
        return rawValue.lines.enumerated().reduce(into: [(lineNumber: Int, range: NSRange, number: Int)]()) { partialResult, next in
            try! next.element.enumerateMatches(with: #"(\d+)"#, block: { result in
                let numberString = result[1, next.element]
//                print("testing \(numberString)")
                func recordPartNumber() {
//                    print("recording part number \(numberString)")
                    let partNumber = (lineNumber: next.offset, range: result.range, number: Int(numberString)!)
                    partialResult.append(partNumber)
                }
                for offset in 0..<numberString.count {
                    let neighbors: [[String]].Neighbor8<String> = grid.neighbors8(row: next.offset, col: result.range.location + offset)
                    if offset == 0, let left = neighbors.left, left != "." {
                        recordPartNumber()
                        break
                    } else if offset == result.range.length - 1, let right = neighbors.right, right != "." {
                        recordPartNumber()
                        break
                    } else if [neighbors.up, neighbors.down, neighbors.upRight, neighbors.leftUp, neighbors.downLeft, neighbors.rightDown].compactMap({$0}).contains(where: { neighbor in
                        neighbor != "."
                    }) {
                        recordPartNumber()
                        break
                    }
                }
            })
        }.reduce(0) { partialResult, next in
            partialResult + next.number
        }
    }
}
