//
//  Day17Part2.swift
//  aoc2021
//
//  Created by Andrew McKnight on Dec 5, 2021.
//

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
