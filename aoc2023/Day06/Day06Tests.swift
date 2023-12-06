//
//  Day06Tests.swift
//  aoc2023
//
//  Created by Andrew McKnight on Dec 5, 2023.
//

import aoc2023
import XCTest

class Day06Tests: XCTestCase {
    func testPart1Sample() throws {
        XCTAssertEqual(Day06.sample.part1, 288)
    }

    func testPart1() throws {
        XCTAssertEqual(Day06.input.part1, 281600)
    }

    func testPart2Sample() throws {
        XCTAssertEqual(Day06.sample.part2, 71503)
    }

    func testPart2() throws {
        XCTAssertEqual(Day06.input.part2, 33875953)
    }
}
