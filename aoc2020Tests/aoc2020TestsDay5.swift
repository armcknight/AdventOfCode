//
//  Day5Problem.swift
//  aoc2020
//
//  Created by Andrew McKnight on Dec 18, 2020.
//

import aoc2020
import XCTest

class aoc2020Day5Tests: XCTestCase {
    func testPart1Sample() {
        measure {
            XCTAssertEqual(day5Part1(day5SampleInput), 820)
        }
    }

    func testPart1() {
        measure {
            XCTAssertEqual(day5Part1(day5Input), 894)
        }
    }

    func testPart2() {
        measure {
            XCTAssertEqual(day5Part2(day5Input)!, 579)
        }
    }
}
