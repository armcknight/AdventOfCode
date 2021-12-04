//
//  Day04Problem.swift
//  aoc2021
//
//  Created by Andrew McKnight on Nov 30, 2021.
//

import aoc2021
import XCTest

class aoc2021Day04Tests: XCTestCase {
    func testPart1Sample() {
        measure {
            XCTAssertEqual(day04Part1(day04SampleInput), 4512)
        }
    }

    func testPart1() {
        measure {
            XCTAssertEqual(day04Part1(day04Input), 2745)
        }
    }

    func testPart2Sample() {
        measure {
            XCTAssertEqual(day04Part2(day04SampleInput), 1924)
        }
    }

    func testPart2() {
        measure {
            XCTAssertEqual(day04Part2(day04Input), 6594)
        }
    }
}
