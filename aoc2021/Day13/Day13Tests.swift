//
//  Day13Tests.swift
//  aoc2021
//
//  Created by Andrew McKnight on Dec 5, 2021.
//

import aoc2021
import XCTest

class Day13Tests: XCTestCase {
    func testPart1Sample() {
        XCTAssertEqual(Day13.sample.part1, -1)
    }

    func testPart1() {
        XCTAssertEqual(Day13.input.part1, -1)
    }

    func testPart2Sample() {
        XCTAssertEqual(Day13.sample.part2, -1)
    }

    func testPart2() {
        XCTAssertEqual(Day13.input.part2, -1)
    }

    func testPart2Benchmarked() {
        measure {
            XCTAssertEqual(Day13.input.part2, -1)
        }
    }
}
