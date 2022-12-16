//
//  Day21Benchmarks.swift
//  aoc2021
//
//  Created by Andrew McKnight on Dec 13, 2022.
//

import aoc2021
import XCTest

class Day21Benchmarks: XCTestCase {
    func testPart1Benchmarked() throws {
        measure {
            let _ = Day21.input.part1
        }
    }

    func testPart2Benchmarked() throws {
        throw XCTSkip("Not implemented")
        measure {
            let _ = Day21.input.part2
        }
    }
}
