//
//  Day04Problem.swift
//  aoc2020
//
//  Created by Andrew McKnight on Dec 18, 2020.
//

import aoc2020
import XCTest

class Day04Tests: XCTestCase {
    func testPart1Sample() {
        XCTAssertEqual(Day04.sample.part1, 2)
    }

    func testPart1() {
        XCTAssertEqual(Day04.input.part1, 256)
    }

    func testPart2Sample() {
        XCTAssertEqual(Day04.sample.part2, 2)
    }

    func testPart2Invalid() {
        XCTAssertEqual(Day04.invalidInput.part2, 0)
    }

    func testPart2Valid() {
        XCTAssertEqual(Day04.validInput.part2, 4)
    }

    func testPart2() {
        XCTAssertEqual(Day04.input.part2, 198)
    }
}
