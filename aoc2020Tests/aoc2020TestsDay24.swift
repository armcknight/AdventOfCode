//
//  Day24Problem.swift
//  aoc2020
//
//  Created by Andrew McKnight on Dec 18, 2020.
//

import aoc2020
import XCTest

class aoc2020Day24Tests: XCTestCase {
    func testPart1Sample() {
        measure {
            XCTAssertEqual(day24Part1(day24SampleInput), -1)
        }
    }

    func testPart1() {
        measure {
            XCTAssertEqual(day24Part1(day24Input), -1)
        }
    }

    func testPart2Sample() {
        measure {
            XCTAssertEqual(day24Part2(day24SampleInput), -1)
        }
    }

    func testPart2() {
        measure {
            XCTAssertEqual(day24Part2(day24Input), -1)
        }
    }
}
