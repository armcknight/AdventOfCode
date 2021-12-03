//
//  Day20Problem.swift
//  aoc2020
//
//  Created by Andrew McKnight on Dec 18, 2020.
//

import aoc2020
import XCTest

class aoc2020Day20Tests: XCTestCase {
    func testPart1Sample() {
        measure {
            XCTAssertEqual(day20Part1(day20SampleInput), -1)
        }
    }

    func testPart1() {
        measure {
            XCTAssertEqual(day20Part1(day20Input), -1)
        }
    }

    func testPart2Sample() {
        measure {
            XCTAssertEqual(day20Part2(day20SampleInput), -1)
        }
    }

    func testPart2() {
        measure {
            XCTAssertEqual(day20Part2(day20Input), -1)
        }
    }
}
