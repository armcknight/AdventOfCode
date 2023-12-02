//
//  Functions.swift
//  update
//
//  Created by Andrew McKnight on 12/5/22.
//

import Foundation
import SwiftArmcknight

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

enum FetchError: String, Error {
    case notYetAvailable
    case requestError
    case networkError
}

func fetchSynchronously(url: String) -> Result<String, FetchError> {
    group.enter()
    var result: Result<String, FetchError>!
    urlSession.dataTask(with: URLRequest(url: URL(string: url)!)) { data, response, error in
        defer { group.leave() }
        
        guard error == nil else {
            result = .failure(.networkError)
            return
        }
        
        let status = (response as! HTTPURLResponse).statusCode
        
        // if this path is taken, most likely the problem doesn't exist yet, like trying to fetch year X day 5 when it's still day 4
        guard status != 404 else {
            result = .failure(.networkError)
            return
        }
        
        // If this fails, check that the session cookie is valid and the network connection is operational.
        guard status >= 200 && status < 300 else {
            result = .failure(.requestError)
            return
        }
    
        result = .success(String(data: data!, encoding: .utf8)!)
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

    guard content.contains(descriptionPlaceholder), content.contains(inputPlaceholder), content.contains(sampleInputPlaceholder) else {
        print("Already have problem details for year \(year) day \(day), won't request again")
        return
    }
    
    print("Fetching problem details for year \(year) day \(day)")
    switch fetchSynchronously(url: "https://adventofcode.com/\(year)/day/\(day)") {
    case .failure(let fetchError):
        switch fetchError {
        case .networkError:
            fatalError("Network failure")
        case .notYetAvailable:
            fatalError("Shouldn't have requested an unavailable day problem")
        case .requestError:
            fatalError("Unsuccessful request")
        }
    case .success(let problem):
        let description = extractDescription(description: problem)
        
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
            switch fetchSynchronously(url: "https://adventofcode.com/\(year)/day/\(day)/input") {
            case .failure(let fetchError):
                fatalError(fetchError.rawValue)
            case .success(let input):
                content = content.replacingOccurrences(of: inputPlaceholder, with: input.trimmingCharacters(in: .newlines))
            }
        }
        try! content.write(to: fileURL, atomically: false, encoding: .utf8)
    }
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

    for day in availableProblemDays(year: year) {
        let fixedWidthDay = fixedWidthDay(day: day)
        let dayName = "Day" + fixedWidthDay
        let dayDirectoryURL = yearDirectoryURL.appendingPathComponent(dayName)

        try! AoC.File.fileManager.createDirectory(at: dayDirectoryURL, withIntermediateDirectories: true, attributes: nil)

        ["Description", "Part1", "Part2", "Tests", "Benchmarks"].forEach { name in
            let fileURL = dayDirectoryURL.appendingPathComponent("\(dayName)\(name).swift")

            defer {
                if hasCookie && name == "Description" {
                    injectProblemDetails(fileURL, day: day, fixedWidthDay: fixedWidthDay, year: year)
                }
            }

            guard !AoC.File.fileManager.fileExists(atPath: fileURL.path) else {
                print("Already created \(fileURL)")
                return
            }

            print("Creating \(fileURL)")
            try! String(contentsOf: AoC.File.bundle.url(forResource: name, withExtension: "txt")!)
                .replacingOccurrences(of: "{{ date }}", with: AoC.Date.dateString)
                .replacingOccurrences(of: "{{ day }}", with: fixedWidthDay)
                .replacingOccurrences(of: "{{ year }}", with: String(year))
                .write(to: fileURL, atomically: false, encoding: .utf8)
        }
    }
}

func availableProblemDays(year: Int) -> ClosedRange<Int> {
    var utcCalendar = Calendar(identifier: .gregorian)
    utcCalendar.timeZone = TimeZone(secondsFromGMT: 0)!
    let currentDateComponentsUTC = utcCalendar.dateComponents([.day, .year, .month], from: AoC.Date.date)
    let currentYearUTC = currentDateComponentsUTC.year!
    
    if year < currentYearUTC {
        return 1...25
    }
    
    let currentMonthUTC = currentDateComponentsUTC.month!
    if currentMonthUTC < 12 {
        fatalError("Gotta wait till December! :)")
    }
    
    let currentDayUTC = currentDateComponentsUTC.day!
    return 1...currentDayUTC
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
            .replacingOccurrences(of: "{{ testSources }}", with: availableProblemDays(year: Int(year)!).map({fixedWidthDay(day: $0)}).map({ (day) -> String in
                "aoc\(year)/Day\(day)/Day\(day)Tests.swift"
            }).joined(separator: ",").appending(",aoc\(year)/Info.plist"))
    }).joined(separator: "\n")

    let yearBenchmarkTargets = years.map({ year in
        AoC.Template.xcodegenYearBenchmarksTargetTemplate
            .replacingOccurrences(of: "{{ year }}", with: year)
            .replacingOccurrences(of: "{{ benchmarkSources }}", with: availableProblemDays(year: Int(year)!).map({fixedWidthDay(day: $0)}).map({ (day) -> String in
                "aoc\(year)/Day\(day)/Day\(day)Benchmarks.swift"
            }).joined(separator: ",").appending(",aoc\(year)/Info.plist"))
    }).joined(separator: "\n")

    try! AoC.Template.xcodegenTemplate
        .replacingOccurrences(of: "{{ yearSchemes }}", with: yearSchemes)
        .replacingOccurrences(of: "{{ yearTestSchemes }}", with: yearTestSchemes)
        .replacingOccurrences(of: "{{ yearBenchmarkSchemes }}", with: yearBenchmarkSchemes)
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
