//
//  Day1Problem.swift
//  aoc2021
//
//  Created by Andrew McKnight on Nov 30, 2021.
//

import aoc2021
import XCTest

class aoc2021Day1Tests: XCTestCase {
    func testPart1Sample() {
        measure {
            XCTAssertEqual(day1Part1(day1SampleInput), 7)
        }
    }

    func testPart1() {
        measure {
            XCTAssertEqual(day1Part1(day1Input), 1832)
        }
    }

    func testPart2Sample() {
        measure {
            XCTAssertEqual(day1Part2(day1SampleInput), 5)
        }
    }

    func testPart2() {
        measure {
            XCTAssertEqual(day1Part2(day1Input), 1858)
        }
    }
}
