//
//  Day9Problem.swift
//  aoc2021
//
//  Created by Andrew McKnight on Nov 30, 2021.
//

import aoc2021
import XCTest

class aoc2021Day9Tests: XCTestCase {
    func testPart1Sample() {
        measure {
            XCTAssertEqual(day9Part1(day9SampleInput), -1)
        }
    }

    func testPart1() {
        measure {
            XCTAssertEqual(day9Part1(day9Input), -1)
        }
    }

    func testPart2Sample() {
        measure {
            XCTAssertEqual(day9Part2(day9SampleInput), -1)
        }
    }

    func testPart2() {
        measure {
            XCTAssertEqual(day9Part2(day9Input), -1)
        }
    }
}
