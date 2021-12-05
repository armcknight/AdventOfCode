//
//  Day06Problem.swift
//  aoc2021
//
//  Created by Andrew McKnight on Nov 30, 2021.
//

import aoc2021
import XCTest

class aoc2021Day06Tests: XCTestCase {
    func testPart1Sample() {
        XCTAssertEqual(day06Part1(day06SampleInput), -1)
    }

    func testPart1() {
        XCTAssertEqual(day06Part1(day06Input), -1)
    }

    func testPart2Sample() {
        XCTAssertEqual(day06Part2(day06SampleInput), -1)
    }

    func testPart2() {
        XCTAssertEqual(day06Part2(day06Input), -1)
    }

    func testPart2Benchmarked() {
        measure {
            XCTAssertEqual(day06Part2(day06Input), -1)
        }
    }
}
