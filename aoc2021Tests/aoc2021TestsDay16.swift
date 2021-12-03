//
//  Day16Problem.swift
//  aoc2021
//
//  Created by Andrew McKnight on Nov 30, 2021.
//

import aoc2021
import XCTest

class aoc2021Day16Tests: XCTestCase {
    func testPart1Sample() {
        measure {
            XCTAssertEqual(day16Part1(day16SampleInput), -1)
        }
    }

    func testPart1() {
        measure {
            XCTAssertEqual(day16Part1(day16Input), -1)
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
