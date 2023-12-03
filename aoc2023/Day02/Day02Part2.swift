//
//  Day02Part2.swift
//  aoc2023
//
//  Created by Andrew McKnight on Dec 2, 2023.
//

import Foundation
import SwiftArmcknight

public extension Day02 {
    var part2: Int {
        extract.map { game -> Int in
            var minRed: Int?
            var minGreen: Int?
            var minBlue: Int?
            game.1.forEach { colorCount in
                if let red = colorCount.red {
                    if let min = minRed {
                        minRed = max(min, red)
                    } else {
                        minRed = red
                    }
                }
                if let green = colorCount.green {
                    if let min = minGreen {
                        minGreen = max(min, green)
                    } else {
                        minGreen = green
                    }
                }
                if let blue = colorCount.blue {
                    if let min = minBlue {
                        minBlue = max(min, blue)
                    } else {
                        minBlue = blue
                    }
                }
            }
            return [minRed, minGreen, minBlue].compactMap{$0}.reduce(1, *)
        }.sum
    }
}
