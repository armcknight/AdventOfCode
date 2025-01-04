//
//  Day18Tests.swift
//  aoc2023
//
//  Created by Andrew McKnight on Dec 20, 2023.
//

import aoc2023
import XCTest

class Day18Tests: XCTestCase {
    func testPart1Sample() throws {
        XCTAssertEqual(Day18.sample.part1, 62)
    }

    func testPart1() throws {
        let result = Day18.input.part1
        XCTAssertNotEqual(result, 71984)
        XCTAssertEqual(result, 0)
    }

    func testPart2Sample() throws {
        throw XCTSkip("Not implemented")
        XCTAssertEqual(Day18.sample.part2, 0)
    }

    func testPart2() throws {
        throw XCTSkip("Not implemented")
        XCTAssertEqual(Day18.input.part2, 0)
    }
}
