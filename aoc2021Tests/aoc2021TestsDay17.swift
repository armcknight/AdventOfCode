//
//  Day17Problem.swift
//  aoc2021
//
//  Created by Andrew McKnight on Nov 30, 2021.
//

import aoc2021
import XCTest

class aoc2021Day17Tests: XCTestCase {
    func testPart1Sample() {
        measure {
            XCTAssertEqual(day17Part1(day17SampleInput), -1)
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
