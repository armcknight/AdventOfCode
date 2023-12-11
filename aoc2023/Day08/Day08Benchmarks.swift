//
//  Day08Benchmarks.swift
//  aoc2023
//
//  Created by Andrew McKnight on Dec 10, 2023.
//

import aoc2023
import XCTest

class Day08Benchmarks: XCTestCase {
    func testPart1Benchmarked() throws {
        measure {
            let _ = Day08.input.part1
        }
    }

    func testPart2Benchmarked() throws {
        measure {
            let _ = Day08.input.part2
        }
    }
}
