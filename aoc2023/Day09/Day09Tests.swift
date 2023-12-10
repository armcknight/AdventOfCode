//
//  Day09Tests.swift
//  aoc2023
//
//  Created by Andrew McKnight on Dec 10, 2023.
//

import aoc2023
import XCTest

class Day09Tests: XCTestCase {
    func testPart1Sample() throws {
        XCTAssertEqual(Day09.sample.part1, 114)
    }

    func testPart1() throws {
        XCTAssertEqual(Day09.input.part1, 1877825184)
    }

    func testPart2Sample() throws {
        throw XCTSkip("Not implemented")
        XCTAssertEqual(Day09.sample.part2, 0)
    }

    func testPart2() throws {
        throw XCTSkip("Not implemented")
        XCTAssertEqual(Day09.input.part2, 0)
    }
}
