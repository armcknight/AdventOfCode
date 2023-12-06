//
//  Day06Benchmarks.swift
//  aoc2023
//
//  Created by Andrew McKnight on Dec 5, 2023.
//

import aoc2023
import XCTest

class Day06Benchmarks: XCTestCase {
    func testPart1Benchmarked() throws {
        measure {
            let _ = Day06.input.part1
        }
    }

    func testPart2Benchmarked() throws {
        measure {
            let _ = Day06.input.part2
        }
    }
}
