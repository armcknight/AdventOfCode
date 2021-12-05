//
//  Day15Problem.swift
//  aoc2021
//
//  Created by Andrew McKnight on Nov 30, 2021.
//

import aoc2021
import XCTest

class aoc2021Day15Tests: XCTestCase {
    func testPart1Sample() {
        XCTAssertEqual(day15Part1(day15SampleInput), -1)
    }

    func testPart1() {
        XCTAssertEqual(day15Part1(day15Input), -1)
    }

    func testPart2Sample() {
        XCTAssertEqual(day15Part2(day15SampleInput), -1)
    }

    func testPart2() {
        XCTAssertEqual(day15Part2(day15Input), -1)
    }

    func testPart2Benchmarked() {
        measure {
            XCTAssertEqual(day15Part2(day15Input), -1)
        }
    }
}
