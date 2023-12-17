//
//  Day06Part1.swift
//  aoc2023
//
//  Created by Andrew McKnight on Dec 10, 2023.
//

import Foundation
import SwiftArmcknight
import RegularExpressionDecoder

struct Location: Decodable {
    enum CodingKeys: String, CodingKey {
        case name
        case left
        case right
    }
    var name: String
    var left: String
    var right: String
}

public extension Day08 {
    var part1: Int {
        let parts = rawValue.paragraphLines
        let directions = parts[0][0].map { String($0) }
        let map = parts[1].reduce(into: [String: (left: String, right: String)]()) { partialResult, next in
            let pattern: RegularExpressionPattern<Location, Location.CodingKeys> = #"(?<\#(.name)>[A-Z]{3}) = \((?<\#(.left)>[A-Z]{3}), (?<\#(.right)>[A-Z]{3})\)"#
            let decoder = try! RegularExpressionDecoder<Location>(pattern: pattern)
            let location: Location = try! decoder.decode(Location.self, from: next)
            partialResult[location.name] = (left: location.left, right: location.right)
        }
        
        var location = "AAA"
        var step = 0
        while location != "ZZZ" {
            location = directions[step % directions.count] == "R" ? map[location]!.right : map[location]!.left
            step += 1
        }
        
        return step
    }
}
