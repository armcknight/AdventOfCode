//
//  aocHelpers.swift
//  aocHelpers
//
//  Created by Andrew McKnight on 12/9/20.
//

import Foundation
import Then

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

    func regexResult(from regex: String) throws -> NSTextCheckingResult {
        let regex = try NSRegularExpression(pattern: regex, options: [])
        let range = NSRange(location: 0, length: self.count)
        var regexResult: NSTextCheckingResult!
        regex.enumerateMatches(in: self, options: [], range: range) { (result, flags, stop) in
            regexResult = result
        }
        return regexResult
    }

    /// - returns: the substring between the two provided strings (not inclusive).
    func substring(from: String, to: String) -> String {
        let startRange = (self as NSString).range(of: from)
        let endRange = (self as NSString).range(of: to)
        let startIdx = self.index(self.startIndex, offsetBy: (startRange.location + startRange.length))
        let endIdx = self.index(self.startIndex, offsetBy: endRange.location)
        return String(self[startIdx ..< endIdx]).trimmingCharacters(in: .newlines)
    }

    // TODO: copied this here because we can't link PippinLibrary as a framework because this aocHelpers lib is linked into the update CLI tool
    /// Break up a multiline string into an array of each line's string value.
    private var lines: [String] {
        return components(separatedBy: "\n").map({String($0)})
    }

    /**
     * Given columnar input, return an array of columns, each of which is represented as an array of its elements.
     * For example, given the string:
     * ```
     * """
     * a b c
     * d e f
     * g h i
     * """
     * ```
     * the result is `[["a", "d", "g"], ["b", "e", "h"], ["c", "f", "i"]]`.
     * - warning: The strings must all have the same number of elements delimited by whitespace.
     */
    var columns: [[String]] {
        guard count > 0 else { return [] }
        return lines.columns
    }

    var transpose: [[String]] {
        return lines.transpose
    }

    var midpoint: Index {
        index(startIndex, offsetBy: count / 2)
    }

    var halves: (String, String) {
        (String(self[startIndex ..< midpoint]), String(self[midpoint ..< endIndex]))
    }
}

public extension Array where Element == Array<Int> {
    func sightLineRanges(row: Int, col: Int) -> (rowLeft: [Int], rowRight: [Int], colUp: [Int], colDown: [Int]) {
        var colUpElements = [Int]()
        for i in 0 ..< row {
            colUpElements.append(self[i][col])
        }

        var colDownElements = [Int]()
        for i in row + 1 ..< count {
            colDownElements.append(self[i][col])
        }

        var rowLeftElements = [Int]()
        let row = self[row]
        for i in 0 ..< col {
            rowLeftElements.append(row[i])
        }

        var rowRightElements = [Int]()
        for i in col + 1 ..< row.count {
            rowRightElements.append(row[i])
        }

        return (rowLeftElements, rowRightElements, colUpElements, colDownElements)
    }

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

public extension Collection where Element == Array<String> {
    func printGrid() {
        let separator = String(repeating: "-", count: first!.count * 2 - 1)
        let output = map({ row in
            row.joined(separator: " ")
        }).joined(separator: "\n")
        print("\(separator)\n\(output)\n\(separator)\n")
    }
}

// MARK: Generic 2D Collection Functions
public extension Collection where Iterator.Element: Collection, Self.Index == Int, Iterator.Element.Index == Int {
    func enumerate<T>(rowStartOffset: Int = 0, rowEndOffset: Int = 0, colStartOffset: Int = 0, colEndOffset: Int = 0, _ block: (_ row: Int, _ col: Int, _ element: T) -> Void) {
        let rowEnd = count - rowEndOffset
        let colEnd = self[0].count - colEndOffset
        for rowIdx in rowStartOffset ..< rowEnd {
            for colIdx in colStartOffset ..< colEnd {
                block(rowIdx, colIdx, self[rowIdx][colIdx] as! T)
            }
        }
    }

