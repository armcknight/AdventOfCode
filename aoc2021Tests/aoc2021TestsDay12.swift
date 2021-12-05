//
//  Day12Problem.swift
//  aoc2021
//
//  Created by Andrew McKnight on Nov 30, 2021.
//

import aoc2021
import XCTest

class aoc2021Day12Tests: XCTestCase {
    func testPart1Sample() {
        XCTAssertEqual(day12Part1(day12SampleInput), -1)
    }

    func testPart1() {
        XCTAssertEqual(day12Part1(day12Input), -1)
    }

    func testPart2Sample() {
        XCTAssertEqual(day12Part2(day12SampleInput), -1)
    }

    func testPart2() {
        XCTAssertEqual(day12Part2(day12Input), -1)
    }

    func testPart2Benchmarked() {
        measure {
            XCTAssertEqual(day12Part2(day12Input), -1)
        }
    }
}
