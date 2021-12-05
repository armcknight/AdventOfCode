//
//  Day08Problem.swift
//  aoc2020
//
//  Created by Andrew McKnight on Dec 18, 2020.
//

import aoc2020
import XCTest

class Day08Tests: XCTestCase {
    func testPart1Sample() {
        XCTAssertEqual(day08Part1(day08SampleInput), 5)
    }

    func testPart1() {
        XCTAssertEqual(day08Part1(day08Input), 1087)
    }

    func testPart2Sample() {
        XCTAssertEqual(day08Part2(day08SampleInput)!, 8)
    }

    func testPart2() {
        XCTAssertEqual(day08Part2(day08Input)!, 780)
    }

    func testPart2Benchmarked() {
        measure {
            XCTAssertEqual(day08Part2(day08Input)!, 780)
        }
    }
}
