//
//  Day14Tests.swift
//  aoc2021
//
//  Created by Andrew McKnight on Dec 5, 2021.
//

import aoc2021
import XCTest

class Day14Tests: XCTestCase {
    func testPart1Sample() {
        XCTAssertEqual(Day14.sample.part1, 1588)
    }

    func testPart1() {
        XCTAssertEqual(Day14.input.part1, 2967)
    }

    func testPart2Sample() {
        XCTAssertEqual(Day14.sample.part2, 2188189693529)
    }

    func testPart2() throws {
        throw XCTSkip("Not finished")
        XCTAssertEqual(Day14.input.part2, -1)
    }

    func testPart2Benchmarked() throws {
        throw XCTSkip("Not finished")
        measure {
            XCTAssertEqual(Day14.input.part2, -1)
        }
    }
}
