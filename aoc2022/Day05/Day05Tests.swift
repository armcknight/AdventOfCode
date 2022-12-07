//
//  Day05Tests.swift
//  aoc2022
//
//  Created by Andrew McKnight on Dec 4, 2022.
//

import aoc2022
import XCTest

class Day05Tests: XCTestCase {
    func testPart1Sample() throws {
        XCTAssertEqual(Day05.part1(input: Day05.sample), "CMZ")
    }

    func testPart1() throws {
        XCTAssertEqual(Day05.part1(input: Day05.input), "CFFHVVHNC")
    }

    func testPart1Benchmarked() throws {
        measure {
            let _ = Day05.part1(input: Day05.input)
        }
    }

    func testPart2Sample() throws {
        XCTAssertEqual(Day05.part2(input: Day05.sample), "MCD")
    }

    func testPart2() throws {
        XCTAssertEqual(Day05.part2(input: Day05.input), "FSZWBPTBG")
    }

    func testPart2Benchmarked() throws {
        measure {
            let _ = Day05.part2(input: Day05.input)
        }
    }
}
