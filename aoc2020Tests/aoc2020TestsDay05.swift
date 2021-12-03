//
//  Day05Problem.swift
//  aoc2020
//
//  Created by Andrew McKnight on Dec 18, 2020.
//

import aoc2020
import XCTest

class aoc2020Day05Tests: XCTestCase {
    func testPart1Sample() {
        measure {
            XCTAssertEqual(day05Part1(day05SampleInput), 820)
        }
    }

    func testPart1() {
        measure {
            XCTAssertEqual(day05Part1(day05Input), 894)
        }
    }

    func testPart2() {
        measure {
            XCTAssertEqual(day05Part2(day05Input)!, 579)
        }
    }
}
