//
//  Day08Problem.swift
//  aoc2021
//
//  Created by Andrew McKnight on Nov 30, 2021.
//

import aoc2021
import XCTest

class aoc2021Day08Tests: XCTestCase {
    func testPart1Sample() {
        measure {
            XCTAssertEqual(day08Part1(day08SampleInput), -1)
        }
    }

    func testPart1() {
        measure {
            XCTAssertEqual(day08Part1(day08Input), -1)
        }
    }

    func testPart2Sample() {
        measure {
            XCTAssertEqual(day08Part2(day08SampleInput), -1)
        }
    }

    func testPart2() {
        measure {
            XCTAssertEqual(day08Part2(day08Input), -1)
        }
    }
}
