//
//  Day12Part1.swift
//  aoc2023
//
//  Created by Andrew McKnight on Dec 11, 2023.
//

import Foundation
import SwiftArmcknight

public extension Day12 {
    /**
     * Strategy: generate each possible configuration according to the total length and the number spec, then filter for valid possibilities by matching the characters in the description:
     * ```
     * ?#?#?#?#?#?#?#? 1,3,1,6
     * #.###.#.######  length difference = 1
     * .#.###.#.###### valid
     * #..###.#.###### invalid at position [1]
     * #.###..#.###### invalid at position [1]
     * #.###.#..###### invalid at position [1]
     * #.###.#.######. invalid at position [1]
     * ```
     *
     * ```
     * ????.######..#####. 1,6,5
     * #.######.#####      length difference = 5
     * .....#.######.#####
     * ```
     */
    var part1: Int {
        rawValue.lines.reduce(0) { result, line in
            let parts = line.split(separator: " ")
            
            let description = String(parts[0])
            let unknownIndices = description.ranges(of: "?").map { $0.lowerBound }
            
            let counts = parts[1].split(separator: ",").map { $0.integerValue }
            
            let chunks = counts.reduce(into: [String]()) { partialResult, next in
                partialResult.append(String(repeating: "#", count: next))
            }
            
            let lengthDiff = description.count - counts.sum
            
            print("description = \(description); counts = \(counts); generated = \(chunks); lengthDiff = \(lengthDiff)")
            
            /**
             * Given an object, a total number of copies and a number of groups of at least one copy to create, create all possible combinations of such groups.
             * 10 objects across 3 groups:
             * X, X, XXXXXXXX
             * X, XX, XXXXXXX
             * X, XXX, XXXXXX
             * X, XXXX, XXXXX
             * XX, XX, XXXXXX
             * XX, XXX, XXXXX
             * XX, XXXX, XXXX
             * XXX, XXX, XXXX
             * and then all permutations of these groups
             *
             * 10 objects across 4 groups:
             * x, x, x, xxxxxxx
             * x, x, xx, xxxxxx
             * x, x, xxx, xxxxx
             * x, x, xxxx, xxxx
             * x, xx, x, xxxxxx
             * x, xx, xx, xxxxx
             * ...
             */
            func distributionsOfCopiesAcrossGroups(objectToCopy: String, objects: Int, groups: Int) -> [[String]] {
                var result = [[String]]()
                for i in 1..<groups {
                    var nextResult = [String(repeating: objectToCopy, count: i)]
                    
                    if objects - i == 1 {
                        
                    }
                    for j in 1..<objects - i {
                        let template = [String(repeating: objectToCopy, count: i), String(repeating: objectToCopy, count: j), String(repeating: objectToCopy, count: objects - j)]
                        print("separators: \(template)")
                        result.append(contentsOf: allPermutations(template))
                    }
                }
                return result
            }
            
            // generate all possibilities
            var possibilities = [String]()
            
            /**
             * Zip two sequences that can be of different lengths by at most a difference of 1. If they are even lengths, the first element of `a` is taken first. Otherwise, the first element of the longer sequence is taken first.
             */
            func unevenZip<T: RangeReplaceableCollection>(a: T, b: T) -> T where T.Index == Int {
                let first: T
                let second: T
                if a.count > b.count {
                    first = b
                    second = a
                } else {
                    first = a
                    second = b
                }
                
                var result = T()
                for i in 0..<first.count {
                    result.append(first[i])
                    if i < second.count {
                        result.append(second[i])
                    }
                }
                return result
            }
            
            if lengthDiff == 0 || lengthDiff == counts.count - 1 {
                print("possibilityCount = 1")
                return 1
            }
            
            // both starting and ending with '.'s
            if lengthDiff > 1 && description.first! != "#" && description.last! != "#" {
                var couched = distributionsOfCopiesAcrossGroups(objectToCopy: ".", objects: lengthDiff, groups: counts.count + 1).map { separators -> String in
                    unevenZip(a: separators, b: chunks).joined()
                }
                possibilities.append(contentsOf: couched)
            } else {
                // either starting or ending with '.'s
                if description.first! != "#" {
                    var starting = distributionsOfCopiesAcrossGroups(objectToCopy: ".", objects: lengthDiff, groups: counts.count).map { separators -> String in
                        unevenZip(a: separators, b: chunks).joined()
                    }
                    possibilities.append(contentsOf: starting)
                }
                if description.last! != "#" {
                    var ending = distributionsOfCopiesAcrossGroups(objectToCopy: ".", objects: lengthDiff, groups: counts.count).map { separators -> String in
                        unevenZip(a: chunks, b: separators).joined()
                    }
                    possibilities.append(contentsOf: ending)
                }
                
                // neither starting nor ending with '.'s
                if description.first! == "#" && description.last! == "#" {
                    var interior = distributionsOfCopiesAcrossGroups(objectToCopy: ".", objects: lengthDiff, groups: counts.count - 1).map { separators -> String in
                        unevenZip(a: chunks, b: separators).joined()
                    }
                    possibilities.append(contentsOf: interior)
                }
            }
            
            // filter out invalid possibilities
            print("\(possibilities)")
            let validPossibilities = possibilities.filter { possibility in
                for i in 0..<possibility.count {
                    let descI = description.index(description.startIndex, offsetBy: i)
                    if description[descI] == "#" && possibility[possibility.index(possibility.startIndex, offsetBy: i)] == "." {
                        print("\(possibility) failed against \(description) at \(i)")
                        return false
                    }
                }
                return true
            }
            let possibilityCount = validPossibilities.count
            print("\(validPossibilities)")
            print("possibilityCount = \(possibilityCount)")
            return result + possibilityCount
        }
    }
}
