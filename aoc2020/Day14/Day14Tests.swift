//
//  Day14Problem.swift
//  aoc2020
//
//  Created by Andrew McKnight on Dec 18, 2020.
//

import aoc2020
import XCTest

class aoc2020Day14Tests: XCTestCase {
    func testPart1Sample() {
        XCTAssertEqual(day14Part1(day14SampleInput), 165)
    }

    func testPart1() {
        XCTAssertEqual(day14Part1(day14Input), 9879607673316)
    }

    func testPart2Sample() {
        XCTAssertEqual(day14Part2(day14SampleInputPart2), 208)
    }

    func testPart2() {
        XCTAssertEqual(day14Part2(day14Input), 3435342392262)
    }

    func testPart2Benchmarked() {
        measure {
            XCTAssertEqual(day14Part2(day14Input), 3435342392262)
        }
    }
}
