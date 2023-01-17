//
//  Day14Part2.swift
//  aoc2021
//
//  Created by Andrew McKnight on Dec 5, 2021.
//

import Foundation

public extension Day14 {
    var part2: Int {
        let lines = rawValue.lines
        var pairs = lines.first!.substrings(ofLength: 2).counts
        var chars = Array(lines.first!).counts
        let rules = Array(lines[1..<lines.count]).reduce(into: [String: String](), { result, next in
            let parts = next.components(separatedBy: " -> ")
            result[parts.first!] = parts.last!
        })

        for i in 0..<40 {
            for pair in pairs.keys {
                let match = rules[pair]!
                let newA = String(pair.first!) + match
                let newB = match + String(pair.last!)
                let count = pairs[pair]!
                pairs.removeValue(forKey: pair)
                pairs[newA, default: 0] += count
                pairs[newB, default: 0] += count
                chars[match.first!, default: 0] += count
            }
        }

        let sorted = chars.sorted(by: { a, b in
            a.value < b.value
        })
        return sorted.last!.value - sorted.first!.value
    }
}
