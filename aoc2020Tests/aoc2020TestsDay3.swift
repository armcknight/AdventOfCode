//
//  Day3Problem.swift
//  aoc2020
//
//  Created by Andrew McKnight on Dec 18, 2020.
//

import aoc2020
import XCTest

class aoc2020Day3Tests: XCTestCase {
    func testPart1Sample() {
        XCTAssertEqual(day3Part1(day3SampleInput), 7)
    }

    func testPart1() {
        XCTAssertEqual(day3Part1(day3Input), 252)
    }

    func testPart2Sample() {
        XCTAssertEqual(day3Part2(day3SampleInput), 336)
    }

    func testPart2() {
        XCTAssertEqual(day3Part2(day3Input), 2608962048)
    }
}
