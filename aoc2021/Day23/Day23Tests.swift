//
//  Day23Tests.swift
//  aoc2021
//
//  Created by Andrew McKnight on Dec 5, 2021.
//

import aoc2021
import XCTest

class Day23Tests: XCTestCase {
    func testPart1Sample() {
        XCTAssertEqual(Day23.sample.part1, -1)
    }

    func testPart1() {
        XCTAssertEqual(Day23.input.part1, -1)
    }

    func testPart2Sample() {
        XCTAssertEqual(Day23.sample.part2, -1)
    }

    func testPart2() {
        XCTAssertEqual(Day23.input.part2, -1)
    }

    func testPart2Benchmarked() {
        measure {
            XCTAssertEqual(Day23.input.part2, -1)
        }
    }
}
