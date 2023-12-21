//
//  Day14Tests.swift
//  aoc2023
//
//  Created by Andrew McKnight on Dec 16, 2023.
//

import aoc2023
import XCTest

class Day14Tests: XCTestCase {
    func testPart1Sample() throws {
        XCTAssertEqual(Day14.sample.part1, 136)
    }

    func testPart1() throws {
        XCTAssertEqual(Day14.input.part1, 108955)
    }

    func testPart2Sample() throws {
        throw XCTSkip("Not implemented")
        XCTAssertEqual(Day14.sample.part2, 0)
    }

    func testPart2() throws {
        throw XCTSkip("Not implemented")
        XCTAssertEqual(Day14.input.part2, 0)
    }
}
