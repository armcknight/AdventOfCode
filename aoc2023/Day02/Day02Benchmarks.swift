//
//  Day02Benchmarks.swift
//  aoc2023
//
//  Created by Andrew McKnight on Dec 2, 2023.
//

import aoc2023
import XCTest

class Day02Benchmarks: XCTestCase {
    func testPart1Benchmarked() throws {
        measure {
            let _ = Day02.input.part1
        }
    }

    func testPart2Benchmarked() throws {
        measure {
            let _ = Day02.input.part2
        }
    }
}
