//
//  Day5Problem.swift
//  aoc2021
//
//  Created by Andrew McKnight on Nov 30, 2021.
//

import aoc2021
import XCTest

class aoc2021Day5Tests: XCTestCase {
    func testPart1Sample() {
        measure {
            XCTAssertEqual(day5Part1(day5SampleInput), -1)
        }
    }

    func testPart1() {
        measure {
            XCTAssertEqual(day5Part1(day5Input), -1)
        }
    }

    func testPart2Sample() {
        measure {
            XCTAssertEqual(day5Part2(day5SampleInput), -1)
        }
    }

    func testPart2() {
        measure {
            XCTAssertEqual(day5Part2(day5Input), -1)
        }
    }
}
