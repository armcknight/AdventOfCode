//
//  Day16Problem.swift
//  aoc2021
//
//  Created by Andrew McKnight on Nov 30, 2021.
//

import aoc2021
import XCTest

class aoc2021Day16Tests: XCTestCase {
    func testPart1Sample() {
        XCTAssertEqual(day16Part1(day16SampleInput), -1)
    }

    func testPart1() {
        XCTAssertEqual(day16Part1(day16Input), -1)
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
