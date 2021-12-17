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
    func substrings(ofLength length: Int) -> [String] {
        let chars = Array(self)
        var substrings = [String]()
        for i in 0 ... (chars.count - length) {
            var substring = String()
            for j in 0 ..< length {
                let char = String(chars[i + j])
                substring.append(char)
            }
            substrings.append(substring)
        }
        return substrings
    }

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

    var intGrid: [[Int]] {
        return characterGrid.map { $0.map { String($0).integerValue } }
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

public extension Array where Element == Array<Int> {
    /// Return the 4 values neighboring the value of this cell. Cells on edges of the grid have `nil` values for invalid neighbor locations.
    func neighbors4(row: Int, col: Int) -> (up: Int?, right: Int?, down: Int?, left: Int?) {
        var left: Int? = nil
        var up: Int? = nil
        var down: Int? = nil
        var right: Int? = nil

        if col > 0 {
            left = self[row][col - 1]
        }
        if row > 0 {
            up = self[row - 1][col]
        }
        if col < self[row].count - 1 {
            right = self[row][col + 1]
        }
        if row < self.count - 1 {
            down = self[row + 1][col]
        }

        return (up: up, right: right, down: down, left: left)
    }

    /// Return the neighbors from `neighbors4(row:int:)` in an array in clockwise order starting from the value in the location directly above the specified location.
    func neighbors4Array(row: Int, col: Int) -> [Int] {
        let neighbors = neighbors4(row: row, col: col)
        return [neighbors.up, neighbors.right, neighbors.down, neighbors.left].compactMap { return $0 }
    }

    func neighbors4Coordinates(row: Int, col: Int) -> [CGPoint] {
        var coords = [CGPoint]()
        if col > 0 {
            coords.append(CGPoint(x: row, y: col - 1))
        }
        if row > 0 {
            coords.append(CGPoint(x: row - 1, y: col))
        }
        if col < self[row].count - 1 {
            coords.append(CGPoint(x: row, y: col + 1))
        }
        if row < self.count - 1 {
            coords.append(CGPoint(x: row + 1, y: col))
        }
        return coords
    }

    /// Return the 8 values neighboring the value of this cell. Cells on edges of the grid have `nil` values for invalid neighbor locations.
    func neighbors8(row: Int, col: Int) -> (up: Int?, upRight: Int?, right: Int?, rightDown: Int?, down: Int?, downLeft: Int?, left: Int?, leftUp: Int?) {
        var left: Int? = nil
        var upRight: Int? = nil
        var up: Int? = nil
        var rightDown: Int? = nil
        var down: Int? = nil
        var downLeft: Int? = nil
        var right: Int? = nil
        var leftUp: Int? = nil

        if col > 0 {
            left = self[row][col - 1]
        }
        if row > 0 {
            up = self[row - 1][col]
        }
        if col < self[row].count - 1 {
            right = self[row][col + 1]
        }
        if row < self.count - 1 {
            down = self[row + 1][col]
        }

        if col > 0 && row > 0 {
            leftUp = self[row - 1][col - 1]
        }
        if col < self[row].count - 1 && row > 0 {
            upRight = self[row - 1][col + 1]
        }

        if col > 0 && row < count - 1 {
            downLeft = self[row + 1][col - 1]
        }
        if col < self[row].count - 1 && row < count - 1 {
            rightDown = self[row + 1][col + 1]
        }

        return (up: up, upRight: upRight, right: right, rightDown: rightDown, down: down, downLeft: downLeft, left: left, leftUp: leftUp)
    }

    /// Return the neighbors from `neighbors8(row:int:)` in an array in clockwise order starting from the value in the location directly above the specified location.
    func neighbors8Array(row: Int, col: Int) -> [Int] {
        let neighbors = neighbors8(row: row, col: col)
        return [neighbors.up, neighbors.upRight, neighbors.right, neighbors.rightDown, neighbors.down, neighbors.downLeft, neighbors.left, neighbors.leftUp].compactMap { return $0 }
    }

    func neighbors8Coordinates(row: Int, col: Int) -> [CGPoint] {
        var coords = [CGPoint]()
        if col > 0 {
            coords.append(CGPoint(x: row, y: col - 1))
        }
        if row > 0 {
            coords.append(CGPoint(x: row - 1, y: col))
        }
        if col < self[row].count - 1 {
            coords.append(CGPoint(x: row, y: col + 1))
        }
        if row < self.count - 1 {
            coords.append(CGPoint(x: row + 1, y: col))
        }

        if col > 0 && row > 0 {
            coords.append(CGPoint(x: row - 1, y: col - 1))
        }
        if col < self[row].count - 1 && row > 0 {
            coords.append(CGPoint(x: row - 1, y: col + 1))
        }

        if col > 0 && row < count - 1 {
            coords.append(CGPoint(x: row + 1, y: col - 1))
        }
        if col < self[row].count - 1 && row < count - 1 {
            coords.append(CGPoint(x: row + 1, y: col + 1))
        }
        return coords
    }
}

public extension Array where Element == Array<CustomStringConvertible> {
    var gridDescription: String {
        var string = String()
        for x in self {
            for y in x {
                string.append(y.description + " ")
            }
            string.append("\n")
        }
        return string
    }
}

public extension Array where Element == [Int] {
    var flattened: [Int] {
        reduce([Int]()) { partialResult, next in
            partialResult + next
        }
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
