//
//  Day06Problem.swift
//  aoc2020
//
//  Created by Andrew McKnight on Dec 18, 2020.
//

import aoc2020
import XCTest

class Day06Tests: XCTestCase {
    func testPart1Sample() {
        XCTAssertEqual(Day06.sample.part1, 11)
    }

    func testPart1() {
        XCTAssertEqual(Day06.input.part1, 6583)
    }

    func testPart2Sample() {
        XCTAssertEqual(Day06.sample.part2, 6)
    }

    func testPart2() {
        XCTAssertEqual(Day06.input.part2, 3290)
    }
}
