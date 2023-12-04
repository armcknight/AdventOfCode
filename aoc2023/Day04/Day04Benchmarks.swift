//
//  Day04Benchmarks.swift
//  aoc2023
//
//  Created by Andrew McKnight on Dec 3, 2023.
//

import aoc2023
import XCTest

class Day04Benchmarks: XCTestCase {
    func testPart1Benchmarked() throws {
        measure {
            let _ = Day04.input.part1
        }
    }

    func testPart2Benchmarked() throws {
        measure {
            let _ = Day04.input.part2
        }
    }
}
