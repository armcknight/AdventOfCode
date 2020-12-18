//
//  Day12Problem.swift
//  aoc2020
//
//  Created by Andrew McKnight on Dec 18, 2020.
//

import aoc2020
import XCTest

class aoc2020Day12Tests: XCTestCase {
    func testPart1Sample() {
        XCTAssertEqual(day12Part1(day12SampleInput), 25)
    }

    func testPart1() {
        XCTAssertEqual(day12Part1(day12Input), 879)
    }

    func testPart2Sample() {
        XCTAssertEqual(day12Part2(day12SampleInput), 286)
    }

    func testPart2() {
        XCTAssertEqual(day12Part2(day12Input), 18107)
    }
}
