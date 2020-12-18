//
//  aocHelpers.swift
//  aocHelpers
//
//  Created by Andrew McKnight on 12/9/20.
//

import Foundation

public extension String {
    var lines: [String] {
        return split(separator: "\n").map({String($0)})
    }

    /// Each row (outer array) is a line from the original multiline string from top to bottom, each column (inner arrays) is a character in the line from left to right
    var characterGrid: [[String]] {
        return lines.map {
            return $0.map({String($0)})
        }
    }

    var lineIntegers: [Int] {
        return lines.map({Int($0)!})
    }
}

public extension Array where Element == Array<String> {
    var gridDescription: String {
        var string = String()
        for x in self {
            for y in x {
                string.append(y + " ")
            }
            string.append("\n")
        }
        return string
    }
}
