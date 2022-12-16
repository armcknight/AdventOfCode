//
//  Day07Problem.swift
//  aoc2020
//
//  Created by Andrew McKnight on Dec 18, 2020.
//

import aoc2020
import XCTest

class Day07Tests: XCTestCase {
    func testPart1Sample() {
        XCTAssertEqual(Day07.sample.part1, 4)
    }

    func testPart1_VerySlowButDoesIndeedFinish() {
        XCTAssertEqual(Day07.input.part1, 128)
    }

    func testPart2Sample() throws {
        throw XCTSkip("Implementation contains a bug")
        XCTAssertEqual(Day07.sample.part2, 126)
    }

    func testPart2() throws {
        throw XCTSkip("Not finished")
        XCTAssertEqual(Day07.input.part2, -1)
    }
}
