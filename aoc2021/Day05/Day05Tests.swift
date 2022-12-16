//
//  Day05Problem.swift
//  aoc2021
//
//  Created by Andrew McKnight on Nov 30, 2021.
//

import aoc2021
import XCTest

class Day05Tests: XCTestCase {
    func testPart1Sample() {
        XCTAssertEqual(Day05.sample.part1, 5)
    }

    func testPart1() {
        XCTAssertEqual(Day05.input.part1, 6572)
    }

    func testPart2Sample() {
        XCTAssertEqual(Day05.sample.part2, 12)
    }

    func testPart2() {
        XCTAssertEqual(Day05.input.part2, 21466)
    }
}
