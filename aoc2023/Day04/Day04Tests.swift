//
//  Day04Tests.swift
//  aoc2023
//
//  Created by Andrew McKnight on Dec 3, 2023.
//

import aoc2023
import XCTest

class Day04Tests: XCTestCase {
    func testPart1Sample() throws {
        XCTAssertEqual(Day04.sample.part1, 13)
    }

    func testPart1() throws {
        XCTAssertEqual(Day04.input.part1, 27059)
    }

    func testPart2Sample() throws {
        XCTAssertEqual(Day04.sample.part2, 30)
    }

    func testPart2() throws {
        XCTAssertEqual(Day04.input.part2, 5744979)
    }
}
