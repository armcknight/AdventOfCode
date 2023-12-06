//
//  Day06Part2.swift
//  aoc2023
//
//  Created by Andrew McKnight on Dec 5, 2023.
//

import Foundation
import SwiftArmcknight

public extension Day06 {
    /*
     * This solution exploits the binomial-like distribution of distances. Instead of directly calculating all such distances, only generate up to the first winning distance; we already know how many will exist in the binomial distribution for that level (like how we know how many terms are in pascal's triangle at every level corresponding to the exponent of the binomial expansion).
     *
     * The terms are as follows:
     *          0               N=0
     *         0 0              N=1
     *       0  1  0            N=2
     *      0  2  2 0           N=3
     *     0 3  4  3  0         N=4
     *    0 4  6  6  4  0       N=5
     *   0 5  8  9  8  5 0      N=6
     *  0 6 10 12 12 10  6 0    N=7
     * 0 7 12 15 16 15 12 7 0   N=8
     *
     * The bottom row can be rewritten as:
     * N=7: 0 (N-1) (N-1+4) (N-1+4+2) ...
     * N=8: 0 (N-1) (N-1+5) (N-1+5+3) (N-1+5+3+1) ...
     * After the (N-1) term, we start adding numbers, starting with a number equal to N-3, then additional terms subtracting 2 each time.
     */
    var part2: Int {
        let specValues = rawValue.lines.map { $0.split(separator: " ").dropFirst().map { String($0) } }
        var time = ""
        var dist = ""
        for i in 0..<specValues[0].count {
            time.append(specValues[0][i])
            dist.append(specValues[1][i])
        }
        let timeVal = time.integerValue
        let distVal = dist.integerValue
//        print("timeVal: \(timeVal)")

        var nextTerm = timeVal - 1
        var nextTermAddend = timeVal - 3
        var wins = 0
        var iterations = 0
//        print("nextTerm: \(nextTerm); nextTermAddend: \(nextTermAddend)")
        while nextTermAddend > 1 {
            if nextTerm > distVal {
                wins = (timeVal - 1) / 2 - iterations
                break
            }
            iterations += 1
            nextTerm += nextTermAddend
            nextTermAddend -= 2
//            print("nextTerm: \(nextTerm); nextTermAddend: \(nextTermAddend)")
        }

        wins *= 2
        if timeVal % 2 == 0 {
            wins += 1
        }

        return wins
    }
}