    func enumerate<T>(allOffsets: Int = 0, _ block: (_ row: Int, _ col: Int, _ element: T) -> Void) {
        enumerate(rowStartOffset: allOffsets, rowEndOffset: allOffsets, colStartOffset: allOffsets, colEndOffset: allOffsets, block)
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

public extension Array<String> {
    /**
     * Given columnar input, return an array of columns, each of which is represented as an array of its elements.
     * For example, given the array of strings:
     * ```
     * [
     *  "a b c",
     *  "d e f",
     *  "g h i"
     * ]
     * ```
     * the result is `[["a", "d", "g"], ["b", "e", "h"], ["c", "f", "i"]]`.
     */
    var columns: [[String]] {
        guard count > 0 else { return [] }
        var columns = [[String]]()
        let numberOfCols = first!.components(separatedBy: .whitespaces).count
        for _ in 0 ..< numberOfCols {
            columns.append([String]())
        }
        forEach {
            let colElements = $0.components(separatedBy: .whitespaces)
            assert(colElements.count == numberOfCols)
            for i in 0 ..< numberOfCols {
                columns[i].append(colElements[i])
            }
        }
        return columns
    }

    /// - note: If input is not rectangular, but rather has a ragged right edge, the right ends of strings are padded with whitespace to the length of the longest string.
    /// - returns: A character-by-character transposition of an array of strings.
    var transpose: [[String]] {
        guard count > 0 else { return [] }
        guard count > 1 else { return [Array(self)] }
        var rectified = self

        let lengths = map { $0.count }
        if Set(lengths).count > 1 {
            let longest = lengths.sorted().last!
            rectified = map {
                $0.appending(String(repeating: " ", count: longest - $0.count))
            }
        }

        var result = [[String]]()
        let matrix = rectified.map { $0.map { String($0) } }
        matrix.enumerate { row, col, element in
            result[col][row] = element
        }

        return result
    }
}

extension CGPoint: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine("(x: \(x), y: \(y))")
    }
}

public extension ClosedRange {
    func overlaps(other: ClosedRange) -> Bool {
        lowerBound <= other.lowerBound && lowerBound >= other.upperBound
        || upperBound >= other.lowerBound && upperBound <= other.upperBound
    }
}

public extension Process {
    static func run(_ path: String, cwd: URL? = nil, _ arguments: String ...) {
        _run(path, cwd: cwd, Array(arguments))
    }

    static func runBrewed(_ utility: String, stdin: String? = nil, _ arguments: String ...) {
        _run(_path(forBrewed: utility), stdin: stdin, Array(arguments))
    }

    static func runBrewedWithResult(_ utility: String, stdin: String? = nil, _ arguments: String ...) -> String {
        var result: String!
        let group = DispatchGroup()
        let stdout = Pipe().then {
            $0.fileHandleForReading.readabilityHandler = {
                result = String(data: $0.readDataToEndOfFile(), encoding: .utf8)!
                try! $0.close()
                group.leave()
            }
        }
        group.enter()
        _run(_path(forBrewed: utility), stdin: stdin, stdout: stdout, Array(arguments))
        group.wait()
        return result
    }

    private static func _path(forBrewed utility: String) -> String {
        let x86_64Path = "/usr/local/bin/\(utility)"
        return FileManager.default.fileExists(atPath: x86_64Path) ? x86_64Path : "/opt/homebrew/bin/\(utility)"
    }

    private static func _run(_ path: String, stdin: String? = nil, stdout: Pipe? = nil, cwd: URL? = nil, _ arguments: [String]) {
        Process().do {
            $0.executableURL = URL(fileURLWithPath: path)
            $0.arguments = arguments
            if let stdin {
                $0.standardInput = Pipe().then {
                    $0.fileHandleForWriting.write(stdin.data(using: .utf8)!)
                    try! $0.fileHandleForWriting.close()
                }
            }
            if let stdout {
                $0.standardOutput = stdout
            }
            if let cwd {
                $0.currentDirectoryURL = cwd
            }
            try! $0.run()
        }
    }
}
