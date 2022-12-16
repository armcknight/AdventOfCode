//
//  Day14Benchmarks.swift
//  aoc2020
//
//  Created by Andrew McKnight on Dec 13, 2022.
//

import aoc2020
import XCTest

class Day14Benchmarks: XCTestCase {
    func testPart1Benchmarked() throws {
        measure {
            let _ = Day14.input.part1
        }
    }

    func testPart2Benchmarked() throws {
        measure {
            let _ = Day14.input.part2
        }
    }
}
