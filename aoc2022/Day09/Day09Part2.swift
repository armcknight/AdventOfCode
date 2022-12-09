//
//  Day09Part2.swift
//  aoc2022
//
//  Created by Andrew McKnight on Dec 4, 2022.
//

import aocHelpers
import Foundation

public extension Day09 {
    var part2: Int {
        var knotPositions = Array(repeating: (x: 0, y:0), count: 10)
        let tailVisited = NSMutableOrderedSet()
        func insertTailVisited(x: Int, y: Int) {
            if !tailVisited.contains([x, y]) {
                print("adding tail position: \(x),\(y)")
            }
            tailVisited.insert([x, y], at: tailVisited.count)
        }
        insertTailVisited(x: 0, y: 0)

        func printBoard() {
            let limit = 100
            var board = Array(repeating: Array(repeating: ".", count: limit), count: limit)
            for (i, knot) in knotPositions.enumerated() {
                board[knot.x + limit / 2][knot.y + limit / 2] = String(i)
            }
            print(board.map({ row in
                row.joined(separator: " ")
            }).joined(separator: "\n"))
            print(String(repeating: "-", count: 50))
        }

        func performMove(move: (String, Int)) {

        }

        rawValue.stringsAndInts.forEach { move in
            print("move: \(move)")

                if move.0 == "R" {
                    for distFactor in (0 ..< move.1).reversed() {
                        for knotIdx in 0 ..< knotPositions.count - 1 {
                            let dist = distFactor - knotIdx
                            if knotPositions[knotIdx + 1].y < knotPositions[knotIdx].y && knotPositions[knotIdx + 1].x < knotPositions[knotIdx].x {
                                knotPositions[knotIdx + 1].y += dist
                            } else if knotPositions[knotIdx + 1].y > knotPositions[knotIdx].y && knotPositions[knotIdx + 1].x < knotPositions[knotIdx].x {
                                knotPositions[knotIdx + 1].y -= dist
                            }

                            if knotPositions[knotIdx + 1].x < knotPositions[knotIdx].x {
                                knotPositions[knotIdx + 1].x += dist
                            }

                            knotPositions[knotIdx].x += dist
                        }
                    }
                } else if move.0 == "L" {
                    for distFactor in (0 ..< move.1).reversed() {
                        for knotIdx in 0 ..< knotPositions.count - 1 {
                            let dist = distFactor - knotIdx
                            if knotPositions[knotIdx + 1].y < knotPositions[knotIdx].y && knotPositions[knotIdx + 1].x > knotPositions[knotIdx].x {
                                knotPositions[knotIdx + 1].y += dist
                            } else if knotPositions[knotIdx + 1].y > knotPositions[knotIdx].y && knotPositions[knotIdx + 1].x > knotPositions[knotIdx].x {
                                knotPositions[knotIdx + 1].y -= dist
                            }

                            if knotPositions[knotIdx + 1].x > knotPositions[knotIdx].x {
                                knotPositions[knotIdx + 1].x -= dist
                            }

                            knotPositions[knotIdx].x -= dist
                        }
                    }
                } else if move.0 == "U" {
                    for distFactor in (0 ..< move.1).reversed() {
                        for knotIdx in 0 ..< knotPositions.count - 1 {
                            let dist = distFactor - knotIdx
                            if knotPositions[knotIdx + 1].x < knotPositions[knotIdx].x && knotPositions[knotIdx + 1].y < knotPositions[knotIdx].y {
                                knotPositions[knotIdx + 1].x += dist
                            } else if knotPositions[knotIdx + 1].x > knotPositions[knotIdx].x && knotPositions[knotIdx + 1].y < knotPositions[knotIdx].y {
                                knotPositions[knotIdx + 1].x -= dist
                            }

                            if knotPositions[knotIdx + 1].y < knotPositions[knotIdx].y {
                                knotPositions[knotIdx + 1].y += dist
                            }

                            knotPositions[knotIdx].y += dist
                        }
                    }
                } else /* if move.0 == "D" */ {
                    for distFactor in (0 ..< move.1).reversed() {
                        for knotIdx in 0 ..< knotPositions.count - 1 {
                            let dist = distFactor - knotIdx
                            if knotPositions[knotIdx + 1].x < knotPositions[knotIdx].x && knotPositions[knotIdx + 1].y > knotPositions[knotIdx].y {
                                knotPositions[knotIdx + 1].x += dist
                            } else if knotPositions[knotIdx + 1].x > knotPositions[knotIdx].x && knotPositions[knotIdx + 1].y > knotPositions[knotIdx].y {
                                knotPositions[knotIdx + 1].x -= dist
                            }

                            if knotPositions[knotIdx + 1].y > knotPositions[knotIdx].y {
                                knotPositions[knotIdx + 1].y -= dist
                            }

                            knotPositions[knotIdx].y -= dist
                        }
                    }
                }
            insertTailVisited(x: knotPositions.first!.x, y: knotPositions.first!.y)

            printBoard()
        }
        return tailVisited.count
    }
}
