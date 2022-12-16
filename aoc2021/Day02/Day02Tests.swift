//
//  Day02Problem.swift
//  aoc2021
//
//  Created by Andrew McKnight on Nov 30, 2021.
//

import aoc2021
import XCTest

class Day02Tests: XCTestCase {
    func testPart1Sample() {
        XCTAssertEqual(Day02.sample.part1, 150)
    }

    func testPart1() {
        XCTAssertEqual(Day02.input.part1, 1499229)
    }

    func testPart2Sample() {
        XCTAssertEqual(Day02.sample.part2, 900)
    }

    func testPart2() {
        XCTAssertEqual(Day02.input.part2, 1340836560)
    }
}
