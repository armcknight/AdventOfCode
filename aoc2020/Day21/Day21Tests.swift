//
//  Day21Problem.swift
//  aoc2020
//
//  Created by Andrew McKnight on Dec 18, 2020.
//

import aoc2020
import XCTest

class Day21Tests: XCTestCase {
    func testPart1Sample() {
        XCTAssertEqual(day21Part1(day21SampleInput), -1)
    }

    func testPart1() {
        XCTAssertEqual(day21Part1(day21Input), -1)
    }

    func testPart2Sample() {
        XCTAssertEqual(day21Part2(day21SampleInput), -1)
    }

    func testPart2() {
        XCTAssertEqual(day21Part2(day21Input), -1)
    }

    func testPart2Benchmarked() {
        measure {
            XCTAssertEqual(day21Part2(day21Input), -1)
        }
    }
}
