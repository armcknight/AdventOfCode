//
//  Day11Tests.swift
//  aoc2023
//
//  Created by Andrew McKnight on Dec 11, 2023.
//

import aoc2023
import XCTest

class Day11Tests: XCTestCase {
    func testPart1Sample() throws {
        XCTAssertEqual(Day11.sample.part1, 374)
    }

    func testPart1() throws {
        XCTAssertEqual(Day11.input.part1, 9623138)
    }

    func testPart2Sample() throws {
        XCTAssertEqual(Day11.sample.part2, 0)
    }

    func testPart2() throws {
        let result = Day11.input.part2
        XCTAssertNotEqual(result, 726820896326)
        XCTAssertEqual(result, 0)
    }
}
