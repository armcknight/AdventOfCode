//
//  Day10Problem.swift
//  aoc2020
//
//  Created by Andrew McKnight on Dec 18, 2020.
//

import aoc2020
import XCTest

class Day10Tests: XCTestCase {
    func testPart1() {
        XCTAssertEqual(day10Part1(input: day10TestInput), 35)
        XCTAssertEqual(day10Part1(input: day10Input), 2482)
    }

    func testPart2Small() {
        XCTAssertEqual(day10Part2(input: day10SmallTestInput), 2)
    }

    func testPart2Medium() {
        XCTAssertEqual(day10Part2(input: day10TestInput), 8)
    }

    // Does not finish correctly and/or in practical time; need an optimal solution
//    func testPart2() {
//        measure {
//            XCTAssertGreaterThan(day10Part2(input: day10Input), 520605)
//        }
//        measure {
//            XCTAssertEqual(day10Part2(input: day10Input), 0)
//        }
//    }
}
