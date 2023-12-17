//
//  Day05Part2.swift
//  aoc2023
//
//  Created by Andrew McKnight on Dec 4, 2023.
//

import Foundation
import SwiftArmcknight

public extension Day05 {
    var part2: Int {
        var seeds = [Int]()
        var almanac = [[Range<Int>: Range<Int>]]()
        
        rawValue.paragraphLines.enumerated().forEach { next in
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

//        public func splitRange(lowerBound: Int = 0, upperBound: Int, almanacLevel level: Int) -> Int {
//            let lowestDest = almanac[level]
//            if lowerBound == upperBound {
//                return lowerBound
//            }
//
//            let midValue = lowerBound + (upperBound - lowerBound) / 2
//
//            let result = block(midValue)
//            if result == .orderedAscending {
//                return binarySearchRecursive(lowerBound: lowerBound, upperBound: midValue, block: block)
//            } else if result == .orderedDescending {
//                return binarySearchRecursive(lowerBound: midValue + 1, upperBound: upperBound, block: block)
//            } else {
//                return midValue
//            }
//        }
//
//        var seedRanges = [Range<Int>]()
//        stride(from: 0, to: seeds.count, by: 2).forEach { nextRange in
//            print("starting seed range: \(nextRange)")
//            let lower = seeds[nextRange]
//            let upper = seeds[nextRange] + seeds[nextRange + 1]
//
//            let firstSubrangeUpperBound = splitRange(lowerBound: lower, upperBound: upper) { next in
//
//            }
//
//        }

        // split ranges

        // do the pathfinding with just the lower bound from each subrange



        // ---old attempt---

        func computePath(_ next: Int, _ partialResult: Int) -> Int {
            func getNextResult(almanacPart: Int, next: Int) -> Int {
                if let match = almanac[almanacPart].map({ kv in
                    (kv.key, kv.value)
                }).filter({ part in
                    part.0.contains(next)
                }).first {
                    let sourceDiff = next - match.0.lowerBound
                    let result = match.1.lowerBound + sourceDiff
                    return result
                } else {
                    return next
                }
            }
            
            //            print("reducing seed \(next)")
            var result = getNextResult(almanacPart: 0, next: next)
            //            print("getNextResult(almanacPart: 0, next: next): getNextResult(almanacPart: 0, next: \(next)): \(getNextResult(almanacPart: 0, next: next))")
            for i in 1...6 {
                //                print("getNextResult(almanacPart: i, next: result): getNextResult(almanacPart: \(i), next: \(result)): \(getNextResult(almanacPart: i, next: result))")
                result = getNextResult(almanacPart: i, next: result)
            }
            return min(partialResult, result)
        }
        
//        // find the first index that maps to a different range in the next stage than lowerBound. return that index
//        func binarySearchForSubrangeBoundary(lowerBound: Int = 0, upperBound: Int? = nil) -> Int {
//            
//        }
        
        var results = [Int]()
        stride(from: 0, to: seeds.count, by: 2).forEach { nextRange in
            print("starting seed range: \(nextRange)")
            let lower = seeds[nextRange]
            let upper = seeds[nextRange] + seeds[nextRange + 1]
            let mid = upper / lower
            
            
            let result = (lower ..< upper).reduce(Int.max) { partialResult, nextSeed in
                return computePath(nextSeed, partialResult)
            }
            results.append(result)
            print("appended result \(result) for seed range \(nextRange)")
        }
        
        return results.min()!
    }
}

// idea: form a tree to map ranges or subranges of each range to (sub)range(s) in the next stage, prune ranges or portions of ranges from the almanac data structure if we find a result that is lesser than what they'd produce, as they shouldn't be reconsidered in any further evaluations, then we can whittle down the outcomes even further
//     - binary search within each seed range instead of linearly iterating through them to find the subrange boundaries
