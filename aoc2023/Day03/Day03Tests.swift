//
//  Day03Tests.swift
//  aoc2023
//
//  Created by Andrew McKnight on Dec 2, 2023.
//

import aoc2023
import XCTest

class Day03Tests: XCTestCase {
    func testPart1Sample() throws {
        XCTAssertEqual(Day03.sample.part1, 4361)
    }

    func testPart1() throws {
        XCTAssertEqual(Day03.input.part1, 539637)
    }

    func testPart2Sample() throws {
        XCTAssertEqual(Day03.sample.part2, 46783)
    }

    func testPart2() throws {
        XCTAssertEqual(Day03.input.part2, 82818007)
    }
}
