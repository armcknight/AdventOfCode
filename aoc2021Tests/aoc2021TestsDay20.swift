//
//  Day20Problem.swift
//  aoc2021
//
//  Created by Andrew McKnight on Nov 30, 2021.
//

import aoc2021
import XCTest

class aoc2021Day20Tests: XCTestCase {
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
