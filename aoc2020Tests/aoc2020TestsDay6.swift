//
//  Day6Problem.swift
//  aoc2020
//
//  Created by Andrew McKnight on Dec 18, 2020.
//

import aoc2020
import XCTest

class aoc2020Day6Tests: XCTestCase {
    func testPart1Sample() {
        measure {
            XCTAssertEqual(day6Part1(day6SampleInput), 11)
        }
    }

    func testPart1() {
        measure {
            XCTAssertEqual(day6Part1(day6Input), 6583)
        }
    }

    func testPart2Sample() {
        measure {
            XCTAssertEqual(day6Part2(day6SampleInput), 6)
        }
    }

    func testPart2() {
        measure {
            XCTAssertEqual(day6Part2(day6Input), 3290)
        }
    }
}
