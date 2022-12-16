//
//  Day13Tests.swift
//  aoc2021
//
//  Created by Andrew McKnight on Dec 5, 2021.
//

import aoc2021
import XCTest

class Day13Tests: XCTestCase {
    func testPart1Sample() {
        XCTAssertEqual(Day13.sample.part1, 17)
    }

    func testPart1() {
        XCTAssertEqual(Day13.input.part1, 765)
    }

    /// See printed console output for answer.
    func testPart2() {
        XCTAssertEqual(Day13.input.part2, -1)
    }
}
