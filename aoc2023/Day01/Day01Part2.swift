//
//  Day01Part2.swift
//  aoc2023
//
//  Created by Andrew McKnight on Dec 2, 2023.
//

import Foundation
import SwiftArmcknight

enum Number: String, CaseIterable {
    case one
    case two
    case three
    case four
    case five
    case six
    case seven
    case eight
    case nine
    
    var numeralValue: String {
        switch self {
        case .one: return "1"
        case .two: return "2"
        case .three: return "3"
        case .four: return "4"
        case .five: return "5"
        case .six: return "6"
        case .seven: return "7"
        case .eight: return "8"
        case .nine: return "9"
        }
    }
}

public extension Day01 {
    var part2: Int {
        rawValue.lines.reduce(into: 0) { partialResult, line in
            let matches = (Number.allCases.map { number -> (Number, Int) in
                (number, (line as NSString).range(of: number.rawValue).location)
            } + Number.allCases.map { number -> (Number, Int) in
                (number, (line as NSString).range(of: number.numeralValue).location)
            } + Number.allCases.map { number -> (Number, Int) in
                (number, (line as NSString).range(of: number.rawValue, options: .backwards).location)
            } + Number.allCases.map { number -> (Number, Int) in
                (number, (line as NSString).range(of: number.numeralValue, options: .backwards).location)
            }).filter({ match in
                match.1 != NSNotFound
            }).sorted(by: { a, b in
                a.1 < b.1
            })
            
            let a = matches.first!.0.numeralValue
            let b = matches.last!.0.numeralValue
            
            let value = a + b
            
            print("input: \(line); value: \(value)")
            
            partialResult += Int(value)!
        }
    }
}
