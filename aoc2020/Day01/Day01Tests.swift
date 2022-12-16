//
//  Day01Problem.swift
//  aoc2020
//
//  Created by Andrew McKnight on Dec 18, 2020.
//

import aoc2020
import XCTest

class Day01Tests: XCTestCase {
    func testPart1Sample() {
        XCTAssertEqual(Day01.sample.part1, 514579)
    }

    func testPart1() {
        XCTAssertEqual(Day01.input.part1, 802011)
    }

    func testPart2Sample() {
        XCTAssertEqual(Day01.sample.part2, 241861950)
    }

    func testPart2() {
        XCTAssertEqual(Day01.input.part2, 248607374)
    }
}
