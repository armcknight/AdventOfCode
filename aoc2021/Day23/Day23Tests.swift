//
//  Day23Problem.swift
//  aoc2021
//
//  Created by Andrew McKnight on Nov 30, 2021.
//

import aoc2021
import XCTest

class aoc2021Day23Tests: XCTestCase {
    func testPart1Sample() {
        XCTAssertEqual(day23Part1(day23SampleInput), -1)
    }

    func testPart1() {
        XCTAssertEqual(day23Part1(day23Input), -1)
    }

    func testPart2Sample() {
        XCTAssertEqual(day23Part2(day23SampleInput), -1)
    }

    func testPart2() {
        XCTAssertEqual(day23Part2(day23Input), -1)
    }

    func testPart2Benchmarked() {
        measure {
            XCTAssertEqual(day23Part2(day23Input), -1)
        }
    }
}
