//
//  Day02Part1.swift
//  aoc2023
//
//  Created by Andrew McKnight on Dec 2, 2023.
//

import Foundation
import SwiftArmcknight

public extension Day02 {
    struct ColorCount {
        var red: Int?
        var green: Int?
        var blue: Int?
    }

    static let spec: ColorCount = ColorCount(red: 12, green: 13, blue: 14)
    
    var extract: [(Int, [ColorCount])] {
        rawValue.lines.map { line -> (Int, [ColorCount]) in
            let split = line.split(separator: ": ")
            let gameID = (split[0] as NSString).trimmingCharacters(in: .decimalDigits.inverted).integerValue
            
            let results = split[1].components(separatedBy: "; ").reduce(into: [ColorCount]()) { partialResult, next in
                var red: Int?
                var green: Int?
                var blue: Int?
                next.components(separatedBy: ", ").forEach({ component in
                    let colorName = component.trimmingCharacters(in: CharacterSet.decimalDigits.union(.whitespaces))
                    let count = Int(component.trimmingCharacters(in: CharacterSet.decimalDigits.inverted.union(.whitespaces)))!
                    switch colorName {
                    case "red": red = count
                    case "green": green = count
                    case "blue": blue = count
                    default: fatalError("unexpected color name")
                    }
                })
                partialResult.append(ColorCount(red: red, green: green, blue: blue))
            }
            return (gameID, results)
        }
    }
    
    var part1: Int {
        extract.filter { game in
//            print("testing \(game.0): \(game.1)")
            return game.1.reduce(true) { partialResult, counts in
                if let redResult = counts.red, let redSpec = Day02.spec.red, redResult > redSpec {
//                    print("failed on red")
                    return partialResult && false
                }
                if let greenResult = counts.green, let greenSpec = Day02.spec.green, greenResult > greenSpec {
//                    print("failed on green")
                    return partialResult && false
                }
                if let blueResult = counts.blue, let blueSpec = Day02.spec.blue, blueResult > blueSpec {
//                    print("failed on blue")
                    return partialResult && false
                }
//                print("passed")
                return partialResult && true
            }
        }.reduce(0) { partialResult, game in
            partialResult + game.0
        }
    }
}
