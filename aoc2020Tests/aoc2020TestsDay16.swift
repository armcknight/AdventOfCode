//
//  Day16Problem.swift
//  aoc2020
//
//  Created by Andrew McKnight on Dec 18, 2020.
//

import aoc2020
import XCTest

class aoc2020Day16Tests: XCTestCase {
    func testPart1Sample() {
        measure {
            XCTAssertEqual(day16Part1(day16SampleInput), 71)
        }
    }

    func testPart1() {
        measure {
            XCTAssertEqual(day16Part1(day16Input), 29759)
        }
    }

    func testPart2Sample() {
        measure {
            XCTAssertEqual(day16Part2(day16SampleInput), -1)
        }
    }

    func testPart2() {
        measure {
            XCTAssertEqual(day16Part2(day16Input), -1)
        }
    }
}
