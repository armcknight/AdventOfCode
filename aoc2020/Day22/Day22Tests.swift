//
//  Day22Problem.swift
//  aoc2020
//
//  Created by Andrew McKnight on Dec 18, 2020.
//

import aoc2020
import XCTest

class Day22Tests: XCTestCase {
    func testPart1Sample() {
        XCTAssertEqual(day22Part1(day22SampleInput), -1)
    }

    func testPart1() {
        XCTAssertEqual(day22Part1(day22Input), -1)
    }

    func testPart2Sample() {
        XCTAssertEqual(day22Part2(day22SampleInput), -1)
    }

    func testPart2() {
        XCTAssertEqual(day22Part2(day22Input), -1)
    }

    func testPart2Benchmarked() {
        measure {
            XCTAssertEqual(day22Part2(day22Input), -1)
        }
    }
}
