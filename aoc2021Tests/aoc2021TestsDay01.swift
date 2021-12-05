//
//  Day01Problem.swift
//  aoc2021
//
//  Created by Andrew McKnight on Nov 30, 2021.
//

import aoc2021
import XCTest

class aoc2021Day01Tests: XCTestCase {
    func testPart1Sample() {
        XCTAssertEqual(day01Part1(day01SampleInput), 7)
    }

    func testPart1() {
        XCTAssertEqual(day01Part1(day01Input), 1832)
    }

    func testPart2Sample() {
        XCTAssertEqual(day01Part2(day01SampleInput), 5)
    }

    func testPart2() {
        XCTAssertEqual(day01Part2(day01Input), 1858)
    }

    func testPart2Benchmarked() {
        measure {
            XCTAssertEqual(day01Part2(day01Input), 1858)
        }
    }
}
