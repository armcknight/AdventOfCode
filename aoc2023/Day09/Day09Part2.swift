//
//  Day09Part2.swift
//  aoc2023
//
//  Created by Andrew McKnight on Dec 10, 2023.
//

import Foundation
import SwiftArmcknight

public extension Day09 {
    var part2: Int {
        rawValue.lines.reduce(0) { partialResult, line in
            var nextDerivation = [Int](line.ints(separator: " ").reversed())
            var nextDerivationValues = Set(nextDerivation)
            var derivations = [nextDerivation]
            
            while nextDerivationValues.count != 1 || !nextDerivationValues.contains(0) {
                nextDerivation = nextDerivation.pairs.map({ pair in
                    pair.b - pair.a
                })
                nextDerivationValues = Set(nextDerivation)
                derivations.append(nextDerivation)
            }
            
            let iter: [[Int]] = derivations.dropLast().reversed()
            var nextAdd = 0
            for i in 0..<iter.count {
                nextAdd += iter[i].last!
            }
            
            return partialResult + nextAdd
        }
    }
}
