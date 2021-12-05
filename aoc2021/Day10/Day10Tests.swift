//
//  Day10Problem.swift
//  aoc2021
//
//  Created by Andrew McKnight on Nov 30, 2021.
//

import aoc2021
import XCTest

class aoc2021Day10Tests: XCTestCase {
    func testPart1Sample() {
        XCTAssertEqual(day10Part1(day10SampleInput), -1)
    }

    func testPart1() {
        XCTAssertEqual(day10Part1(day10Input), -1)
    }

    func testPart2Sample() {
        XCTAssertEqual(day10Part2(day10SampleInput), -1)
    }

    func testPart2() {
        XCTAssertEqual(day10Part2(day10Input), -1)
    }

    func testPart2Benchmarked() {
        measure {
            XCTAssertEqual(day10Part2(day10Input), -1)
        }
    }
}
