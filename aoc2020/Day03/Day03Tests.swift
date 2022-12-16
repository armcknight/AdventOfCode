//
//  Day03Problem.swift
//  aoc2020
//
//  Created by Andrew McKnight on Dec 18, 2020.
//

import aoc2020
import XCTest

class Day03Tests: XCTestCase {
    func testPart1Sample() {
        XCTAssertEqual(Day03.sample.part1, 7)
    }

    func testPart1() {
        XCTAssertEqual(Day03.input.part1, 252)
    }

    func testPart2Sample() {
        XCTAssertEqual(Day03.sample.part2, 336)
    }

    func testPart2() {
        XCTAssertEqual(Day03.input.part2, 2608962048)
    }
}
