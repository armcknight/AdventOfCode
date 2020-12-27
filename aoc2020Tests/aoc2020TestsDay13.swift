//
//  Day13Problem.swift
//  aoc2020
//
//  Created by Andrew McKnight on Dec 18, 2020.
//

import aoc2020
import XCTest

class aoc2020Day13Tests: XCTestCase {
    func testPart1Sample() {
        XCTAssertEqual(day13Part1(day13SampleInput), 295)
    }

    func testPart1() {
        XCTAssertEqual(day13Part1(day13Input), -1)
    }

    func testPart2Sample() {
        XCTAssertEqual(day13Part2(day13SampleInput), -1)
    }

    func testPart2() {
        XCTAssertEqual(day13Part2(day13Input), -1)
    }
}
