//
//  Day10Tests.swift
//  aoc2022
//
//  Created by Andrew McKnight on Dec 4, 2022.
//

import aoc2022
import XCTest

class Day10Tests: XCTestCase {
    func testPart1Sample() throws {
        let _ = Day10.sample.part1
    }

    func testPart1Sample2() throws {
        XCTAssertEqual(Day10.sample2.part1, 13140)
    }

    func testPart1() throws {
        XCTAssertEqual(Day10.input.part1, 13820)
    }

    func testPart2Sample2() throws {
        let _ = Day10.sample2.part2
    }

    func testPart2() throws {
        let _ = Day10.input.part2
    }
}
