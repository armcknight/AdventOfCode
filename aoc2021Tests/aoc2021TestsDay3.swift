//
//  Day3Problem.swift
//  aoc2021
//
//  Created by Andrew McKnight on Nov 30, 2021.
//

import aoc2021
import XCTest

class aoc2021Day3Tests: XCTestCase {
    func testPart1Sample() {
        measure {
            XCTAssertEqual(day3Part1(day3SampleInput), 198)
        }
    }

    func testPart1() {
        measure {
            XCTAssertEqual(day3Part1(day3Input), 3633500)
        }
    }

    func testPart2Sample() {
        measure {
            XCTAssertEqual(day3Part2(day3SampleInput), 230)
        }
    }

    func testPart2() {
        measure {
            XCTAssertEqual(day3Part2(day3Input), 4550283)
        }
    }
}
