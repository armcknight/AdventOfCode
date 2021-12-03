//
//  Day17Problem.swift
//  aoc2020
//
//  Created by Andrew McKnight on Dec 18, 2020.
//

import aoc2020
import XCTest

class aoc2020Day17Tests: XCTestCase {
    func testPart1Sample() {
        measure {
            XCTAssertEqual(day17Part1(day17SampleInput), 112)
        }
    }

    func testPart1() {
        measure {
            XCTAssertEqual(day17Part1(day17Input), -1)
        }
    }

    func testPart2Sample() {
        measure {
            XCTAssertEqual(day17Part2(day17SampleInput), -1)
        }
    }

    func testPart2() {
        measure {
            XCTAssertEqual(day17Part2(day17Input), -1)
        }
    }
}
