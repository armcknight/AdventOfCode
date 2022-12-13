//
//  Day14Part2.swift
//  aoc2020
//
//  Created by Andrew McKnight on Dec 18, 2020.
//

import aocHelpers
import SwiftArmcknight
import Foundation

extension Mask {
    func apply2(input: Int) -> [Int] {
        let onesAndZeros = computeOnes(ones, start: input)
        return exes.powerSet.reduce(into: [Int]()) { (result, next) in
            result.append(Array(Set(exes).symmetricDifference(next)).reduce(into: Array(next).reduce(into: onesAndZeros, { (result, next) in
                result |= 1 << next
            })) { (result, next) in
                result &= ~(1 << next)
            })
        }
    }
}

public func day14Part2(_ input: String) -> Int {
    let lines = input.lines
    let masks = lines.filter { $0.isMask }
    let commandSequences = lines.split { $0.isMask }
    return zip(masks, commandSequences).reduce(into: [Int: Int](), { (result, nextProgram) in
        let mask = Mask(nextProgram.0)
        nextProgram.1.map({ line -> (Int, Int) in
            var index: Int = -1
            var value: Int = -1
            try! line.enumerateMatches(with: #"mem\[(\d*)\] = (\d*)"#) { (result) in
                index = Int(result[1, line])!
                value = Int(result[2, line])!
            }
            return (index, value)
        }).reduce(into: [Int: Int](), { (result, next) in
            mask.apply2(input: next.0).forEach {
                result[$0] = next.1
            }
        }).forEach { (memoryLocation) in
            result[memoryLocation.key] = memoryLocation.value
        }
    }).reduce(into: 0) { (result, next) in
        result += next.value
    }
}
