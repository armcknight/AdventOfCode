//
//  Day10Problem.swift
//  aoc2020
//
//  Created by Andrew McKnight on Dec 18, 2020.
//

import aoc2020
import XCTest

class aoc2020Day10Tests: XCTestCase {
    func testPart1() {
        XCTAssertEqual(day10Part1(input: day10TestInput), 35)
        XCTAssertEqual(day10Part1(input: day10Input), 0)
    }

    func testPart2Small() {
        XCTAssertEqual(day10Part2(input: day10SmallTestInput), 2)
    }

    func testPart2Medium() {
        XCTAssertEqual(day10Part2(input: day10TestInput), 8)
    }

    func testPart2() {
//        XCTAssertGreaterThan(day10Part2(input: day10Input), 520605)
        XCTAssertEqual(day10Part2(input: day10Input), 0)
    }
}
