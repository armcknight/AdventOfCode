//
//  aocHelpers.swift
//  aocHelpers
//
//  Created by Andrew McKnight on 12/9/20.
//

import Foundation

public extension String.SubSequence {
    var integerValue: Int {
        return String(self).integerValue
    }

    var doubleValue: Double {
        return String(self).doubleValue
    }

    func captureGroup(at: Int, result: NSTextCheckingResult?) -> String {
        String(self).captureGroup(at: at, result: result)
    }
}

public extension NSTextCheckingResult {
    subscript(captureGroup: Int, in: String.SubSequence) -> String {
        return `in`.captureGroup(at: captureGroup, result: self)
    }
    
    subscript(captureGroup: Int, in: String) -> String {
        return `in`.captureGroup(at: captureGroup, result: self)
    }
}

public extension String {
    func captureGroup(at: Int, result: NSTextCheckingResult?) -> String {
        String(self[Range(result!.range(at: at), in: self)!])
    }

    var lines: [String] {
        return split(separator: "\n").map({String($0)})
    }

    /// Each row (outer array) is a line from the original multiline string from top to bottom, each column (inner arrays) is a character in the line from left to right
    var characterGrid: [[String]] {
        return lines.map {
            return $0.map({String($0)})
        }
    }

    var ints: [Int] {
        return lines.map({Int($0)!})
    }

    func ints(separator: Character) -> [Int] {
        split(separator: separator).map(\.integerValue)
    }

    var integerValue: Int {
        return (self as NSString).integerValue
    }

    var doubleValue: Double {
        return (self as NSString).doubleValue
    }

    func matches(_ regex: String) throws -> Bool {
        let regex = try NSRegularExpression(pattern: regex, options: [])
        let range = NSRange(location: 0, length: self.count)
        let match = regex.firstMatch(in: self, options: [], range: range)
        return match != nil
    }

    func enumerateMatches(with regex: String, block: ((NSTextCheckingResult) -> Void)) throws {
        let regex = try NSRegularExpression(pattern: regex, options: [])
        let range = NSRange(location: 0, length: self.count)
        regex.enumerateMatches(in: self, options: [], range: range) { (result, flags, stop) in
            block(result!)
        }
    }

    var stringAndInt: (String, Int) {
        let components = split(separator: " ")
        return (String(components.first!), String(components.last!).integerValue)
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

public extension Array {
    /// Given an array, return an array of arrays that are each a window of values from the original array
    /// of the specified size. For example, `[1, 2, 3, 4, 5]` with window size of `3` yields
    /// `[[1, 2, 3], [2, 3, 4], [3, 4, 5]]`.
    func windows(ofSize size: Int) -> [[Element]] {
        var windows = [[Element]]()
        for i in 0 ... count - size {
            var window = [Element]()
            for j in 0 ..< size {
                window.append(self[i + j])
            }
            windows.append(window)
        }
        return windows
    }

    /// Given an array, return an array of 2-tuples consisting of continuous pairs of elements. E.g
    /// `[1, 2, 3]` yields `[(1, 2), (2, 3)]`.
    var pairs: [(a: Element, b: Element)] {
        windows(ofSize: 2).map { ($0[0], $0[1]) }
    }

    /// Count the number of elements that pass a test encapsulated in a specified block.
    func count(where: (Element) -> Bool) -> Int {
        filter(`where`).count
    }
}

public extension Array where Element: Hashable {
    var frequencies: [Element: Int] {
        reduce(into: [Element: Int]()) { (result, next) in
            result[next, default: 0] += 1
        }
    }
}

public extension Array where Element == String {
    var stringsAndInts: [(String, Int)] {
        map(\.stringAndInt)
    }
}

public extension Array where Element == Int {
    var sum: Int {
        reduce(0, +)
    }

    /// Given an array, return the sums of values in windows of a specified size. For example,
    /// `[1, 2, 3, 4, 5]` with window sizes of `2` yields `[3, 5, 7, 9]`.
    func sums(windowSize: Int) -> [Int] {
        windows(ofSize: windowSize).map(\.sum)
    }
}
