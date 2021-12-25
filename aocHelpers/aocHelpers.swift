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


        }
        }
        }
        }

        }
        }

        }
        }
    }

}
