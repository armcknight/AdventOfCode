//
//  Functions.swift
//  update
//
//  Created by Andrew McKnight on 12/5/22.
//

import Foundation

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
    description.substring(from: "<pre>", to: "</pre>").substring(from: "<code>", to: "</code>")
}

func extractDescription(description: String) -> String {
    description.substring(from: "<article class=\"day-desc\">", to: "</article>")
}

func injectProblemDetails(_ fileURL: URL, day: Int, fixedWidthDay: String, year: Int) {
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
        let extractedSection = extractSampleInput(description: description)
        let sampleInput = extractedSection.lines.map({$0.trimmingCharacters(in: .whitespaces)}).joined(separator: "\n")
        content = content.replacingOccurrences(of: sampleInputPlaceholder, with: sampleInput)
    }

    if content.contains(inputPlaceholder) {
        let input = fetchSynchronously(url: "https://adventofcode.com/\(year)/day/\(day)/input").trimmingCharacters(in: .newlines)
        content = content.replacingOccurrences(of: inputPlaceholder, with: input)
    }
    try! content.write(to: fileURL, atomically: false, encoding: .utf8)
}

/**
 Location of directory in which problem sets are located.
 ```
 path/
 ├── aoc<year>/
 │   ├── Info.plist (for the test targets)
 │   ├── Day1/
 │   │   ├── Day01Description.swift
 │   │   ├── Day01Part1.swift
 │   │   ├── Day01Part2.swift
 │   │   ├── Day01Tests.swift
 │   │   └── Day01Benchmarks.swift
 │   ├── Day2/
 │   │   ├── Day02Description.swift
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

        ["Description", "Part1", "Part2", "Tests", "Benchmarks"].forEach { name in
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
    var utcCalendar = Calendar(identifier: .gregorian)
    utcCalendar.timeZone = TimeZone(secondsFromGMT: 0)!
    let currentDateComponentsUTC = utcCalendar.dateComponents([.day, .year], from: AoC.Date.date)
    let currentDayUTC = currentDateComponentsUTC.day!
    let currentYearUTC = currentDateComponentsUTC.year!

    return year <= currentYearUTC && day <= currentDayUTC
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

    let yearBenchmarkSchemes = years.map({
        AoC.Template.xcodegenYearBenchmarksSchemeTemplate.replacingOccurrences(of: "{{ year }}", with: $0)
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

    let yearBenchmarkTargets = years.map({ year in
        AoC.Template.xcodegenYearBenchmarksTargetTemplate
            .replacingOccurrences(of: "{{ year }}", with: year)
            .replacingOccurrences(of: "{{ benchmarkSources }}", with: (1...25).map({fixedWidthDay(day: $0)}).map({ (day) -> String in
                "aoc\(year)/Day\(day)/Day\(day)Benchmarks.swift"
            }).joined(separator: ",").appending(",aoc\(year)/Info.plist"))
    }).joined(separator: "\n")

    try! AoC.Template.xcodegenTemplate
        .replacingOccurrences(of: "{{ yearSchemes }}", with: yearSchemes)
        .replacingOccurrences(of: "{{ yearTestSchemes }}", with: yearTestSchemes)
        .replacingOccurrences(of: "{{ yearBenchmarksSchemes }}", with: yearBenchmarkSchemes)
        .replacingOccurrences(of: "{{ yearTargets }}", with: yearTargets)
        .replacingOccurrences(of: "{{ yearTestTargets }}", with: yearTestTargets)
        .replacingOccurrences(of: "{{ yearBenchmarkTargets }}", with: yearBenchmarkTargets)
        .appending("\n")
        .write(to: AoC.File.xcodegenSpecURL, atomically: true, encoding: .utf8)
}

func generateXcodeProject() {
    Process.runBrewed("xcodegen", "--spec", AoC.File.xcodegenSpecURL.path)
}

func openXcodeProject() {
    Process.run("/usr/bin/xed", AoC.File.xcodeWorkspaceURL.path)
}
