//
//  Day09Part1.swift
//  aoc2022
//
//  Created by Andrew McKnight on Dec 4, 2022.
//

import aocHelpers
import Foundation
import PippinLibrary

public extension Day09 {
    var part1: Int {
        var headPosition = (x: 0, y:0)
        var tailPosition = (x: 0, y:0)
        let tailVisited = NSMutableOrderedSet()

        func insertTailVisited(x: Int, y: Int) {
            if !tailVisited.contains([x, y]) {
                print("adding tail position: \(x),\(y)")
            }
            tailVisited.insert([x, y], at: tailVisited.count)
        }

        insertTailVisited(x: 0, y: 0)

        let orthoFactors = [
            "R": (1, 1, 0, 1),
            "L": (-1, 1, 0, 1),
            "U": (1, 1, 1, 0),
            "D": (1, -1, 1, 0)
        ]

        func adjustDiagonally(move: (String, Int)) {
            let xOrtho = orthoFactors[move.0]!.0
            let yOrtho = orthoFactors[move.0]!.1
            let xFactor = orthoFactors[move.0]!.2
            let yFactor = orthoFactors[move.0]!.3

            if yFactor != 0 && tailPosition.x * xOrtho < headPosition.x * xOrtho {
                if tailPosition.y * yOrtho < headPosition.y * yOrtho {
                    tailPosition.y += yFactor
                } else if tailPosition.y * yOrtho > headPosition.y * yOrtho {
                    tailPosition.y -= yFactor
                }
            }

            if xFactor != 0 && tailPosition.y * yOrtho < headPosition.y * yOrtho {
                if tailPosition.x * xOrtho < headPosition.x * xOrtho {
                    tailPosition.x += xFactor
                } else if tailPosition.x * xOrtho > headPosition.x * xOrtho {
                    tailPosition.x -= xFactor
                }
            }
        }

        let moveFactors = [
            "R": (1, 0),
            "L": (-1, 0),
            "U": (0, 1),
            "D": (0, -1)
        ]

        func perform(move: (String, Int)) {
            for _ in 0 ..< move.1 {
                let xFactor = moveFactors[move.0]!.0
                let yFactor = moveFactors[move.0]!.1

                adjustDiagonally(move: move)

                if tailPosition.x * xFactor < headPosition.x * xFactor {
                    tailPosition.x += xFactor
                }
                if tailPosition.y * yFactor < headPosition.y * yFactor {
                    tailPosition.y += yFactor
                }

                headPosition.x += xFactor
                headPosition.y += yFactor
                insertTailVisited(x: tailPosition.x, y: tailPosition.y)
            }
        }

        rawValue.stringsAndInts.forEach { move in
            perform(move: move)
        }
        return tailVisited.count
    }
}
