//
//  Day05Tests.swift
//  aoc2022
//
//  Created by Andrew McKnight on Dec 4, 2022.
//

import aoc2022
import XCTest

class Day05Tests: XCTestCase {
    func testPart1Sample() throws {
        XCTAssertEqual(Day05.sample.part1, "CMZ")
    }

    func testPart1() throws {
        XCTAssertEqual(Day05.input.part1, "CFFHVVHNC")
    }

    func testPart2Sample() throws {
        XCTAssertEqual(Day05.sample.part2, "MCD")
    }

    func testPart2() throws {
        XCTAssertEqual(Day05.input.part2, "FSZWBPTBG")
    }
}
