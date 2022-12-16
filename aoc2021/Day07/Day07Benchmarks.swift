//
//  Day07Benchmarks.swift
//  aoc2021
//
//  Created by Andrew McKnight on Dec 13, 2022.
//

import aoc2021
import XCTest

class Day07Benchmarks: XCTestCase {
    func testPart1Benchmarked() throws {
        measure {
            let _ = Day07.input.part1
        }
    }

    func testPart2Benchmarked() throws {
        measure {
            let _ = Day07.input.part2
        }
    }
}
