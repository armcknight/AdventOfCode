//
//  Day03Problem.swift
//  aoc2021
//
//  Created by Andrew McKnight on Nov 30, 2021.
//

import aoc2021
import XCTest

class Day03Tests: XCTestCase {
    func testPart1Sample() {
        XCTAssertEqual(day03Part1(day03SampleInput), 198)
    }

    func testPart1() {
        XCTAssertEqual(day03Part1(day03Input), 3633500)
    }

    func testPart2Sample() {
        XCTAssertEqual(day03Part2(day03SampleInput), 230)
    }

    func testPart2() {
        XCTAssertEqual(day03Part2(day03Input), 4550283)
    }

    func testPart2Benchmarked() {
        measure {
            XCTAssertEqual(day03Part2(day03Input), 4550283)
        }
    }
}
