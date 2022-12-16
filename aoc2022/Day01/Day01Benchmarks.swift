//
//  Day01Benchmarks.swift
//  aoc2022
//
//  Created by Andrew McKnight on Dec 13, 2022.
//

import aoc2022
import XCTest

class Day01Benchmarks: XCTestCase {
    func testPart1Benchmarked() throws {
        measure {
            let _ = Day01.input.part1
        }
    }

    func testPart2Benchmarked() throws {
        measure {
            let _ = Day01.input.part2
        }
    }
}
