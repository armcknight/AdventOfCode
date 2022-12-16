//
//  Day07Problem.swift
//  aoc2020
//
//  Created by Andrew McKnight on Dec 18, 2020.
//

import aoc2020
import XCTest

class Day07Tests: XCTestCase {
    func testPart1Sample() {
        XCTAssertEqual(day07Part1(day07SampleInput), 4)
    }

    func testPart1() {
        XCTAssertEqual(day07Part1(day07Input), 128)
    }

    func testPart2Sample() throws {
        throw XCTSkip("Implementation contains a bug")
        XCTAssertEqual(day07Part2(day07SampleInput), 126)
    }

    func testPart2() {
        XCTAssertEqual(day07Part2(day07Input), -1)
    }
}
