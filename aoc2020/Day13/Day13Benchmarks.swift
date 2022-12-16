//
//  Day13Benchmarks.swift
//  aoc2020
//
//  Created by Andrew McKnight on Dec 13, 2022.
//

import aoc2020
import XCTest

class Day13Benchmarks: XCTestCase {
    func testPart1Benchmarked() throws {
        measure {
            let _ = Day13.input.part1
        }
    }

    func testPart2Benchmarked() throws {
        throw XCTSkip("Not implemented")
        measure {
            let _ = Day13.input.part2
        }
    }
}
