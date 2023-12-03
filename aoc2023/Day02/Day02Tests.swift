//
//  Day02Tests.swift
//  aoc2023
//
//  Created by Andrew McKnight on Dec 2, 2023.
//

import aoc2023
import XCTest

class Day02Tests: XCTestCase {
    func testPart1Sample() throws {
        XCTAssertEqual(Day02.sample.part1, 8)
    }

    func testPart1() throws {
        XCTAssertEqual(Day02.input.part1, 2076)
    }

    func testPart2Sample() throws {
        XCTAssertEqual(Day02.sample.part2, 2286)
    }

    func testPart2() throws {
        XCTAssertEqual(Day02.input.part2, 70950)
    }
}
