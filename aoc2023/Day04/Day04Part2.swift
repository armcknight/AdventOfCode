//
//  Day04Part2.swift
//  aoc2023
//
//  Created by Andrew McKnight on Dec 3, 2023.
//

import Foundation
import SwiftArmcknight

public extension Day04 {
    var part2: Int {
        let lines = rawValue.lines
        var cardCopyCounts = [Int: Int]()
        for i in 1...lines.count {
            cardCopyCounts[i] = 1
        }
        lines.enumerated().forEach { next in
//            defer { print(cardCopyCounts.sortedByKey()) }
            let parts = next.element.split(separator: ":")[1].split(separator: "|")
            let winningNumbers = Set(String(parts[0]).ints(separator: " "))
            let cardNumbers = Set(String(parts[1]).ints(separator: " "))
            let matches = winningNumbers.intersection(cardNumbers)
//            print("game: \(next.offset + 1); winningNumbers: \(winningNumbers); cardNumbers: \(cardNumbers); matches: \(matches)")
            if matches.isEmpty {
                return
            }
            for i in 0..<matches.count {
//                print(i)
                let nextKey = next.offset + i + 1
                if nextKey >= cardCopyCounts.count {
                    break
                }
                cardCopyCounts[nextKey+1]! += cardCopyCounts[next.offset+1]!
            }
        }
        return cardCopyCounts.reduce(0) { partialResult, next in
            partialResult + next.value
        }
    }
}
