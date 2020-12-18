//
//  Day1Problem.swift
//  aoc2020
//
//  Created by Andrew McKnight on Dec 18, 2020.
//

import aoc2020
import XCTest

class aoc2020Day1Tests: XCTestCase {
    func testPart1Sample() {
        XCTAssertEqual(day1Part1(day1SampleInput), 514579)
    }

    func testPart1() {
        XCTAssertEqual(day1Part1(day1Input)!, 802011)
    }

    func testPart2Sample() {
        XCTAssertEqual(day1Part2(day1SampleInput)!, 241861950)
    }

    func testPart2() {
        XCTAssertEqual(day1Part2(day1Input)!, 248607374)
    }
}
