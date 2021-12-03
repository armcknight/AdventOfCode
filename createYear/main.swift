//
//  main.swift
//  createNewDay
//
//  Created by Andrew McKnight on 12/11/20.
//

import Foundation
import Then

let formatter = DateFormatter().then {
    $0.dateStyle = .medium
    $0.timeStyle = .none
}
let date = Date()
let dateString = formatter.string(from: date)
let dateComponents = Calendar(identifier: .gregorian).dateComponents(Set([.day, .year]), from: date)
let year = String(dateComponents.year!)

let path = #file.components(separatedBy: "/").with {
    $0.removeSubrange($0.count - 2 ... $0.count - 1)
}.joined(separator: "/")
let url = URL(fileURLWithPath: path, isDirectory: true)
let fileManager = FileManager.default

let inputTemplate = ("""
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
let part1Template = ("""
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
let part2Template = ("""
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
let problemTemplate = ("""
//
//  Day{{ day }}Problem.swift
//  aoc{{ year }}
//
//  Created by Andrew McKnight on {{ date }}.
//

/*

 */

""")
let testCaseTemplate = ("""
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
        measure {
            XCTAssertEqual(day{{ day }}Part1(day{{ day }}SampleInput), -1)
        }
    }

    func testPart1() {
        measure {
            XCTAssertEqual(day{{ day }}Part1(day{{ day }}Input), -1)
        }
    }

    func testPart2Sample() {
        measure {
            XCTAssertEqual(day{{ day }}Part2(day{{ day }}SampleInput), -1)
        }
    }

    func testPart2() {
        measure {
            XCTAssertEqual(day{{ day }}Part2(day{{ day }}Input), -1)
        }
    }
}
""")

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
    if !fileManager.fileExists(atPath: directory.path) {
        try! fileManager.createDirectory(at: directory, withIntermediateDirectories: true, attributes: nil)
    }

    func writeFile(content: String, name: String) {
        let fileURL = directory.appendingPathComponent("\(dayDirName)\(name).swift")
        guard !fileManager.fileExists(atPath: fileURL.path) else { return }
        try! content.write(to: fileURL, atomically: false, encoding: .utf8)
    }

    func resolve(template: String) -> String {
        return template.replacingOccurrences(of: "{{ date }}", with: dateString).replacingOccurrences(of: "{{ day }}", with: "\(day)").replacingOccurrences(of: "{{ year }}", with: year)
    }

    writeFile(content: resolve(template: inputTemplate), name: "Input")
    writeFile(content: resolve(template: part1Template), name: "Part1")
    writeFile(content: resolve(template: part2Template), name: "Part2")
    writeFile(content: resolve(template: problemTemplate), name: "Problem")

    let testCase = resolve(template: testCaseTemplate)
    let testYear = "aoc\(year)Tests"
    let testDirectory = url.appendingPathComponent(testYear)
    if !fileManager.fileExists(atPath: testDirectory.path) {
        try! fileManager.createDirectory(at: testDirectory, withIntermediateDirectories: false, attributes: nil)
    }
    let testPath = testDirectory.appendingPathComponent("\(testYear)Day\(day).swift")
    if !fileManager.fileExists(atPath: testPath.path) {
        try! testCase.write(to: testPath, atomically: false, encoding: .utf8)
    }
}

for day in 1...25 {
    createDay(day: day)
}

let xcodegenYearSchemeTemplate = ("""
  aoc{{ year }}:
    build:
      targets:
          aoc{{ year }}: all
""")
let xcodegenYearTestsSchemeTemplate = ("""
  aoc{{ year }}Tests:
    build:
      targets:
          aoc{{ year }}Tests: test
    test:
      targets: [aoc{{ year }}Tests]
""")
let xcodegenYearTargetTemplate = ("""
  aoc{{ year }}:
    type: library.static
    sources: [aoc{{ year }}]
    dependencies:
      - target: aocHelpers
        link: true
    platform: iOS
    scheme:
      testTargets:
        - aoc{{ year }}Tests
""")
let xcodegenYearTestsTargetTemplate = ("""
  aoc{{ year }}Tests:
    type: bundle.unit-test
    platform: iOS
    sources: [aoc{{ year }}Tests]
    dependencies:
      - target: aoc{{ year }}
