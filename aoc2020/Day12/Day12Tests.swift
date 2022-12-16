//
//  Day12Problem.swift
//  aoc2020
//
//  Created by Andrew McKnight on Dec 18, 2020.
//

import aoc2020
import XCTest

class Day12Tests: XCTestCase {
    func testPart1Sample() {
        XCTAssertEqual(Day12.sample.part1, 25)
    }

    func testPart1() {
        XCTAssertEqual(Day12.input.part1, 879)
    }

    func testPart2Sample() {
        XCTAssertEqual(Day12.sample.part2, 286)
    }

    func testPart2() {
        XCTAssertEqual(Day12.input.part2, 18107)
    }
}
