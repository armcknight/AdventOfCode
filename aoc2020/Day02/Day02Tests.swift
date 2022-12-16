//
//  Day02Problem.swift
//  aoc2020
//
//  Created by Andrew McKnight on Dec 18, 2020.
//

import aoc2020
import XCTest

class Day02Tests: XCTestCase {
    func testPart1Sample() {
        XCTAssertEqual(Day02.sample.part1, 2)
    }

    func testPart1() {
        XCTAssertEqual(Day02.input.part1, 586)
    }

    func testPart2Sample() {
        XCTAssertEqual(Day02.sample.part2, 1)
    }

    func testPart2() {
        XCTAssertEqual(Day02.input.part2, 352)
    }
}
