//
//  Day16Problem.swift
//  aoc2020
//
//  Created by Andrew McKnight on Dec 18, 2020.
//

import aoc2020
import XCTest

class Day16Tests: XCTestCase {
    func testPart1Sample() {
        XCTAssertEqual(day16Part1(day16SampleInput), 71)
    }

    func testPart1() {
        XCTAssertEqual(day16Part1(day16Input), 29759)
    }

    func testPart2Sample() {
        XCTAssertEqual(day16Part2(day16SampleInput), -1)
    }

    func testPart2() {
        XCTAssertEqual(day16Part2(day16Input), -1)
    }

    func testPart2Benchmarked() {
        measure {
            XCTAssertEqual(day16Part2(day16Input), -1)
        }
    }
}
