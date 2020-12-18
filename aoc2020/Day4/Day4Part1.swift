//
//  Day4Part1.swift
//  aoc2020
//
//  Created by Andrew McKnight on Dec 18, 2020.
//

import aocHelpers
import Foundation

extension String {
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

public func day4Part1(_ input: String) -> Int {
    return input.replacingOccurrences(of: "\n\n", with: ";")
        .split(separator: ";")
        .filter({$0.count > 0})
        .map({String($0)})
        .reduce(0, { (partial, next) -> Int in
            let fields = next.replacingOccurrences(of: "\n", with: " ")
                .split(separator: " ")
            let hasCID = fields.contains { (string) -> Bool in
                string.contains("cid")
            }
            let valid = (hasCID && fields.count == 8) || (!hasCID && fields.count == 7)
            return partial + (valid ? 1 : 0)
        })
}
