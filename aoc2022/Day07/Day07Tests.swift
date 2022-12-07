//
//  Day07Tests.swift
//  aoc2022
//
//  Created by Andrew McKnight on Dec 4, 2022.
//

import aoc2022
import XCTest

class Day07Tests: XCTestCase {
    func testPart1Sample() throws {
        XCTAssertEqual(Day07.sample.part1, 95437)
    }

    func testPart1() throws {
        let result = Day07.input.part1
        XCTAssertNotEqual(result, 4195169)
        XCTAssertNotEqual(result, 848420)
        XCTAssertEqual(result, 1513699)
    }

    func testPart1Benchmarked() throws {
        measure {
            let _ = Day07.input.part1
        }
    }

    func testPart2Sample() throws {
        XCTAssertEqual(Day07.sample.part2, 24933642)
    }

    func testPart2() throws {
        let result = Day07.input.part2
        XCTAssertNotEqual(result, 27924493)
        XCTAssertNotEqual(result, 10176)
        XCTAssertEqual(result, 7991939)
    }

    func testPart2Benchmarked() throws {
        measure {
            let _ = Day07.input.part2
        }
    }
}
