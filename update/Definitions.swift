//
//  Definitions.swift
//  update
//
//  Created by Andrew McKnight on 12/3/22.
//

import aocHelpers
import Foundation
import Then

// TODO: copied from Pippin, which can't currently be linked in statically via cocoapods. move its functions into a SPM-managed lib.
public extension String {
    /// Break up a multiline string into an array of each line's string value.
    var lines: [String] {
        return split(separator: "\n").map({String($0)})
    }
}
// end copied code from Pippin

enum AoC {
    enum Template {
        static let infoplistContents = ("""
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

        static let xcodegenYearSchemeTemplate = ("""
          aoc{{ year }}:
            build:
              targets:
                  aoc{{ year }}: all
        """)

        static let xcodegenYearTestsSchemeTemplate = ("""
          aoc{{ year }}Tests:
            build:
              targets:
                  aoc{{ year }}Tests: test
            test:
              targets: [aoc{{ year }}Tests]
        """)

        static let xcodegenYearTargetTemplate = ("""
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

        static let xcodegenYearTestsTargetTemplate = ("""
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

        static let xcodegenTemplate = ("""
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
          update:
            build:
              targets:
                update: run
        targets:
          aocHelpers:
            type: library.static
            sources: [aocHelpers]
            platform: macOS
            deploymentTarget: 10.15
        {{ yearTargets }}
        {{ yearTestTargets }}
          update:
            type: tool
            sources: [update]
            platform: macOS
            deploymentTarget: 10.15
            dependencies:
              - package: Then
              - bundle: createYearResources
              - target: aocHelpers
                link: true
          createYearResources:
            type: bundle
            sources: [createYearResources]
            platform: macOS
            deploymentTarget: 10.15
        """)

        static let makefileTestTask = ("""
        \txcodebuild -scheme aoc{{ year }}Tests -workspace AdventOfCode.xcworkspace test 2>/dev/null | rbenv exec bundle exec xcpretty -t
        """)

        static let podfileTargets = ("""
          target "aoc{{ year }}"
          target "aoc{{ year }}Tests"\n
        """)
    }

    enum Date {
        static let formatter = DateFormatter().then {
            $0.dateStyle = .medium
            $0.timeStyle = .none
        }
        static let date = Foundation.Date()
        static let dateString = formatter.string(from: date)
        static let calendar = Calendar(identifier: .gregorian)
        static let currentDateComponents = calendar.dateComponents(Set([.day, .year, .hour]), from: date)
        static let currentDay = currentDateComponents.day!
        static let currentDayString = String(currentDay)
        static let currentYear = currentDateComponents.year!
        static let currentYearString = String(currentYear)
    }

    enum File {
        static let path = #file.components(separatedBy: "/").with {
            $0.removeSubrange($0.count - 2 ... $0.count - 1)
        }.joined(separator: "/")

        static let rootURL = URL(fileURLWithPath: path, isDirectory: true)
        static let fileManager = FileManager.default
        static let makefileURL = rootURL.appendingPathComponent("Makefile")
        static var makefileContents: String {
            try! String(contentsOf: makefileURL)
        }

        static let xcodegenSpecURL = rootURL.appendingPathComponent("AdventOfCode.yml")
        static let xcodeWorkspaceURL = rootURL.appendingPathComponent("AdventOfCode.xcworkspace")

        static let bundleURL = URL(fileURLWithPath: "createYearResources.bundle", relativeTo: URL(fileURLWithPath: FileManager.default.currentDirectoryPath))
        static let bundle = Bundle(url: bundleURL)!

        static let podfileURL = rootURL.appendingPathComponent("Podfile")
        static var podfileContents: String {
            try! String(contentsOf: podfileURL)
        }
    }
}

func injectMissingTestTasks(for year: Int) {
    let taskLine = AoC.Template.makefileTestTask.replacingOccurrences(of: "{{ year }}", with: String(year))

    AoC.File.makefileContents.do {
        if !$0.contains(taskLine) {
            try! $0.appending(taskLine + "\n").write(to: AoC.File.makefileURL, atomically: true, encoding: .utf8)
        }
    }
}

func fixedWidthDay(day: Int) -> String {
    day < 10 ? "0\(day)" : "\(day)"
}

let config = URLSessionConfiguration.default.then {
    var headers = $0.httpAdditionalHeaders ?? [:]
    headers["Cookie"] = "session=53616c7465645f5f5c26d8a40e3bae214739c44a49c6a2ff3c57ad3f2be7ce6d62c7a761617d78b1d5aa237ec25d5d623433df04c745f6a3f312edccaa866404"
    $0.httpAdditionalHeaders = headers
}
let urlSession = URLSession(configuration: config)
let group = DispatchGroup()

func fetchSynchronously(url: String) -> String {
    group.enter()
    var result: String!
    urlSession.dataTask(with: URLRequest(url: URL(string: url)!)) { data, response, error in
        defer { group.leave() }
        let status = (response as! HTTPURLResponse).statusCode
        assert(status >= 200 && status < 300)
        assert(error == nil)
        result = String(data: data!, encoding: .utf8)
    }.resume()
    group.wait()
    return result
}

func extractSampleInput(description: String) -> String {
    let sampleInputStart = (description as NSString).range(of: "<code>")
    let sampleInputEnd = (description as NSString).range(of: "</code>")
    let startIdx = description.index(description.startIndex, offsetBy: (sampleInputStart.location + sampleInputStart.length + 1))
    let endIdx = description.index(description.startIndex, offsetBy: sampleInputEnd.location)
    return String(description[startIdx ..< endIdx])
}

func extractDescription(description: String) -> String {
    let descriptionStart = (description as NSString).range(of: "<article class=\"day-desc\">")
    let descriptionEnd = (description as NSString).range(of: "</article>")
    let descStartIdx = description.index(description.startIndex, offsetBy: (descriptionStart.location + descriptionStart.length))
    let descEndIdx = description.index(description.startIndex, offsetBy: descriptionEnd.location)
    let range = descStartIdx ..< descEndIdx
    return String(description[range])
}

fileprivate func injectProblemDetails(_ fileURL: URL, day: Int, fixedWidthDay: String, year: Int) {
    var content = try! String(contentsOf: fileURL)
    let descriptionPlaceholder = "{{ description }}"
    let inputPlaceholder = "{{ input }}"
    let sampleInputPlaceholder = "{{ sample-input }}"

    lazy var description: String = {
        let problem = fetchSynchronously(url: "https://adventofcode.com/\(year)/day/\(day)")
        return extractDescription(description: problem)
    }()
    if content.contains(descriptionPlaceholder) {
        let markdown = Process.runBrewedWithResult("pandoc", stdin: description, "--from", "html", "--to", "markdown_strict")
        content = content.replacingOccurrences(of: descriptionPlaceholder, with: markdown).lines.map({$0.trimmingCharacters(in: .whitespaces)}).joined(separator: "\n")
    }
    if content.contains(sampleInputPlaceholder) {
        let sampleInput = extractSampleInput(description: description).lines.map({$0.trimmingCharacters(in: .whitespaces)}).joined(separator: "\n")
        content = content.replacingOccurrences(of: sampleInputPlaceholder, with: sampleInput)
    }

    if content.contains(inputPlaceholder) {
        let input = fetchSynchronously(url: "https://adventofcode.com/\(year)/day/\(day)/input")
        content = content.replacingOccurrences(of: inputPlaceholder, with: input)
    }
    try! content.write(to: fileURL, atomically: false, encoding: .utf8)
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
func createSourceFiles(for year: Int) {
    let yearDirectoryURL = AoC.File.rootURL.appendingPathComponent("aoc\(year)")
    try! AoC.File.fileManager.createDirectory(at: yearDirectoryURL, withIntermediateDirectories: true)

    let infoPlistURL = yearDirectoryURL.appendingPathComponent("Info.plist")
    if !AoC.File.fileManager.fileExists(atPath: infoPlistURL.path) {
        try! AoC.Template.infoplistContents.write(to: infoPlistURL, atomically: true, encoding: .utf8)
    }

    for day in 1...25 {
        let fixedWidthDay = fixedWidthDay(day: day)
        let dayName = "Day" + fixedWidthDay
        let dayDirectoryURL = yearDirectoryURL.appendingPathComponent(dayName)

        try! AoC.File.fileManager.createDirectory(at: dayDirectoryURL, withIntermediateDirectories: true, attributes: nil)

        ["Description", "Part1", "Part2", "Tests"].forEach { name in
            let fileURL = dayDirectoryURL.appendingPathComponent("\(dayName)\(name).swift")

            defer {
                if name == "Description" && isProblemAvailable(year: year, day: day) {
                    injectProblemDetails(fileURL, day: day, fixedWidthDay: fixedWidthDay, year: year)
                }
            }

            guard !AoC.File.fileManager.fileExists(atPath: fileURL.path) else { return }

            try! String(contentsOf: AoC.File.bundle.url(forResource: name, withExtension: "txt")!)
                .replacingOccurrences(of: "{{ date }}", with: AoC.Date.dateString)
                .replacingOccurrences(of: "{{ day }}", with: fixedWidthDay)
                .replacingOccurrences(of: "{{ year }}", with: String(year))
                .write(to: fileURL, atomically: false, encoding: .utf8)
        }
    }
}

func isProblemAvailable(year: Int, day: Int) -> Bool {
    if year < AoC.Date.currentYear { return true }
    if day < AoC.Date.currentDay { return true }
    if day > AoC.Date.currentDay || year > AoC.Date.currentYear { return false }

    var cal = Calendar(identifier: .gregorian)
    cal.timeZone = TimeZone(secondsFromGMT: 0)!
    var components = DateComponents()
    components.hour = 0
    components.year = AoC.Date.currentYear
    components.day = AoC.Date.currentDay
    let midnightUTC = cal.date(from: components)

    return midnightUTC?.compare(Date()) == .orderedDescending
}

func generateXcodeGenSpec() {
    let years = try! AoC.File.fileManager.contentsOfDirectory(atPath: AoC.File.rootURL.path).reduce(into: [String](), { (result, next) in
        try! next.enumerateMatches(with: #"^aoc(\d*)$"#) { (match) in
            result.append(match[1, next])
        }
    })

    let yearSchemes = years.map({
        AoC.Template.xcodegenYearSchemeTemplate.replacingOccurrences(of: "{{ year }}", with: $0)
    }).joined(separator: "\n")
    let yearTestSchemes = years.map({
        AoC.Template.xcodegenYearTestsSchemeTemplate.replacingOccurrences(of: "{{ year }}", with: $0)
    }).joined(separator: "\n")
    let yearTargets = years.map({
        AoC.Template.xcodegenYearTargetTemplate.replacingOccurrences(of: "{{ year }}", with: $0)
    }).joined(separator: "\n")
    let yearTestTargets = years.map({ year in
        AoC.Template.xcodegenYearTestsTargetTemplate
            .replacingOccurrences(of: "{{ year }}", with: year)
            .replacingOccurrences(of: "{{ testSources }}", with: (1...25).map({fixedWidthDay(day: $0)}).map({ (day) -> String in
                "aoc\(year)/Day\(day)/Day\(day)Tests.swift"
            }).joined(separator: ",").appending(",aoc\(year)/Info.plist"))
    }).joined(separator: "\n")

    try! AoC.Template.xcodegenTemplate
        .replacingOccurrences(of: "{{ yearSchemes }}", with: yearSchemes)
        .replacingOccurrences(of: "{{ yearTestSchemes }}", with: yearTestSchemes)
        .replacingOccurrences(of: "{{ yearTargets }}", with: yearTargets)
        .replacingOccurrences(of: "{{ yearTestTargets }}", with: yearTestTargets)
        .appending("\n")
        .write(to: AoC.File.xcodegenSpecURL, atomically: true, encoding: .utf8)
}

extension Process {
    static func run(_ path: String, _ arguments: String ...) {
        _run(path, Array(arguments))
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
        return AoC.File.fileManager.fileExists(atPath: x86_64Path) ? x86_64Path : "/opt/homebrew/bin/\(utility)"
    }

    private static func _run(_ path: String, stdin: String? = nil, stdout: Pipe? = nil, _ arguments: [String]) {
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
            try! $0.run()
        }
    }
}

func generateXcodeProject() {
    Process.runBrewed("xcodegen", "--spec", AoC.File.xcodegenSpecURL.path)
}

func openXcodeProject() {
    Process.run("/usr/bin/xed", AoC.File.xcodeWorkspaceURL.path)
}

func injectMissingPodfileTargets(for year: Int) {
    let targetLine = AoC.Template.podfileTargets.replacingOccurrences(of: "{{ year }}", with: String(year))
    AoC.File.podfileContents.do {
        if !$0.contains(targetLine) {
            var lines = ($0 as String).lines
            let lastEnd = lines.lastIndex { line in
                line.contains("end")
            }!
            lines.insert(targetLine, at: lastEnd)
            try! (lines.joined(separator: "\n") + "\n").write(to: AoC.File.podfileURL, atomically: true, encoding: .utf8)
        }
    }
}

func reinstallPods() {
    Process.run("/usr/bin/make", "pods")
}
