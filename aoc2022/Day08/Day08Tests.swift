//
//  Day08Tests.swift
//  aoc2022
//
//  Created by Andrew McKnight on Dec 4, 2022.
//

import aoc2022
import XCTest

class Day08Tests: XCTestCase {
    func testPart1Sample() throws {
        XCTAssertEqual(Day08.sample.part1, 21)
    }

    func testPart1() throws {
        XCTAssertEqual(Day08.input.part1, 1807)
    }

    func testPart2Sample() throws {
        XCTAssertEqual(Day08.sample.part2, 8)
    }

    func testPart2() throws {
        let result = Day08.input.part2
        XCTAssertNotEqual(result, 2160)
        XCTAssertEqual(result, 480000)
    }
}
