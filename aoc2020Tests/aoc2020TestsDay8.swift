//
//  Day8Problem.swift
//  aoc2020
//
//  Created by Andrew McKnight on Dec 18, 2020.
//

import aoc2020
import XCTest

class aoc2020Day8Tests: XCTestCase {
    func testPart1Sample() {
        XCTAssertEqual(day8Part1(day8SampleInput), 5)
    }

    func testPart1() {
        XCTAssertEqual(day8Part1(day8Input), 1087)
    }

    func testPart2Sample() {
        XCTAssertEqual(day8Part2(day8SampleInput)!, 8)
    }

    func testPart2() {
        XCTAssertEqual(day8Part2(day8Input)!, 780)
    }
}
