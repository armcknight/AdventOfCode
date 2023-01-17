//
//  Day08Part2.swift
//  aoc2021
//
//  Created by Andrew McKnight on Dec 5, 2021.
//

import Foundation

public extension Day08 {
    var part2: Int {
        // key is the number, value is the amount of segments
        let easyCounts = [2: 1, 3: 7, 4: 4, 7: 8]
        let hardCounts = [2: 5, 3: 5, 5: 5, 6: 6, 9: 6, 0: 6]

        let cleaned = rawValue.lines.map { line -> [[String]] in
            let leftAndRight = line.split(separator: "|").map { String ($0) }
            let values = leftAndRight.map {
                $0.trimmingCharacters(in: .whitespacesAndNewlines).split(separator: " ").map { String($0) }
            }
            return values
        }.map { inputSet in
            (inputSet.first!, inputSet.last!)
        }

        // maps numbers to the observed segment strings that correspond to them
        var easyMapping = [Int: String]()
        var hardMapping = [Int: Set<String>]()

        cleaned.forEach { tuple in
            tuple.0.forEach { observation in
                if let key = easyCounts[observation.count] {
                    easyMapping[key] = observation
                } else {
                    let possibilities = hardCounts.keys.filter {
                        hardCounts[$0]! == observation.count
                    }
                    possibilities.forEach {
                        hardMapping[$0, default: Set<String>()].insert(String(observation.sorted()))
                    }
                }
            }
        }

        // 1 defines the right side
        let upperAndLowerRight = Set(Array(easyMapping[1] ?? ""))

        // 7 = 1 + top
        let top = Set(Array(easyMapping[7] ?? "")).symmetricDifference(Set(Array(upperAndLowerRight)))

        // 4 = 1 + middle + upperLeft
        let middleAndUpperLeft = Set(Array(easyMapping[4] ?? "")).symmetricDifference(Set(Array(upperAndLowerRight)))

        // 8 = 4 + 7 + lowerLeft and bottom
        let bottomAndLowerLeft = Set(Array(easyMapping[8] ?? "")).symmetricDifference(Set(Array(easyMapping[4] ?? "")).union(Set(Array(easyMapping[7] ?? ""))))

        // upperRight = 6 - 1
        // 6 = 8 - upperRight
        // 9 = 8 - lowerRight
        // 2 = 8 - lowerRight - upperLeft
        // 5 = 6 - lowerLeft
        // 3 = 9 - upperLeft

        // 0 = 8 - middle
        
        let zero = hardMapping[0]!.filter() {
            let zeroSegments = Set(Array($0))
            let eightSegments = Set(Array(easyMapping[8]!))
            let diff = eightSegments.symmetricDifference(zeroSegments)
            let possibleMiddle = diff.first!
//            return middleAndUpperLeft.contains(possibleMiddle) && !

            return false // TODO: finish 👆🏻
        }


        return -1
    }
}
