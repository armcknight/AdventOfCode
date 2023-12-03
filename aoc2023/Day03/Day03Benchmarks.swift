//
//  Day03Benchmarks.swift
//  aoc2023
//
//  Created by Andrew McKnight on Dec 2, 2023.
//

import aoc2023
import XCTest

class Day03Benchmarks: XCTestCase {
    func testPart1Benchmarked() throws {
        measure {
            let _ = Day03.input.part1
        }
    }

    func testPart2Benchmarked() throws {
        measure {
            let _ = Day03.input.part2
        }
    }
}
