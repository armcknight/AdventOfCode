//
//  Day05Tests.swift
//  aoc2023
//
//  Created by Andrew McKnight on Dec 4, 2023.
//

import aoc2023
import XCTest

class Day05Tests: XCTestCase {
    func testPart1SampleInefficient() throws {
        XCTAssertEqual(Day05.sample.part1Inefficient, 35)
    }

    func testPart1Inefficient() throws {
        throw XCTSkip("Too slow")
        XCTAssertEqual(Day05.input.part1Inefficient, 0)
    }
    
    func testPart1SampleEfficient() throws {
        XCTAssertEqual(Day05.sample.part1Efficient, 35)
    }

    func testPart1Efficient() throws {
        let result = Day05.input.part1Efficient
        XCTAssertNotEqual(result, 61484036)
        XCTAssertNotEqual(result, 948577085)
        XCTAssertNotEqual(result, 175622908)
        XCTAssertEqual(result, 175622908)
    }

    func testPart2Sample() throws {
        XCTAssertEqual(Day05.sample.part2, 46)
    }

    func testPart2() throws {
        XCTAssertEqual(Day05.input.part2, 0)
    }
}
