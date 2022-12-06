//
//  aocHelpers.swift
//  aocHelpers
//
//  Created by Andrew McKnight on 12/9/20.
//

import Foundation

public extension String.SubSequence {
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

    /// - returns: the substring between the two provided strings (not inclusive).
    func substring(from: String, to: String) -> String {
        let startRange = (self as NSString).range(of: from)
        let endRange = (self as NSString).range(of: to)
        let startIdx = self.index(self.startIndex, offsetBy: (startRange.location + startRange.length))
        let endIdx = self.index(self.startIndex, offsetBy: endRange.location)
        return String(self[startIdx ..< endIdx]).trimmingCharacters(in: .newlines)
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
            coords.append(CGPoint(x: Double(row), y: Double(col) - 1))
        }
        if row > 0 {
            coords.append(CGPoint(x: Double(row) - 1, y: Double(col)))
        }
        if col < self[row].count - 1 {
            coords.append(CGPoint(x: Double(row), y: Double(col) + 1))
        }
        if row < self.count - 1 {
            coords.append(CGPoint(x: Double(row) + 1, y: Double(col)))
        }
        return coords
    }

    func neighbors8Coordinates(row: Int, col: Int) -> [CGPoint] {
        var coords = [CGPoint]()
        if col > 0 {
            coords.append(CGPoint(x: Double(row), y: Double(col) - 1))
        }
        if row > 0 {
            coords.append(CGPoint(x: Double(row) - 1, y: Double(col)))
        }
        if col < self[row].count - 1 {
            coords.append(CGPoint(x: Double(row), y: Double(col) + 1))
        }
        if row < self.count - 1 {
            coords.append(CGPoint(x: Double(row) + 1, y: Double(col)))
        }

        if col > 0 && row > 0 {
            coords.append(CGPoint(x: Double(row) - 1, y: Double(col) - 1))
        }
        if col < self[row].count - 1 && row > 0 {
            coords.append(CGPoint(x: Double(row) - 1, y: Double(col) + 1))
        }

        if col > 0 && row < count - 1 {
            coords.append(CGPoint(x: Double(row) + 1, y: Double(col) - 1))
        }
        if col < self[row].count - 1 && row < count - 1 {
            coords.append(CGPoint(x: Double(row) + 1, y: Double(col) + 1))
        }
        return coords
    }
}

public extension Array where Element == Array<Any> {

    /// Return the 8 values neighboring the value of this cell. Cells on edges of the grid have `nil` values for invalid neighbor locations.
    func neighbors8(row: Int, col: Int) -> (up: Any?, upRight: Any?, right: Any?, rightDown: Any?, down: Any?, downLeft: Any?, left: Any?, leftUp: Any?) {
        var left: Any? = nil
        var upRight: Any? = nil
        var up: Any? = nil
        var rightDown: Any? = nil
        var down: Any? = nil
        var downLeft: Any? = nil
        var right: Any? = nil
        var leftUp: Any? = nil

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
    func neighbors8Array(row: Int, col: Int) -> Element {
        let neighbors = neighbors8(row: row, col: col)
        return [neighbors.up, neighbors.upRight, neighbors.right, neighbors.rightDown, neighbors.down, neighbors.downLeft, neighbors.left, neighbors.leftUp].compactMap { return $0 }
    }
}