""")
let xcodegenTemplate = ("""
name: AdventOfCode
fileGroups:
  - AdventOfCode.yml
packages:
  Then:
    url: https://github.com/devxoul/Then
    from: 2.0.0
schemes:
  aocHelpers:
    build:
      targets:
        aocHelpers: all
{{ yearSchemes }}
{{ yearTestSchemes }}
  createYear:
    build:
      targets:
        createYear: run
targets:
  aocHelpers:
    type: library.static
    sources: [aocHelpers]
    platform: iOS
{{ yearTargets }}
{{ yearTestTargets }}
  createYear:
    type: tool
    sources: [createYear]
    platform: macOS
    deploymentTarget: 10.15
    dependencies:
      - package: Then
""")

// TODO: this is copied from aocHelpers; get that to link instead, but it must be a universal library target that can link into both iOS and macOS; this will require using xcconfigs; OR, put these in Pippin/Extensions for regex; this will require publishing it as a Swift package since this is a CLI that cannot link in pods... or, to link Pippin/Extensions as a static library
extension String {
    func matches(_ regex: String) throws -> Bool {
        let regex = try NSRegularExpression(pattern: regex, options: [])
        let range = NSRange(location: 0, length: self.count)
        let match = regex.firstMatch(in: self, options: [], range: range)
        return match != nil
    }
    func captureGroup(at: Int, result: NSTextCheckingResult?) -> String {
        String(self[Range(result!.range(at: at), in: self)!])
    }
    func enumerateMatches(with regex: String, block: ((NSTextCheckingResult) -> Void)) throws {
        let regex = try NSRegularExpression(pattern: regex, options: [])
        let range = NSRange(location: 0, length: self.count)
        regex.enumerateMatches(in: self, options: [], range: range) { (result, flags, stop) in
            block(result!)
        }
    }
}
public extension String.SubSequence {
    func captureGroup(at: Int, result: NSTextCheckingResult?) -> String {
        String(self).captureGroup(at: at, result: result)
    }
}
extension NSTextCheckingResult {
    subscript(captureGroup: Int, in: String.SubSequence) -> String {
        return `in`.captureGroup(at: captureGroup, result: self)
    }
    subscript(captureGroup: Int, in: String) -> String {
        return `in`.captureGroup(at: captureGroup, result: self)
    }
}

let years = try! fileManager.contentsOfDirectory(atPath: url.path).reduce(into: [String](), { (result, next) in
    try! next.enumerateMatches(with: #"^aoc(\d*)Tests$"#) { (match) in
        result.append(match[1, next])
    }
})

let yearSchemes = years.map({
    xcodegenYearSchemeTemplate.replacingOccurrences(of: "{{ year }}", with: $0)
}).joined(separator: "\n")
let yearTestSchemes = years.map({
    xcodegenYearTestsSchemeTemplate.replacingOccurrences(of: "{{ year }}", with: $0)
}).joined(separator: "\n")
let yearTargets = years.map({
    xcodegenYearTargetTemplate.replacingOccurrences(of: "{{ year }}", with: $0)
}).joined(separator: "\n")
let yearTestTargets = years.map({
    xcodegenYearTestsTargetTemplate.replacingOccurrences(of: "{{ year }}", with: $0)
}).joined(separator: "\n")

let xcodegenSpecURL = url.appendingPathComponent("AdventOfCode.yml")
let resolvedSpec = xcodegenTemplate
    .replacingOccurrences(of: "{{ yearSchemes }}", with: yearSchemes)
    .replacingOccurrences(of: "{{ yearTestSchemes }}", with: yearTestSchemes)
    .replacingOccurrences(of: "{{ yearTargets }}", with: yearTargets)
    .replacingOccurrences(of: "{{ yearTestTargets }}", with: yearTestTargets)
    .appending("\n")
try! resolvedSpec.write(to: xcodegenSpecURL, atomically: true, encoding: .utf8)

Process().do {
    $0.executableURL = URL(fileURLWithPath: "/usr/local/bin/xcodegen")
    $0.arguments = ["--spec", xcodegenSpecURL.path]
    try! $0.run()
}
