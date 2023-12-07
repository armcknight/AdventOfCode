//
//  Day07Tests.swift
//  aoc2023
//
//  Created by Andrew McKnight on Dec 6, 2023.
//

import aoc2023
import XCTest

class Day07Tests: XCTestCase {
    func testPart1Sample() throws {
        XCTAssertEqual(Day07.sample.part1, 6440)
    }

    func testPart1() throws {
        XCTAssertEqual(Day07.input.part1, 246912307)
    }

    func testPart2Sample() throws {
        XCTAssertEqual(Day07.sample.part2, 5905)
    }

    func testPart2() throws {
        XCTAssertEqual(Day07.input.part2, 246894760)
    }
}
