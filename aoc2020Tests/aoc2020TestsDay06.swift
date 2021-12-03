//
//  Day06Problem.swift
//  aoc2020
//
//  Created by Andrew McKnight on Dec 18, 2020.
//

import aoc2020
import XCTest

class aoc2020Day06Tests: XCTestCase {
    func testPart1Sample() {
        measure {
            XCTAssertEqual(day06Part1(day06SampleInput), 11)
        }
    }

    func testPart1() {
        measure {
            XCTAssertEqual(day06Part1(day06Input), 6583)
        }
    }

    func testPart2Sample() {
        measure {
            XCTAssertEqual(day06Part2(day06SampleInput), 6)
        }
    }

    func testPart2() {
        measure {
            XCTAssertEqual(day06Part2(day06Input), 3290)
        }
    }
}