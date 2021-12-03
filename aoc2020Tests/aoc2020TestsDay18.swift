//
//  Day18Problem.swift
//  aoc2020
//
//  Created by Andrew McKnight on Dec 18, 2020.
//

import aoc2020
import XCTest

class aoc2020Day18Tests: XCTestCase {
    func testPart1Sample() {
        measure {
            XCTAssertEqual(day18Part1(day18SampleInput), -1)
        }
    }

    func testPart1() {
        measure {
            XCTAssertEqual(day18Part1(day18Input), -1)
        }
    }

    func testPart2Sample() {
        measure {
            XCTAssertEqual(day18Part2(day18SampleInput), -1)
        }
    }

    func testPart2() {
        measure {
            XCTAssertEqual(day18Part2(day18Input), -1)
        }
    }
}
