//
//  Day09Problem.swift
//  aoc2020
//
//  Created by Andrew McKnight on Dec 18, 2020.
//

import aoc2020
import XCTest

class Day09Tests: XCTestCase {
    func testPart1Sample() {
        XCTAssertEqual(day09Part1(Day09.sample.rawValue, codeAge: 5), 127)
    }

    func testPart1() {
        XCTAssertEqual(day09Part1(Day09.input.rawValue, codeAge: 25), 1721308972)
    }

    func testPart2Sample() {
        XCTAssertEqual(day09Part2(Day09.sample.rawValue, codeAge: 5), 62)
    }

    func testPart2() {
        XCTAssertEqual(day09Part2(Day09.input.rawValue, codeAge: 25), 209694133)
    }
}
