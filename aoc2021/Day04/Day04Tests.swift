//
//  Day04Problem.swift
//  aoc2021
//
//  Created by Andrew McKnight on Nov 30, 2021.
//

import aoc2021
import XCTest

class Day04Tests: XCTestCase {
    func testPart1Sample() {
        XCTAssertEqual(Day04.sample.part1, 4512)
    }

    func testPart1() {
        XCTAssertEqual(Day04.input.part1, 2745)
    }

    func testPart2Sample() {
        XCTAssertEqual(Day04.sample.part2, 1924)
    }

    func testPart2() {
        XCTAssertEqual(Day04.input.part2, 6594)
    }
}
