//
//  Day01Tests.swift
//  aoc2023
//
//  Created by Andrew McKnight on Dec 2, 2023.
//

import aoc2023
import XCTest

class Day01Tests: XCTestCase {
    func testPart1Sample() throws {
        XCTAssertEqual(Day01.sample.part1, 142)
    }

    func testPart1() throws {
        XCTAssertEqual(Day01.input.part1, 55607)
    }

    func testPart2Sample() throws {
        XCTAssertEqual(Day01.sample2.part2, 281)
    }

    func testPart2() throws {
        XCTAssertEqual(Day01.input.part2, 0)
    }
}
