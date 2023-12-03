//
//  Day03Part2.swift
//  aoc2023
//
//  Created by Andrew McKnight on Dec 2, 2023.
//

import Foundation
import SwiftArmcknight

public extension Day03 {
    var part2: Int {
        let grid = rawValue.characterGrid
        let lookup = rawValue.lines.enumerated().reduce(into: /* map each * location to all neighbors*/[CGPoint: [Int]]()) { partialResult, next in
            try! next.element.enumerateMatches(with: #"(\d+)"#, block: { result in
                let numberString = result[1, next.element]
                func recordPartNumber(x: Int, y: Int) {
                    let partNumber = Int(numberString)!
                    let key = CGPoint(x: x, y: y)
                    if partialResult[key] == nil {
                        partialResult[key] = [partNumber]
                    } else {
                        partialResult[key]!.append(partNumber)
                    }
                }
                for offset in 0..<numberString.count {
                    let neighbors: [[String]].Neighbor8<String> = grid.neighbors8(row: next.offset, col: result.range.location + offset)
                    if offset == 0, let left = neighbors.left, left == "*" {
                        recordPartNumber(x: result.range.location - 1, y: next.offset)
                        break
                    } else if offset == result.range.length - 1, let right = neighbors.right, right == "*" {
                        recordPartNumber(x: result.range.location + result.range.length, y: next.offset)
                        break
                    } else if let up = neighbors.up, up == "*" {
                        recordPartNumber(x: result.range.location + offset, y: next.offset - 1)
                        break
                    } else if let down = neighbors.down, down == "*" {
                        recordPartNumber(x: result.range.location + offset, y: next.offset + 1)
                        break
                    } else if let upLeft = neighbors.leftUp, upLeft == "*" {
                        recordPartNumber(x: result.range.location + offset - 1, y: next.offset - 1)
                        break
                    } else if let upRight = neighbors.upRight, upRight == "*" {
                        recordPartNumber(x: result.range.location + offset + 1, y: next.offset - 1)
                        break
                    } else if let downLeft = neighbors.downLeft, downLeft == "*" {
                        recordPartNumber(x: result.range.location + offset - 1, y: next.offset + 1)
                        break
                    } else if let downRight = neighbors.rightDown, downRight == "*" {
                        recordPartNumber(x: result.range.location + offset + 1, y: next.offset + 1)
                        break
                    }
                }
            })
        }
        
//        print(lookup)
        
        return lookup.reduce(into: 0) { partialResult, next in
            if next.value.count == 2 {
//                print("partialResult += next.value[0] * next.value[1] => \(partialResult) += \(next.value[0]) * \(next.value[1])")
                partialResult += next.value[0] * next.value[1]
            }
        }
    }
}
