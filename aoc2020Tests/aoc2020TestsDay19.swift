//
//  Day19Problem.swift
//  aoc2020
//
//  Created by Andrew McKnight on Dec 18, 2020.
//

import aoc2020
import XCTest

class aoc2020Day19Tests: XCTestCase {
    func testPart1Sample() {
        measure {
            XCTAssertEqual(day19Part1(day19SampleInput), 2)
        }
    }

    func testPart1() {
        measure {
            XCTAssertEqual(day19Part1(day19Input), 258)
        }
    }

    func testPart2Sample() {
        measure {
            XCTAssertEqual(day19Part2(day19SampleInput), -1)
        }
    }

    func testPart2() {
        measure {
            XCTAssertEqual(day19Part2(day19Input), -1)
        }
    }
}
