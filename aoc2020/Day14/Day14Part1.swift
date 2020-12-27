//
//  Day14Part1.swift
//  aoc2020
//
//  Created by Andrew McKnight on Dec 18, 2020.
//

import aocHelpers
import Foundation

struct Mask {
    var zeros = [Int]()
    var ones = [Int]()
    var exes = [Int]()

    init(_ string: String) {
        let reversed = Array(string.reversed())
        for i in 0 ..< reversed.count {
            if reversed[i] == "0" {
                zeros.append(i)
            } else if reversed[i] == "1" {
                ones.append(i)
            } else if reversed[i] == "X" {
                exes.append(i)
            }
        }
    }

    func computeZeros(_ zeros: [Int], start: Int) -> Int {
        zeros.reduce(into: start) { (result, next) in
            result &= ~(1 << next)
        }
    }

    func computeOnes(_ ones: [Int], start: Int) -> Int {
        ones.reduce(into: start) { (result, next) in
            result |= 1 << next
        }
    }

    func apply(int: Int) -> Int {
        return computeOnes(ones, start: computeZeros(zeros, start: int))
    }
}

extension String {
    var isMask: Bool {
        contains("mask")
    }
}

public func day14Part1(_ input: String) -> Int {
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
            result[next.0] = mask.apply(int: next.1)
        }).forEach { (memoryLocation) in
            result[memoryLocation.key] = memoryLocation.value
        }
    }).reduce(into: 0) { (result, next) in
        result += next.value
    }
}
