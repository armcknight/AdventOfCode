//
//  main.swift
//  createNewDay
//
//  Created by Andrew McKnight on 12/11/20.
//

import Foundation
import Then

private let formatter = DateFormatter().then {
    $0.dateStyle = .medium
    $0.timeStyle = .none
}
let dateComponents = Calendar(identifier: .gregorian).dateComponents(Set([.day, .year]), from: Date())

let path = #file.components(separatedBy: "/").with {
    $0.removeSubrange($0.count - 2 ... $0.count - 1)
}
private var url = URL(fileURLWithPath: path.joined(separator: "/"), isDirectory: true)

private let inputTemplate = ("""
//
//  Day{{ day }}Input.swift
//  aoc{{ year }}
//
//  Created by Andrew McKnight on {{ date }}.
//

public let day{{ day }}SampleInput = (\"\"\"

\"\"\")

public let day{{ day }}Input = (\"\"\"

\"\"\")
""")
private let part1Template = ("""
//
//  Day{{ day }}Part1.swift
//  aoc{{ year }}
//
//  Created by Andrew McKnight on {{ date }}.
//

import aocHelpers
import Foundation

public func day{{ day }}Part1(_ input: String) -> Int {
    return -1
}
""")
private let part2Template = ("""
//
//  Day{{ day }}Part2.swift
//  aoc{{ year }}
//
//  Created by Andrew McKnight on {{ date }}.
//

import aocHelpers
import Foundation

public func day{{ day }}Part2(_ input: String) -> Int {
    return -1
}
""")
private let problemTemplate = ("""
//
//  Day{{ day }}Problem.swift
//  aoc{{ year }}
//
//  Created by Andrew McKnight on {{ date }}.
//

/*

 */

""")
private let testCaseTemplate = ("""
//
//  Day{{ day }}Problem.swift
//  aoc{{ year }}
//
//  Created by Andrew McKnight on {{ date }}.
//

import aoc{{ year }}
import XCTest

class aoc{{ year }}Day{{ day }}Tests: XCTestCase {
    func testPart1Sample() {
        XCTAssertEqual(day{{ day }}Part1(day{{ day }}SampleInput), -1)
    }

    func testPart1() {
        XCTAssertEqual(day{{ day }}Part1(day{{ day }}Input), -1)
    }

    func testPart2Sample() {
        XCTAssertEqual(day{{ day }}Part2(day{{ day }}SampleInput), -1)
    }

    func testPart2() {
        XCTAssertEqual(day{{ day }}Part2(day{{ day }}Input), -1)
    }
}
""")

private var date = formatter.string(from: Date())
var year = String(dateComponents.year ?? 0)

/**
 Location of directory in which problem sets are located.
 ```
 path/
 ├── aoc<year>/
 │   ├── Day1/
 │   │   ├── Day1Input.swift
 │   │   ├── Day1Part1.swift
 │   │   ├── Day1Part2.swift
 │   │   └── Day1Problem.swift
 │   ├── Day2/
 │   │   ├── Day2Input.swift
 ...
 ...
 ├── aoc<year>Tests/
 │   ├── aoc<year>Tests.swift/ <- append a test case class at the end of this test file
 ...
 ```
 */
func createDay(day: Int) {
    let dayDirName = "Day\(day)"
    let directory = url.appendingPathComponent("aoc\(year)").appendingPathComponent(dayDirName)
    if !FileManager.default.fileExists(atPath: directory.path) {
        try! FileManager.default.createDirectory(at: directory, withIntermediateDirectories: false, attributes: nil)
    }

    func writeFile(content: String, name: String) {
        let fileURL = directory.appendingPathComponent("\(dayDirName)\(name).swift")
        guard !FileManager.default.fileExists(atPath: fileURL.path) else { return }
        try! content.write(to: fileURL, atomically: false, encoding: .utf8)
    }

    func resolve(template: String) -> String {
        return template.replacingOccurrences(of: "{{ date }}", with: date).replacingOccurrences(of: "{{ day }}", with: "\(day)").replacingOccurrences(of: "{{ year }}", with: year)
    }

    writeFile(content: resolve(template: inputTemplate), name: "Input")
    writeFile(content: resolve(template1: part1Template), name: "Part1")
    writeFile(content: resolve(template: part2Template), name: "Part2")
    writeFile(content: resolve(template: problemTemplate), name: "Problem")

    let testCase = resolve(template: testCaseTemplate)
    let testYear = "aoc\(year)Tests"
    let testDirectory = url.appendingPathComponent(testYear)
    if !FileManager.default.fileExists(atPath: testDirectory.path) {
        try! FileManager.default.createDirectory(at: testDirectory, withIntermediateDirectories: false, attributes: nil)
    }
    let testPath = testDirectory.appendingPathComponent("\(testYear)Day\(day).swift")
    if !FileManager.default.fileExists(atPath: testPath.path) {
        try! testCase.write(to: testPath, atomically: false, encoding: .utf8)
    }
}

for day in 1...25 {
    createDay(day: day)
}

let p = Process()
p.executableURL = URL(fileURLWithPath: "/usr/local/bin/xcodegen")
p.arguments = [
    "--spec",
    "\(path)/AdventOfCode.yml"
]
try! p.run()
