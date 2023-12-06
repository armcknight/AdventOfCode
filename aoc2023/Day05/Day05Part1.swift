//
//  Day05Part1.swift
//  aoc2023
//
//  Created by Andrew McKnight on Dec 4, 2023.
//

import Foundation
import SwiftArmcknight

public extension Day05 {
    var part1Inefficient: Int {
        var seeds = [Int]()
        var almanac = [[Int: Int]]()
        
        rawValue.paragraphs.enumerated().forEach { next in
            if next.offset == 0 {
                seeds = next.element[0].keyValuePairs[0].1.ints(separator: " ")
            } else {
                almanac.append([Int: Int]())
                next.element[1 ..< next.element.count].map({$0.ints(separator: " ")}).forEach { mapping in
                    let destStart = mapping[0]
                    let sourceStart = mapping[1]
                    for i in 0 ..< mapping[2] {
                        almanac[next.offset - 1][sourceStart + i] = destStart + i
                    }
                }
            }
        }
        
        return seeds.reduce(Int.max) { partialResult, next in
            var result = almanac[0][next] ?? next
//            print("almanac[0][next]: almanac[0][\(next)]: \(almanac[0][next])")
            for i in 0..<6 {
//                print("almanac[i][result]: almanac[\(i)][\(result)]: \(almanac[i][result])")
                result = almanac[i][result] ?? result
            }
            return min(partialResult, result)
        }
    }
    
    var part1Efficient: Int {
        var seeds = [Int]()
        var almanac = [[Range<Int>: Range<Int>]]()
        
        rawValue.paragraphs.enumerated().forEach { next in
            if next.offset == 0 {
                seeds = next.element[0].keyValuePairs[0].1.ints(separator: " ")
            } else {
                almanac.append([Range<Int>: Range<Int>]())
                next.element[1 ..< next.element.count].map({String($0)}).map({$0.ints(separator: " ")}).forEach { mapping in
                    let destStart = mapping[0]
                    let sourceStart = mapping[1]
                    let range = mapping[2]
                    almanac[next.offset - 1][sourceStart ..< sourceStart + range] = destStart ..< destStart + range
                }
            }
        }
        
        return seeds.reduce(Int.max) { partialResult, next in
            func getNextResult(almanacPart: Int, next: Int) -> Int {
                if let result = almanac[almanacPart].map({ kv in
                    (kv.key, kv.value)
                }).filter({ part in
                    part.0.contains(next)
                }).first {
                    let sourceDiff = next - result.0.lowerBound
                    return result.1.lowerBound + sourceDiff
                } else {
                    return next
                }
            }
            
//            print("reducing seed \(next)")
            var result = getNextResult(almanacPart: 0, next: next)
//            print("getNextResult(almanacPart: 0, next: next): getNextResult(almanacPart: 0, next: \(next)): \(getNextResult(almanacPart: 0, next: next))")
            for i in 1...6 {
//                print("getNextResult(almanacPart: i, next: result): getNextResult(almanacPart: \(i), next: \(result)): \(getNextResult(almanacPart: i, next: result))")
                let nextResult = getNextResult(almanacPart: i, next: result)
                result = nextResult
            }
            return min(partialResult, result)
        }
    }
}
