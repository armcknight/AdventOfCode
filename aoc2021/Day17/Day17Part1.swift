//
//  Day17Part1.swift
//  aoc2021
//
//  Created by Andrew McKnight on Dec 5, 2021.
//

import aocHelpers
import Foundation

let triangularNumbers = [0, 1, 3, 6, 10, 15, 21, 28, 36, 45, 55, 66, 78, 91, 105, 120, 136, 153, 171, 190, 210, 231, 253, 276, 300, 325, 351, 378, 406, 435, 465, 496, 528, 561, 595, 630, 666]

public extension Day17 {

    var part1: Int {
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
        var candidates = [(x: Int, y: Int, yMax: Int)]()
        for xV0 in xVMin.offset ..< 300 {
            for yV0 in 0..<300 {
                var x = 0
                var y = 0
                var xV = xV0
                var yV = yV0
                var yFlightMax = 0
                func simulate() -> (x: Int, y: Int, yMax: Int)? {
                    while (x <= xMax && y >= yMax) {
                        x += xV
                        y += yV
                        yFlightMax = max(y, yFlightMax)
                        if x >= xMin && x <= xMax && y >= yMin && y <= yMax {
                            // target area hit
                            return(x: xV0, y: yV0, yMax: yFlightMax)
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

        let result = candidates.max { (a, b) -> Bool in
            a.yMax < b.yMax
        }!
        return result.yMax
    }
}
