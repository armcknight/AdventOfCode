//
//  Day09Problem.swift
//  aoc2021
//
//  Created by Andrew McKnight on Nov 30, 2021.
//

import aoc2021
import XCTest

class aoc2021Day09Tests: XCTestCase {
    func testPart1Sample() {
        measure {
            XCTAssertEqual(day09Part1(day09SampleInput), -1)
        }
    }

    func testPart1() {
        measure {
            XCTAssertEqual(day09Part1(day09Input), -1)
        }
    }

    func testPart2Sample() {
        measure {
            XCTAssertEqual(day09Part2(day09SampleInput), -1)
        }
    }

    func testPart2() {
        measure {
            XCTAssertEqual(day09Part2(day09Input), -1)
        }
    }
}
