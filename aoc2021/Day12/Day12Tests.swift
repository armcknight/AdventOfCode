//
//  Day12Tests.swift
//  aoc2021
//
//  Created by Andrew McKnight on Dec 5, 2021.
//

import aoc2021
import XCTest

class Day12Tests: XCTestCase {
    func testPart1Sample() {
        XCTAssertEqual(Day12.sample.part1, 10)
    }

    func testPart1() {
        XCTAssertEqual(Day12.input.part1, 19)
    }

    func testPart2Sample() {
        XCTAssertEqual(Day12.sample.part2, -1)
    }

    func testPart2() {
        XCTAssertEqual(Day12.input.part2, -1)
    }

    func testPart2Benchmarked() {
        measure {
            XCTAssertEqual(Day12.input.part2, -1)
        }
    }
}
