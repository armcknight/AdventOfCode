//
//  Definitions.swift
//  update
//
//  Created by Andrew McKnight on 12/3/22.
//

import Foundation
import Then

let hasCookie = ProcessInfo.processInfo.environment.keys.contains("cookie")

/// This will have to be updated with each new auth session in order to retrieve new problem info.
let cookie = ProcessInfo.processInfo.environment["cookie"]!

// TODO: copied from Pippin, which can't currently be linked in statically via cocoapods. move its functions into a SPM-managed lib.
public extension String {
    /// Break up a multiline string into an array of each line's string value.
    var lines: [String] {
        return components(separatedBy: "\n").map({String($0)})
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

        static let xcodegenYearBenchmarksSchemeTemplate = ("""
          aoc{{ year }}Benchmarks:
            build:
              targets:
                  aoc{{ year }}Benchmarks: test
            test:
              targets: [aoc{{ year }}Benchmarks]
        """)

        static let xcodegenYearTargetTemplate = ("""
          aoc{{ year }}:
            type: library.static
            sources:
              - path: aoc{{ year }}
                excludes:
                  - "**/*Tests.swift"
                  - "**/*Benchmarks.swift"
            dependencies:
              - package: RegularExpressionDecoder
            platform: macOS
            deploymentTarget: 10.15
            requiresObjCLinking: false
            scheme:
              testTargets:
                - aoc{{ year }}Tests
        """)

        static let xcodegenYearTestsTargetTemplate = ("""
          aoc{{ year }}Tests:
            type: bundle.unit-test
            platform: macOS
            requiresObjCLinking: false
            deploymentTarget: 10.15
            sources: [{{ testSources }}]
            dependencies:
              - target: aoc{{ year }}
        """)

        static let xcodegenYearBenchmarksTargetTemplate = ("""
          aoc{{ year }}Benchmarks:
            type: bundle.unit-test
            platform: macOS
            requiresObjCLinking: false
            deploymentTarget: 10.15
            sources: [{{ benchmarkSources }}]
            dependencies:
              - target: aoc{{ year }}
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
          SwiftArmcknight:
            path: ./swift-armcknight
        schemes:
        {{ yearSchemes }}
        {{ yearTestSchemes }}
        {{ yearBenchmarkSchemes }}
          update:
            build:
              targets:
                update: run
            run:
              environmentVariables:
                cookie: COOKIE_VALUE
                year: YEAR
        targets:
        {{ yearTargets }}
        {{ yearTestTargets }}
        {{ yearBenchmarkTargets }}
          update:
            type: tool
            sources: [update]
            platform: macOS
            deploymentTarget: 10.15
            requiresObjCLinking: false
            dependencies:
              - bundle: createYearResources
              - package: Then
              - package: SwiftArmcknight
          createYearResources:
            type: bundle
            sources: [createYearResources]
            platform: macOS
            deploymentTarget: 10.15
        """)

        static let makefileTestTask = ("""
        \txcodebuild -scheme aoc{{ year }}Tests -project AdventOfCode.xcodeproj test 2>/dev/null | xcbeautify --quieter --is-ci
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
        static let currentDateComponents = calendar.dateComponents(Set([.day, .year, .hour, .month]), from: date)
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
        static let xcodeWorkspaceURL = rootURL.appendingPathComponent("AdventOfCode.xcodeproj")

        static let bundleURL = URL(fileURLWithPath: "createYearResources.bundle", relativeTo: URL(fileURLWithPath: FileManager.default.currentDirectoryPath))
        static let bundle = Bundle(url: bundleURL)!
    }
}

let config = URLSessionConfiguration.default.then {
    if cookie == "COOKIE_VALUE" {
        fatalError("Needs a current session cookie")
    }
    var headers = $0.httpAdditionalHeaders ?? [:]
    headers["Cookie"] = "session=\(cookie)"
    $0.httpAdditionalHeaders = headers
}
let urlSession = URLSession(configuration: config)
let group = DispatchGroup()
