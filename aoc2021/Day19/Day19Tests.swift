//
//  Day19Tests.swift
//  aoc2021
//
//  Created by Andrew McKnight on Dec 5, 2021.
//

import aoc2021
import XCTest

class Day19Tests: XCTestCase {
    func testPart1Sample() {
        XCTAssertEqual(Day19.sample.part1, 79)
    }

    func testPart1() {
        XCTAssertEqual(Day19.input.part1, -1)
    }

    func testPart2Sample() {
        XCTAssertEqual(Day19.sample.part2, -1)
    }

    func testPart2() {
        XCTAssertEqual(Day19.input.part2, -1)
    }

    func testPart2Benchmarked() {
        measure {
            XCTAssertEqual(Day19.input.part2, -1)
        }
    }
}
