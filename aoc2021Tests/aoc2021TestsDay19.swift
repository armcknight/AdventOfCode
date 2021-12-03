//
//  Day19Problem.swift
//  aoc2021
//
//  Created by Andrew McKnight on Nov 30, 2021.
//

import aoc2021
import XCTest

class aoc2021Day19Tests: XCTestCase {
    func testPart1Sample() {
        measure {
            XCTAssertEqual(day19Part1(day19SampleInput), -1)
        }
    }

    func testPart1() {
        measure {
            XCTAssertEqual(day19Part1(day19Input), -1)
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
