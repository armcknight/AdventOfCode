//
//  Day04Problem.swift
//  aoc2020
//
//  Created by Andrew McKnight on Dec 18, 2020.
//

import aoc2020
import XCTest

class aoc2020Day04Tests: XCTestCase {
    func testPart1Sample() {
        measure {
            XCTAssertEqual(day04Part1(day04SampleInput), 2)
        }
    }

    func testPart1() {
        measure {
            XCTAssertEqual(day04Part1(day04Input), 256)
        }
    }

    func testPart2Sample() {
        measure {
            XCTAssertEqual(day04Part2(day04SampleInput), 2)
        }
    }

    func testPart2Invalid() {
        XCTAssertEqual(day04Part2(day04InvalidInput), 0)
    }

    func testPart2Valid() {
        XCTAssertEqual(day04Part2(day04ValidInput), 4)
    }

    func testPart2() {
        measure {
            XCTAssertEqual(day04Part2(day04Input), 198)
        }
    }
}
