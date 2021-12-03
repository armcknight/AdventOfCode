//
//  Day4Problem.swift
//  aoc2021
//
//  Created by Andrew McKnight on Nov 30, 2021.
//

import aoc2021
import XCTest

class aoc2021Day4Tests: XCTestCase {
    func testPart1Sample() {
        measure {
            XCTAssertEqual(day4Part1(day4SampleInput), -1)
        }
    }

    func testPart1() {
        measure {
            XCTAssertEqual(day4Part1(day4Input), -1)
        }
    }

    func testPart2Sample() {
        measure {
            XCTAssertEqual(day4Part2(day4SampleInput), -1)
        }
    }

    func testPart2() {
        measure {
            XCTAssertEqual(day4Part2(day4Input), -1)
        }
    }
}
