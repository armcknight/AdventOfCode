//
//  Day02Problem.swift
//  aoc2021
//
//  Created by Andrew McKnight on Nov 30, 2021.
//

import aoc2021
import XCTest

class Day02Tests: XCTestCase {
    func testPart1Sample() {
        XCTAssertEqual(day02Part1(day02SampleInput), 150)
    }

    func testPart1() {
        XCTAssertEqual(day02Part1(day02Input), 1499229)
    }

    func testPart2Sample() {
        XCTAssertEqual(day02Part2(day02SampleInput), 900)
    }

    func testPart2() {
        XCTAssertEqual(day02Part2(day02Input), 1340836560)
    }

    func testPart2Benchmarked() {
        measure {
            XCTAssertEqual(day02Part2(day02Input), 1340836560)
        }
    }
}
