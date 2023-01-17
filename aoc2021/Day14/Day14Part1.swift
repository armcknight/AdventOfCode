//
//  Day14Part1.swift
//  aoc2021
//
//  Created by Andrew McKnight on Dec 5, 2021.
//

import Foundation

public extension Day14 {
    var part1: Int {
        let lines = rawValue.lines
        var polymer = lines.first!
        let rules = Array(lines[1..<lines.count]).reduce(into: [String: String](), { result, next in
            let parts = next.components(separatedBy: " -> ")
            result[parts.first!] = parts.last!
        })

        for i in 0..<10 {
            let pairs = polymer.substrings(ofLength: 2)
            var newPolymer = Array<String>()
            pairs.forEach { pair in
                if let match = rules[pair] {
//                    print("pair \(pair) matched rule \(match.0) -> \(match.1)")
                    newPolymer.append(String(Array(pair).first!) + match)
                } else {
//                    print("pair \(pair) did not match any rule in \(rules)")
                    newPolymer.append(String(pair))
                }
            }
            newPolymer.append(String(Array(pairs.last!).last!))
            polymer = newPolymer.joined()
//            print("i: \(i); polymer: \(polymer)")
        }

        let sorted = Array(polymer).counts.sorted(by: { a, b in
            a.value < b.value
        })
        return sorted.last!.value - sorted.first!.value
    }
}
