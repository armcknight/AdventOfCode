//
//  Day08Part2.swift
//  aoc2023
//
//  Created by Andrew McKnight on Dec 10, 2023.
//

import Foundation
import SwiftArmcknight
import RegularExpressionDecoder

public extension Day08 {
    var part2: Int {
        let parts = rawValue.paragraphs
        let directions = parts[0][0].map { String($0) }
        let map = parts[1].reduce(into: [String: (left: String, right: String)]()) { partialResult, next in
            let pattern: RegularExpressionPattern<Location, Location.CodingKeys> = #"(?<\#(.name)>[0-9A-Z]{3}) = \((?<\#(.left)>[0-9A-Z]{3}), (?<\#(.right)>[0-9A-Z]{3})\)"#
            let decoder = try! RegularExpressionDecoder<Location>(pattern: pattern)
            let location: Location = try! decoder.decode(Location.self, from: next)
            partialResult[location.name] = (left: location.left, right: location.right)
        }
        
        // count how many steps it takes to get to each individual z location on its respective path, them calculate the LCM of all the paths' step counts
        
        var locations = map.keys.filter { location in
            location.last! == "A"
        }
        var stepsPerPath = [Int](repeating: 0, count: locations.count)
        var step = 0
        while locations.count > 0 {
            guard locations.filter({ location in
                location.last! == "Z"
            }).count < locations.count else {
                break
            }
            for (offset, location) in locations.enumerated() {
                if location.last! != "Z" {
                    stepsPerPath[offset] += 1
                    let nextLocation = directions[step % directions.count] == "R" ? map[location]!.right : map[location]!.left
                    locations[offset] = nextLocation
                }
            }
            step += 1
        }
        
        print(stepsPerPath)
        return stepsPerPath.lcm
    }
}
