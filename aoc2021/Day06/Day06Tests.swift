//
//  Day06Tests.swift
//  aoc2021
//
//  Created by Andrew McKnight on Dec 5, 2021.
//

import aoc2021
import XCTest

class Day06Tests: XCTestCase {
    func testPart1Sample() {
        XCTAssertEqual(Day06.sample.part1, 5934)
    }

    func testPart1() {
        XCTAssertEqual(Day06.input.part1, 374927)
    }

    func testPart1Benchmark() {
        measure {
            let _ = Day06.input.part1
        }
    }

    func testPart2Sample() {
        XCTAssertEqual(Day06.sample.part2, 26984457539)
    }

    func testPart2() {
        XCTAssertEqual(Day06.input.part2, 1687617803407)
    }

    func testPart2Benchmarked() {
        measure {
            let _ = Day06.input.part2
        }
    }
}
