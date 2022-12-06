//
//  Day04Tests.swift
//  aoc2022
//
//  Created by Andrew McKnight on Dec 4, 2022.
//

import aoc2022
import XCTest

class Day04Tests: XCTestCase {
    func testPart1Sample() throws {
        XCTAssertEqual(Day04.sample.part1, 2)
    }

    func testPart1() throws {
        XCTAssertEqual(Day04.input.part1, 605)
    }

    func testPart1Benchmarked() throws {
        measure {
            let _ = Day04.input.part1
        }
    }

    func testPart2Sample() throws {
        XCTAssertEqual(Day04.sample.part2, 4)
    }

    func testPart2() throws {
        XCTAssertEqual(Day04.input.part2, 914)
    }

    func testPart2Benchmarked() throws {
        measure {
            let _ = Day04.input.part2
        }
    }
}
