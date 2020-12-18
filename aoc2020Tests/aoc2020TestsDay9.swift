//
//  Day9Problem.swift
//  aoc2020
//
//  Created by Andrew McKnight on Dec 18, 2020.
//

import aoc2020
import XCTest

class aoc2020Day9Tests: XCTestCase {
    func testPart1Sample() {
        XCTAssertEqual(day9Part1(day9SampleInput, codeAge: 5), 127)
    }

    func testPart1() {
        XCTAssertEqual(day9Part1(day9Input, codeAge: 25), 1721308972)
    }

    func testPart2Sample() {
        XCTAssertEqual(day9Part2(day9SampleInput, codeAge: 5), 62)
    }

    func testPart2() {
        XCTAssertEqual(day9Part2(day9Input, codeAge: 25), 209694133)
    }
}
