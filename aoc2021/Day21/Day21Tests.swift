//
//  Day21Tests.swift
//  aoc2021
//
//  Created by Andrew McKnight on Dec 5, 2021.
//

import aoc2021
import XCTest

class Day21Tests: XCTestCase {
    func testPart1Sample() {
        XCTAssertEqual(Day21.sample.part1, 739785)
    }

    func testPart1() {
        XCTAssertEqual(Day21.input.part1, 598416)
    }

    func testPart1Benchmarked() {
        measure {
            let _ = Day21.input.part1
        }
    }

    func testPart2Sample() throws {
        throw XCTSkip("Not finished")
        XCTAssertEqual(Day21.sample.part2, 444356092776315)
    }

    func testPart2() throws {
        throw XCTSkip("Not finished")
        XCTAssertEqual(Day21.input.part2, -1)
    }

    func testPart2Benchmarked() throws {
        throw XCTSkip("Not finished")
        measure {
            XCTAssertEqual(Day21.input.part2, -1)
        }
    }
}
