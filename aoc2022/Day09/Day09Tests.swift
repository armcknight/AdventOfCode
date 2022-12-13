//
//  Day09Tests.swift
//  aoc2022
//
//  Created by Andrew McKnight on Dec 4, 2022.
//

import aoc2022
import XCTest

class Day09Tests: XCTestCase {
    func testPart1Sample() throws {
        XCTAssertEqual(Day09.sample.part1, 13)
    }

    func testPart1() throws {
        XCTAssertEqual(Day09.input.part1, 6023)
    }

    func testPart2Sample() throws {
        XCTAssertEqual(Day09.sample.part2, 1)
    }

    func testPart2Sample2() throws {
        XCTAssertEqual(Day09.sample2.part2, 36)
    }

    func testPart2() throws {
        let result = Day09.input.part2
        XCTAssertNotEqual(result, 72)
        XCTAssertEqual(result, -1)
    }
}
