//
//  Day09Part2.swift
//  aoc2022
//
//  Created by Andrew McKnight on Dec 4, 2022.
//

import Foundation

public extension Day09 {
    var part2: Int {
        var knotPositions = Array(repeating: (x: 0, y:0), count: 10)

        func printBoard() {
            let limit = 10
            var board = Array(repeating: Array(repeating: ".", count: limit * 2), count: limit * 2)
            for (i, knot) in knotPositions.enumerated() {
                if board[knot.y + limit][knot.x + limit] == "." {
                    board[knot.y + limit][knot.x + limit] = String(i)
                }
            }

            board.printGrid()
        }

        let tailVisited = NSMutableOrderedSet()
        func insertTailVisited(x: Int, y: Int) {
            if !tailVisited.contains([x, y]) {
                print("adding tail position: \(x),\(y)")
            }
            tailVisited.insert([x, y], at: tailVisited.count)
        }
        insertTailVisited(x: 0, y: 0)

        func adjustDiagonally(direction: String, leadingKnotIndex: Int, trailingKnotIndex: Int) {
            let xOrtho = orthoFactors[direction]!.0
            let yOrtho = orthoFactors[direction]!.1
            let xFactor = orthoFactors[direction]!.2
            let yFactor = orthoFactors[direction]!.3

            if yFactor != 0 && knotPositions[trailingKnotIndex].x * xOrtho < knotPositions[leadingKnotIndex].x * xOrtho {
                if knotPositions[trailingKnotIndex].y * yOrtho < knotPositions[leadingKnotIndex].y * yOrtho {
                    knotPositions[trailingKnotIndex].y += yFactor
                } else if knotPositions[trailingKnotIndex].y * yOrtho > knotPositions[leadingKnotIndex].y * yOrtho {
                    knotPositions[trailingKnotIndex].y -= yFactor
                }
            }

            if xFactor != 0 && knotPositions[trailingKnotIndex].y * yOrtho < knotPositions[leadingKnotIndex].y * yOrtho {
                if knotPositions[trailingKnotIndex].x * xOrtho < knotPositions[leadingKnotIndex].x * xOrtho {
                    knotPositions[trailingKnotIndex].x += xFactor
                } else if knotPositions[trailingKnotIndex].x * xOrtho > knotPositions[leadingKnotIndex].x * xOrtho {
                    knotPositions[trailingKnotIndex].x -= xFactor
                }
            }
        }

        func performMove(direction: String, leadingKnotIndex: Int, trailingKnotIndex: Int) {
            let xFactor = moveFactors[direction]!.0
            let yFactor = moveFactors[direction]!.1

            adjustDiagonally(direction: direction, leadingKnotIndex: leadingKnotIndex, trailingKnotIndex: trailingKnotIndex)

            if knotPositions[trailingKnotIndex].x * xFactor < knotPositions[leadingKnotIndex].x * xFactor {
                knotPositions[trailingKnotIndex].x += xFactor
            }
            if knotPositions[trailingKnotIndex].y * yFactor < knotPositions[leadingKnotIndex].y * yFactor {
                knotPositions[trailingKnotIndex].y += yFactor
            }

            knotPositions[leadingKnotIndex].x += xFactor
            knotPositions[leadingKnotIndex].y += yFactor

            print("moved knot \(leadingKnotIndex) to \(knotPositions[leadingKnotIndex]); knot \(trailingKnotIndex) to \(knotPositions[trailingKnotIndex])")
        }

        rawValue.stringsAndInts.forEach { move in
            print("Performing move \(move)")

            for dist in 0 ..< move.1 {
                for knotIdx in (max(0, knotPositions.count - dist - 2) ... knotPositions.count - 2).reversed() {
                    performMove(direction: move.0, leadingKnotIndex: knotIdx + 1, trailingKnotIndex: knotIdx)
                }
                print("---")
            }

            insertTailVisited(x: knotPositions.first!.x, y: knotPositions.first!.y)
//            printBoard()
        }
        return tailVisited.count
    }
}
