//
//  Day4Problem.swift
//  aoc2020
//
//  Created by Andrew McKnight on Dec 18, 2020.
//

import aoc2020
import XCTest

class aoc2020Day4Tests: XCTestCase {
    func testPart1Sample() {
        XCTAssertEqual(day4Part1(day4SampleInput), 2)
    }

    func testPart1() {
        XCTAssertEqual(day4Part1(day4Input), 256)
    }

    func testPart2Sample() {
        XCTAssertEqual(day4Part2(day4SampleInput), 2)
    }

    func testPart2Invalid() {
        XCTAssertEqual(day4Part2(day4InvalidInput), 0)
    }

    func testPart2Valid() {
        XCTAssertEqual(day4Part2(day4ValidInput), 4)
    }

    func testPart2() {
        XCTAssertEqual(day4Part2(day4Input), 198)
    }
}
