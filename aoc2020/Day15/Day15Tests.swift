//
//  Day15Problem.swift
//  aoc2020
//
//  Created by Andrew McKnight on Dec 18, 2020.
//

import aoc2020
import XCTest

class Day15Tests: XCTestCase {
    func testPart1Sample() {
        Day15.day15SampleInput.forEach {
            XCTAssertEqual(Day15.compute(turns: 2020, input: $0.key), $0.value)
        }
    }

    func testPart1() {
        XCTAssertEqual(Day15.input.part1, 852)
    }

    func testPart2Sample() throws {
        throw XCTSkip("computes the correct answer, but needs an optimal solution, impractical runtime")
        Day15.day15SampleInput2.forEach {
            XCTAssertEqual(Day15.compute(turns: 30000000, input: $0.key), $0.value)
        }
    }

    func testPart2() throws {
        throw XCTSkip("computes the correct answer, but needs an optimal solution, impractical runtime")
        XCTAssertEqual(Day15.input.part2, 6007666)
    }
}
