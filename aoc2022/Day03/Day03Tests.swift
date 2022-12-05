//
//  Day03Tests.swift
//  aoc2022
//
//  Created by Andrew McKnight on Dec 4, 2022.
//

import aoc2022
import XCTest

class Day03Tests: XCTestCase {
    func testAsciiCodes() {
        print(priorities)
    }
    func testPart1Sample() throws {
        XCTAssertEqual(Day03.sample.part1, 157)
    }

    func testPart1() throws {
        XCTAssertEqual(Day03.input.part1, 7967)
    }

    func testPart1Benchmarked() throws {
        measure {
            let _ = Day03.input.part1
        }
    }

    func testPart2Sample() throws {
        XCTAssertEqual(Day03.sample.part2, 70)
    }

    func testPart2() throws {
        XCTAssertEqual(Day03.input.part2, 2716)
    }

    func testPart2Benchmarked() throws {
        measure {
            let _ = Day03.input.part2
        }
    }
}
