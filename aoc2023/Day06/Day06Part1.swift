//
//  Day06Part1.swift
//  aoc2023
//
//  Created by Andrew McKnight on Dec 5, 2023.
//

import Foundation
import SwiftArmcknight

public extension Day06 {
    var part1: Int {
        var spec = [(time: Int, distance: Int)]()
        let specValues = rawValue.lines.map { $0.split(separator: " ").dropFirst().map { String($0) } }
        for i in 0..<specValues[0].count {
            spec.append((time: specValues[0][i].integerValue, distance: specValues[1][i].integerValue))
        }
        return spec.reduce(1) { partialResult, next in
            var wins = 0
            for i in 0..<next.time {
                let timeToMove = next.time - i
                let speed = i
                let distance = timeToMove * speed
                if distance > next.distance {
                    wins += 1
                }
            }
            return partialResult * wins
        }
    }
}
