//
//  Day14Problem.swift
//  aoc2021
//
//  Created by Andrew McKnight on Nov 30, 2021.
//

import aoc2021
import XCTest

class aoc2021Day14Tests: XCTestCase {
    func testPart1Sample() {
        measure {
            XCTAssertEqual(day14Part1(day14SampleInput), -1)
        }
    }

    func testPart1() {
        measure {
            XCTAssertEqual(day14Part1(day14Input), -1)
        }
    }

    func testPart2Sample() {
        measure {
            XCTAssertEqual(day14Part2(day14SampleInput), -1)
        }
    }

    func testPart2() {
        measure {
            XCTAssertEqual(day14Part2(day14Input), -1)
        }
    }
}
