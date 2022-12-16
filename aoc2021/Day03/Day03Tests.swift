//
//  Day03Problem.swift
//  aoc2021
//
//  Created by Andrew McKnight on Nov 30, 2021.
//

import aoc2021
import XCTest

class Day03Tests: XCTestCase {
    func testPart1Sample() {
        XCTAssertEqual(Day03.sample.part1, 198)
    }

    func testPart1() {
        XCTAssertEqual(Day03.input.part1, 3633500)
    }

    func testPart2Sample() {
        XCTAssertEqual(Day03.sample.part2, 230)
    }

    func testPart2() {
        XCTAssertEqual(Day03.input.part2, 4550283)
    }
}
