//
//  Day11Tests.swift
//  aoc2021
//
//  Created by Andrew McKnight on Dec 5, 2021.
//

import aoc2021
import XCTest

class Day11Tests: XCTestCase {
    func testPart1Sample() {
        XCTAssertEqual(Day11.sample.part1, 1656)
    }

    func testPart1() {
        XCTAssertEqual(Day11.input.part1, 1755)
    }

    func testPart2Sample() {
        XCTAssertEqual(Day11.sample.part2, -1)
    }

    func testPart2() {
        XCTAssertEqual(Day11.input.part2, -1)
    }
}
