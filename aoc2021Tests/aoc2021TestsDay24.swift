//
//  Day24Problem.swift
//  aoc2021
//
//  Created by Andrew McKnight on Nov 30, 2021.
//

import aoc2021
import XCTest

class aoc2021Day24Tests: XCTestCase {
    func testPart1Sample() {
        XCTAssertEqual(day24Part1(day24SampleInput), -1)
    }

    func testPart1() {
        XCTAssertEqual(day24Part1(day24Input), -1)
    }

    func testPart2Sample() {
        XCTAssertEqual(day24Part2(day24SampleInput), -1)
    }

    func testPart2() {
        XCTAssertEqual(day24Part2(day24Input), -1)
    }

    func testPart2Benchmarked() {
        measure {
            XCTAssertEqual(day24Part2(day24Input), -1)
        }
    }
}
