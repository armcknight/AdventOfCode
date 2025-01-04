//
//  Day18Part1.swift
//  aoc2023
//
//  Created by Andrew McKnight on Dec 20, 2023.
//

import Foundation
import SwiftArmcknight

let xMulMap = ["R": 1, "L": -1, "U": 0, "D": 0]
let yMulMap = ["R": 0, "L": 0, "U": -1, "D": 1]

public extension Day18 {
    var firstAttempt: Int {
//        let size = 700
        let size = 20
        var currentPosition = (y: size / 2, x: size / 2)
        var grid = [[Bool]](repeating: [Bool](repeating: false, count: size), count: size)
        var xMin = currentPosition.x
        var xMax = currentPosition.x
        var yMin = currentPosition.y
        var yMax = currentPosition.y
        let map = rawValue.lines.map { line -> (String, Int, String) in
            let parts = line.split(separator: " ")
            return (String(parts[0]), (parts[1] as NSString).integerValue, String(parts[2]))
        }.forEach {
            let yMul = yMulMap[$0.0]!
            let xMul = xMulMap[$0.0]!
            for i in 0..<$0.1 {
                grid[currentPosition.y + i * yMul][currentPosition.x + i * xMul] = true
            }
            currentPosition = (currentPosition.y + $0.1 * yMul, currentPosition.x + $0.1 * xMul)
            xMin = min(xMin, currentPosition.x)
            xMax = max(xMax, currentPosition.x)
            yMin = min(yMin, currentPosition.y)
            yMax = max(yMax, currentPosition.y)
        }
        print(grid.map({
            $0.map({
                $0 ? "#" : "."
            })
        }).printGrid())
//        print("xMin: \(xMin), xMax: \(xMax); yMin: \(yMin); yMax: \(yMax)")
        return grid.reduce(0) { partialResult, next in
            let indices = next.enumerated().filter { $0.element }
            guard indices.count >= 2 else { return partialResult}
            let sum = indices.pairs.reduce(0) { partialResult, next in
                var diff = next.b.offset - next.a.offset
//                print("diff: \(diff)")
                return partialResult + diff
            }
//            print("sum: \(sum)")
            return partialResult + sum + 1
        }
        
    }
    
    /**
     * strategy: compute the area using the gauss shoelace method: https://www.jamestanton.com/wp-content/uploads/2012/03/Cool-Math-Essay_June-2014_SHOELACE-FORMULA.pdf
     */
    var secondAttempt: Int {
        let startingPosition = (y: 50, x: 0)
        var currentPosition = (y: 50, x: 0)
        let map = rawValue.lines.map { line -> (String, Int, String) in
            let parts = line.split(separator: " ")
            return (String(parts[0]), (parts[1] as NSString).integerValue, String(parts[2]))
        }
        var vertices = map.map {
            let x = currentPosition.x + $0.1 * xMulMap[$0.0]!
            let y = currentPosition.y + $0.1 * yMulMap[$0.0]!
            currentPosition = (y: y, x: x)
            return currentPosition
        }
        
        vertices.insert(startingPosition, at: 0)
        vertices.append(startingPosition)
        
        return vertices.pairs.map({ next in
            let result = next.a.x * next.b.y - next.b.x * next.a.y
            print("next.a.x * next.b.y - next.b.x * next.a.y => \(next.a.x) * \(next.b.y) - \(next.b.x) * \(next.a.y) = \(result)")
            return result
        }).reduce(0, +) / 2
    }
    
    var part1: Int {
        let a = firstAttempt
        let b = secondAttempt
        return b
    }
}
