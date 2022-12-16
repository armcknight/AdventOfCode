//
//  Day14Problem.swift
//  aoc2020
//
//  Created by Andrew McKnight on Dec 18, 2020.
//

import aoc2020
import XCTest

class Day14Tests: XCTestCase {
    func testPart1Sample() {
        XCTAssertEqual(Day14.sample.part1, 165)
    }

    func testPart1() {
        XCTAssertEqual(Day14.input.part1, 9879607673316)
    }

    func testPart2Sample() {
        XCTAssertEqual(Day14.part2Sample .part2, 208)
    }

    func testPart2() {
        XCTAssertEqual(Day14.input.part2, 3435342392262)
    }
}
