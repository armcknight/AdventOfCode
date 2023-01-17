//
//  Day16Part1.swift
//  aoc2020
//
//  Created by Andrew McKnight on Dec 18, 2020.
//

import Foundation

struct Day16Rule {
    var field: String
    var ranges: [ClosedRange<Int>]

    init(string: String) {
        field = ""
        ranges = []
        try! string.enumerateMatches(with: #"(.*): (\d*)-(\d*) or (\d*)-(\d*)"#) { (match) in
            let name = match[1, string]
            let a = match[2, string].integerValue
            let b = match[3, string].integerValue
            let c = match[4, string].integerValue
            let d = match[5, string].integerValue
            let x = a ... b
            let y = c ... d
            self.field = name
            self.ranges = [x, y]
        }
    }
}

public extension Day16 {
    var part1: Int {
        let portions = rawValue
            .replacingOccurrences(of: "\n\n", with: "\n;\n")
            .lines
            .split(separator: ";")
        let rules = portions[0].reduce(into: [Day16Rule](), { (result, next) in
            result.append(Day16Rule(string: next))
        })
        let nearbyTickets = Array(portions[2])
        let tickets = nearbyTickets[1 ..< portions[2].count]
        
        return tickets.reduce(into: 0) { (result, next) in
            result += next
                .split(separator: ",")
                .map({ String($0).integerValue })
                .filter({ (value) -> Bool in
                    rules.filter({ (rule) -> Bool in
                        !(rule.ranges.first!.contains(value) || rule.ranges.last!.contains(value))
                    }).count == rules.count
                }).reduce(0, +)
        }
    }
}
