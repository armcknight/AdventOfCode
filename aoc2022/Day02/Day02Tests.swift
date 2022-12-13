//
//  Day02Tests.swift
//  aoc2022
//
//  Created by Andrew McKnight on Dec 4, 2022.
//

import aoc2022
import XCTest

class Day02Tests: XCTestCase {
    func testPart1Sample() throws {
        XCTAssertEqual(Day02.sample.part1, 15)
    }

    func testPart1() throws {
        XCTAssertEqual(Day02.input.part1, 14069)
    }

    func testPart2Sample() throws {
        XCTAssertEqual(Day02.sample.part2, 12)
    }

    func testPart2() throws {
        XCTAssertEqual(Day02.input.part2, 12411)
    }
}
