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
    
    var integerValue: Int {
        return (self as NSString).integerValue
    }

    func matches(_ regex: String) throws -> Bool {
        let regex = try NSRegularExpression(pattern: regex, options: [])
        let range = NSRange(location: 0, length: self.count)
        let match = regex.firstMatch(in: self, options: [], range: range)
        return match != nil
    }

    func enumerateMatches(with regex: String, block: ((NSTextCheckingResult?) -> Void)) throws {
        let regex = try NSRegularExpression(pattern: regex, options: [])
        let range = NSRange(location: 0, length: self.count)
        regex.enumerateMatches(in: self, options: [], range: range) { (result, flags, stop) in
            block(result)
        }
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
