//
//  Day02Problem.swift
//  aoc2020
//
//  Created by Andrew McKnight on Dec 18, 2020.
//

import aoc2020
import XCTest

class Day02Tests: XCTestCase {
    func testPart1Sample() {
        XCTAssertEqual(day02Part1(day02SampleInput), 2)
    }

    func testPart1() {
        XCTAssertEqual(day02Part1(day02Input), 586)
    }

    func testPart2Sample() {
        XCTAssertEqual(day02Part2(day02SampleInput), 1)
    }

    func testPart2() {
        XCTAssertEqual(day02Part2(day02Input), 352)
    }

    func testPart2Benchmarked() {
        measure {
            XCTAssertEqual(day02Part2(day02Input), 352)
        }
    }
}
