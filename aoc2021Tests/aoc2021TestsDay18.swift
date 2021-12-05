//
//  Day18Problem.swift
//  aoc2021
//
//  Created by Andrew McKnight on Nov 30, 2021.
//

import aoc2021
import XCTest

class aoc2021Day18Tests: XCTestCase {
    func testPart1Sample() {
        XCTAssertEqual(day18Part1(day18SampleInput), -1)
    }

    func testPart1() {
        XCTAssertEqual(day18Part1(day18Input), -1)
    }

    func testPart2Sample() {
        XCTAssertEqual(day18Part2(day18SampleInput), -1)
    }

    func testPart2() {
        XCTAssertEqual(day18Part2(day18Input), -1)
    }

    func testPart2Benchmarked() {
        measure {
            XCTAssertEqual(day18Part2(day18Input), -1)
        }
    }
}
