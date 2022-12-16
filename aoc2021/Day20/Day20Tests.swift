//
//  Day20Tests.swift
//  aoc2021
//
//  Created by Andrew McKnight on Dec 5, 2021.
//

import aoc2021
import XCTest

class Day20Tests: XCTestCase {
    func testPart1Sample() {
        XCTAssertEqual(Day20.sample.part1, 35)
    }

    func testPart1() {
        XCTAssertEqual(Day20.input.part1, 5097)
    }

    func testPart2Sample() {
        XCTAssertEqual(Day20.sample.part2, 3351)
    }

    func testPart2() {
        XCTAssertEqual(Day20.input.part2, 17987)
    }
}
