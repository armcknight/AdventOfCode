//
//  Day17Part2.swift
//  aoc2021
//
//  Created by Andrew McKnight on Dec 5, 2021.
//

import aocHelpers
import Foundation

public extension Day17 {
    var part2: Int {
        var xMin: Int = 0
        var xMax: Int = 0
        var yMin: Int = 0
        var yMax: Int = 0
        try! rawValue.enumerateMatches(with: #"target area: x=(\-?\d*)..(\-?\d*), y=(\-?\d*)..(\-?\d*)"#) { (result) in
            xMin = result[1, rawValue].integerValue
            xMax = result[2, rawValue].integerValue
            yMin = result[3, rawValue].integerValue
            yMax = result[4, rawValue].integerValue
        }

        /// this is the min x velocity at which the probe would wind up falling straight down toward the target area, drawing the highest arc path; lower velocity will never reach the target area; higher velocity may pass through the area on one of the steps, but will trace out a lower arc
        let xVMin = triangularNumbers.enumerated().filter { $0.1 >= xMin && $0.1 <= xMax }.first!

        // see if there's a y velocity that can combine with xVMin to hit the target area; if not, we'll need to start increasing x beyond xVMin and trying again
        var candidates = [(x: Int, y: Int)]()
        for xV0 in 0 ... xMax {
            for yV0 in yMin ..< 600 {
                var x = 0
                var y = 0
                var xV = xV0
                var yV = yV0
                func simulate() -> (x: Int, y: Int)? {
                    while (x <= xMax && y >= yMin) {
                        x += xV
                        y += yV
                        if x >= xMin && x <= xMax && y >= yMin && y <= yMax {
                            // target area hit
                            return(x: xV0, y: yV0)
                        }
                        xV = xV > 0 ? xV - 1 : xV < 0 ? xV + 1 : 0
                        yV = yV - 1
                    }
                    return nil
                }
                if let candidate = simulate() {
                    candidates.append(candidate)
                }
            }
        }

        return candidates.count
    }
}
