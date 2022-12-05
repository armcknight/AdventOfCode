//
//  Day01Tests.swift
//  aoc2022
//
//  Created by Andrew McKnight on Dec 4, 2022.
//

import aoc2022
import XCTest

class Day01Tests: XCTestCase {
    func testPart1Sample() throws {
        XCTAssertEqual(Day01.sample.part1, 24000)
    }

    func testPart1() throws {
        XCTAssertEqual(Day01.input.part1, -1)
    }

    func testPart1Benchmarked() throws {
        measure {
            let _ = Day01.input.part1
        }
    }

    func testPart2Sample() throws {
        XCTAssertEqual(Day01.sample.part2, 45000)
    }

    func testPart2() throws {
        XCTAssertEqual(Day01.input.part2, -1)
    }

    func testPart2Benchmarked() throws {
        throw XCTSkip("Not implemented")
        measure {
            let _ = Day01.input.part2
        }
    }
}
