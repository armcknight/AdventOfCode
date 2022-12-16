//
//  Day10Problem.swift
//  aoc2020
//
//  Created by Andrew McKnight on Dec 18, 2020.
//

import aoc2020
import XCTest

class Day10Tests: XCTestCase {
    func testPart1LargeSample() {
        XCTAssertEqual(Day10.largeSample.part1, 35)
    }

    func testPart1() {
        XCTAssertEqual(Day10.input.part1, 2482)
    }

    func testPart2SmallSample() {
        XCTAssertEqual(Day10.smallSample.part2, 2)
    }

    func testPart2LargeSample() {
        XCTAssertEqual(Day10.largeSample.part2, 8)
    }

    func testPart2() throws {
        throw XCTSkip("Does not finish correctly and/or in practical time; need an optimal solution")
        XCTAssertGreaterThan(Day10.input.part2, 520605)
        XCTAssertEqual(Day10.input.part2, 0)
    }
}
