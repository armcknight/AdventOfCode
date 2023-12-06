//
//  Day05Benchmarks.swift
//  aoc2023
//
//  Created by Andrew McKnight on Dec 4, 2023.
//

import aoc2023
import XCTest

class Day05Benchmarks: XCTestCase {
    func testPart1Benchmarked() throws {
        measure {
            let _ = Day05.input.part1Efficient
        }
    }

    func testPart2Benchmarked() throws {
//        measure {
            let result = Day05.input.part2
            print("result = \(result)")
//        }
    }
}
