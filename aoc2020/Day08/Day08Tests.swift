//
//  Day08Problem.swift
//  aoc2020
//
//  Created by Andrew McKnight on Dec 18, 2020.
//

import aoc2020
import XCTest

class Day08Tests: XCTestCase {
    func testPart1Sample() {
        XCTAssertEqual(Day08.sample.part1, 5)
    }

    func testPart1() {
        XCTAssertEqual(Day08.input.part1, 1087)
    }

    func testPart2Sample() {
        XCTAssertEqual(Day08.sample.part2, 8)
    }

    func testPart2() {
        XCTAssertEqual(Day08.input.part2, 780)
    }
}
