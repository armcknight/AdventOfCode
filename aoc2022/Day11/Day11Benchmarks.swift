//
//  Day11Benchmarks.swift
//  aoc2022
//
//  Created by Andrew McKnight on Dec 13, 2022.
//

import aoc2022
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
