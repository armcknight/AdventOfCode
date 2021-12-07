//
//  Day05Problem.swift
//  aoc2021
//
//  Created by Andrew McKnight on Nov 30, 2021.
//

import aoc2021
import XCTest

class Day05Tests: XCTestCase {
    func testPart1Sample() {
        XCTAssertEqual(day05Part1(day05SampleInput), 5)
    }

    func testPart1() {
        XCTAssertEqual(day05Part1(day05Input), 6572)
    }

    func testPart2Sample() {
        XCTAssertEqual(day05Part2(day05SampleInput), 12)
    }

    func testPart2() {
        XCTAssertEqual(day05Part2(day05Input), 21466)
    }

    func testPart2Benchmarked() {
        measure {
            XCTAssertEqual(day05Part2(day05Input), 21466)
        }
    }
}