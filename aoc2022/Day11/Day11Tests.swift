//
//  Day11Tests.swift
//  aoc2022
//
//  Created by Andrew McKnight on Dec 4, 2022.
//

import aoc2022
import XCTest

class Day11Tests: XCTestCase {
    func testPart1Sample() throws {
        XCTAssertEqual(Day11.sample.part1, 10605)
    }

    func testPart1() throws {
        XCTAssertEqual(Day11.input.part1, 55216)
    }

    func testPart2Sample() throws {
        XCTAssertEqual(Day11.sample.part2, 2713310158)
    }

    func testPart2() throws {
        XCTAssertEqual(Day11.input.part2, 12848882750)
    }
}
