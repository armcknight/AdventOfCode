//
//  Day01Problem.swift
//  aoc2021
//
//  Created by Andrew McKnight on Nov 30, 2021.
//

import aoc2021
import XCTest

class Day01Tests: XCTestCase {
    func testPart1Sample() {
        XCTAssertEqual(Day01.sample.part1, 7)
    }

    func testPart1() {
        XCTAssertEqual(Day01.input.part1, 1832)
    }

    func testPart2Sample() {
        XCTAssertEqual(Day01.sample.part2, 5)
    }

    func testPart2() {
        XCTAssertEqual(Day01.input.part2, 1858)
    }
}
