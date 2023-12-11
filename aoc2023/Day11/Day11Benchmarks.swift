//
//  Day11Benchmarks.swift
//  aoc2023
//
//  Created by Andrew McKnight on Dec 11, 2023.
//

import aoc2023
import XCTest

class Day11Benchmarks: XCTestCase {
    func testPart1Benchmarked() throws {
        measure {
            let _ = Day11.input.part1
        }
    }

    func testPart2Benchmarked() throws {
        measure {
            let _ = Day11.input.part2
        }
    }
}
