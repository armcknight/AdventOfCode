//
//  Day15Tests.swift
//  aoc2021
//
//  Created by Andrew McKnight on Dec 5, 2021.
//

import aoc2021
import XCTest

class Day15Tests: XCTestCase {
    func testPart1Sample() {
        XCTAssertEqual(Day15.sample.part1, 40)
    }

    func testPart1() {
        XCTAssertEqual(Day15.input.part1, 581)
    }

    func testPart2Sample() {
        XCTAssertEqual(Day15.sample.part2, 315)
    }

    func testPart2() {
        XCTAssertEqual(Day15.input.part2, -1)
    }

    func testPart2Benchmarked() {
        measure {
            XCTAssertEqual(Day15.input.part2, -1)
        }
    }
}
