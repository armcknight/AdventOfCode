//
//  Day21Problem.swift
//  aoc2021
//
//  Created by Andrew McKnight on Nov 30, 2021.
//

import aoc2021
import XCTest

class aoc2021Day21Tests: XCTestCase {
    func testPart1Sample() {
        measure {
            XCTAssertEqual(day21Part1(day21SampleInput), -1)
        }
    }

    func testPart1() {
        measure {
            XCTAssertEqual(day21Part1(day21Input), -1)
        }
    }

    func testPart2Sample() {
        measure {
            XCTAssertEqual(day21Part2(day21SampleInput), -1)
        }
    }

    func testPart2() {
        measure {
            XCTAssertEqual(day21Part2(day21Input), -1)
        }
    }
}
