//
//  Day05Problem.swift
//  aoc2020
//
//  Created by Andrew McKnight on Dec 18, 2020.
//

import aoc2020
import XCTest

class Day05Tests: XCTestCase {
    func testPart1Sample() {
        XCTAssertEqual(Day05.sample.part1, 820)
    }

    func testPart1() {
        XCTAssertEqual(Day05.input.part1, 894)
    }

    func testPart2() {
        XCTAssertEqual(Day05.input.part2, 579)
    }
}
