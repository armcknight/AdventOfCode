//
//  Day07Problem.swift
//  aoc2021
//
//  Created by Andrew McKnight on Nov 30, 2021.
//

import aoc2021
import XCTest

class aoc2021Day07Tests: XCTestCase {
    func testPart1Sample() {
        XCTAssertEqual(day07Part1(day07SampleInput), -1)
    }

    func testPart1() {
        XCTAssertEqual(day07Part1(day07Input), -1)
    }

    func testPart2Sample() {
        XCTAssertEqual(day07Part2(day07SampleInput), -1)
    }

    func testPart2() {
        XCTAssertEqual(day07Part2(day07Input), -1)
    }

    func testPart2Benchmarked() {
        measure {
            XCTAssertEqual(day07Part2(day07Input), -1)
        }
    }
}
