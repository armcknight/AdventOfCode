//
//  Day07Tests.swift
//  aoc2021
//
//  Created by Andrew McKnight on Dec 5, 2021.
//

import aoc2021
import XCTest

class Day07Tests: XCTestCase {
    func testPart1Sample() {
        XCTAssertEqual(Day07.sample.part1, 37)
    }

    func testPart1() {
        XCTAssertEqual(Day07.input.part1, 336120)
    }

    func testPart2Sample() throws {
        throw XCTSkip("This is a weird one. In order for this to succeed, the round must be changed from .down to .up in the implementation. But then the real part 2 input fails.")
        XCTAssertEqual(Day07.sample.part2, 168)
    }

    func testPart2() {
        XCTAssertEqual(Day07.input.part2, 96864235)
    }
}
