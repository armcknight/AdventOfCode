//
//  Day6Problem.swift
//  aoc2021
//
//  Created by Andrew McKnight on Nov 30, 2021.
//

import aoc2021
import XCTest

class aoc2021Day6Tests: XCTestCase {
    func testPart1Sample() {
        measure {
            XCTAssertEqual(day6Part1(day6SampleInput), -1)
        }
    }

    func testPart1() {
        measure {
            XCTAssertEqual(day6Part1(day6Input), -1)
        }
    }

    func testPart2Sample() {
        measure {
            XCTAssertEqual(day6Part2(day6SampleInput), -1)
        }
    }

    func testPart2() {
        measure {
            XCTAssertEqual(day6Part2(day6Input), -1)
        }
    }
}
