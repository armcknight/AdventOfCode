//
//  Day17Tests.swift
//  aoc2021
//
//  Created by Andrew McKnight on Dec 5, 2021.
//

import aoc2021
import XCTest

class Day17Tests: XCTestCase {
    func testPart1Sample() {
        XCTAssertEqual(Day17.sample.part1, 45)
    }

    func testPart1() {
        XCTAssertEqual(Day17.input.part1, 5151)
    }

    func testPart2Sample() {
        XCTAssertEqual(Day17.sample.part2, 112)
    }

    func testPart2() {
        XCTAssertEqual(Day17.input.part2, 968)
    }

    func testPart2Benchmarked() {
        measure {
            XCTAssertEqual(Day17.input.part2, 968)
        }
    }
}
