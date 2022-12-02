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
let yearDirectory = url.appendingPathComponent("aoc\(year)")

func fixedWidthDay(day: Int) -> String {
    day < 10 ? "0\(day)" : "\(day)"
}

/**
 Location of directory in which problem sets are located.
 ```
 path/
 ├── aoc<year>/
 │   ├── Info.plist (for the test target)
 │   ├── Day1/
 │   │   ├── Day01Input.swift
 │   │   ├── Day01Part1.swift
 │   │   ├── Day01Part2.swift
 │   │   ├── Day01Problem.swift
 │   │   └── Day1Tests.swift
 │   ├── Day2/
 │   │   ├── Day02Input.swift
 ...
 ```
 */
func createDay(day: Int) {
    let currentDirectoryURL = URL(fileURLWithPath: FileManager.default.currentDirectoryPath)
    let bundleURL = URL(fileURLWithPath: "createYearResources.bundle", relativeTo: currentDirectoryURL)
    let bundle = Bundle(url: bundleURL)
    func contentsOfTemplate(named name: String) -> String {
        // if this line crashes, make sure createYearResources is listed in createYear's Dependencies Build Phase. It doesn't get put there by XcodeGen, see https://github.com/yonaskolb/XcodeGen/issues/1155
        try! String(contentsOf: bundle!.url(forResource: name, withExtension: "txt")!)
    }

    let fixedWidthDayString = fixedWidthDay(day: day)
    let dayDirName = "Day" + fixedWidthDayString
    let directory = yearDirectory.appendingPathComponent(dayDirName)
    if !fileManager.fileExists(atPath: directory.path) {
        try! fileManager.createDirectory(at: directory, withIntermediateDirectories: true, attributes: nil)
    }
    func resolveTemplate(named name: String) {
        let fileURL = directory.appendingPathComponent("\(dayDirName)\(name).swift")
        guard !fileManager.fileExists(atPath: fileURL.path) else { return }
        try! contentsOfTemplate(named: name)
            .replacingOccurrences(of: "{{ date }}", with: dateString)
            .replacingOccurrences(of: "{{ day }}", with: fixedWidthDayString)
            .replacingOccurrences(of: "{{ year }}", with: year)
            .write(to: fileURL, atomically: false, encoding: .utf8)
    }

    ["Description", "Part1", "Part2", "Tests"].forEach {
        resolveTemplate(named: $0)
    }
}

for day in 1...25 {
    createDay(day: day)
}

let infoplistContents = ("""
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>CFBundleDevelopmentRegion</key>
    <string>$(DEVELOPMENT_LANGUAGE)</string>
    <key>CFBundleExecutable</key>
    <string>$(EXECUTABLE_NAME)</string>
    <key>CFBundleIdentifier</key>
    <string>$(PRODUCT_BUNDLE_IDENTIFIER)</string>
    <key>CFBundleInfoDictionaryVersion</key>
    <string>6.0</string>
    <key>CFBundleName</key>
    <string>$(PRODUCT_NAME)</string>
    <key>CFBundlePackageType</key>
    <string>$(PRODUCT_BUNDLE_PACKAGE_TYPE)</string>
    <key>CFBundleShortVersionString</key>
    <string>1.0</string>
    <key>CFBundleVersion</key>
    <string>1</string>
    <key>NSPrincipalClass</key>
    <string></string>
</dict>
</plist>
""")
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
    sources:
      - path: aoc{{ year }}
        excludes:
          - "**/*Tests.swift"
    dependencies:
      - target: aocHelpers
        link: true
    platform: macOS
    deploymentTarget: 10.15
    scheme:
      testTargets:
        - aoc{{ year }}Tests
""")
let xcodegenYearTestsTargetTemplate = ("""
  aoc{{ year }}Tests:
    type: bundle.unit-test
    platform: macOS
    deploymentTarget: 10.15
    sources: [{{ testSources }}]
    dependencies:
      - target: aoc{{ year }}
      - package: RegularExpressionDecoder
        link: true
""")
let xcodegenTemplate = ("""
name: AdventOfCode
fileGroups:
  - AdventOfCode.yml
  - README.md
  - Gemfile
  - Brewfile
  - Makefile
packages:
  Then:
    url: https://github.com/devxoul/Then
    from: 2.0.0
  RegularExpressionDecoder:
    url: https://github.com/Flight-School/RegularExpressionDecoder
    from: 0.1.0
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
    platform: macOS
    deploymentTarget: 10.15
{{ yearTargets }}
{{ yearTestTargets }}
  createYear:
    type: tool
    sources: [createYear]
    platform: macOS
    deploymentTarget: 10.15
    dependencies:
      - package: Then
      - bundle: copyYearResources
  createYearResources:
    type: bundle
    sources: [createYearResources]
    platform: macOS
    deploymentTarget: 10.15
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
// end copied portion from aocHelpers

let years = try! fileManager.contentsOfDirectory(atPath: url.path).reduce(into: [String](), { (result, next) in
    try! next.enumerateMatches(with: #"^aoc(\d*)$"#) { (match) in
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
let yearTestTargets = years.map({ year in
    xcodegenYearTestsTargetTemplate
        .replacingOccurrences(of: "{{ year }}", with: year)
        .replacingOccurrences(of: "{{ testSources }}", with: (1...25).map({fixedWidthDay(day: $0)}).map({ (day) -> String in
            "aoc\(year)/Day\(day)/Day\(day)Tests.swift"
        }).joined(separator: ",").appending(",aoc\(year)/Info.plist"))
}).joined(separator: "\n")

let xcodegenSpecURL = url.appendingPathComponent("AdventOfCode.yml")
let resolvedSpec = xcodegenTemplate
    .replacingOccurrences(of: "{{ yearSchemes }}", with: yearSchemes)
    .replacingOccurrences(of: "{{ yearTestSchemes }}", with: yearTestSchemes)
    .replacingOccurrences(of: "{{ yearTargets }}", with: yearTargets)
    .replacingOccurrences(of: "{{ yearTestTargets }}", with: yearTestTargets)
    .appending("\n")
try! resolvedSpec.write(to: xcodegenSpecURL, atomically: true, encoding: .utf8)

try! infoplistContents.write(to: yearDirectory.appendingPathComponent("Info.plist"), atomically: true, encoding: .utf8)

Process().do {
    $0.executableURL = URL(fileURLWithPath: "/usr/local/bin/xcodegen")
    $0.arguments = ["--spec", xcodegenSpecURL.path]
    try! $0.run()
}
