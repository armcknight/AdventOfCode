//
//  Day02Problem.swift
//  aoc2021
//
//  Created by Andrew McKnight on Nov 30, 2021.
//

import aoc2021
import XCTest

class aoc2021Day02Tests: XCTestCase {
    func testPart1Sample() {
        measure {
            XCTAssertEqual(day02Part1(day02SampleInput), 150)
        }
    }

    func testPart1() {
        measure {
            XCTAssertEqual(day02Part1(day02Input), 1499229)
        }
    }

    func testPart2Sample() {
        measure {
            XCTAssertEqual(day02Part2(day02SampleInput), 900)
        }
    }

    func testPart2() {
        measure {
            XCTAssertEqual(day02Part2(day02Input), 1340836560)
        }
    }
}
