//
//  Day2Problem.swift
//  aoc2020
//
//  Created by Andrew McKnight on Dec 18, 2020.
//

import aoc2020
import XCTest

class aoc2020Day2Tests: XCTestCase {
    func testPart1Sample() {
        measure {
            XCTAssertEqual(day2Part1(day2SampleInput), 2)
        }
    }

    func testPart1() {
        measure {
            XCTAssertEqual(day2Part1(day2Input), 586)
        }
    }

    func testPart2Sample() {
        measure {
            XCTAssertEqual(day2Part2(day2SampleInput), 1)
        }
    }

    func testPart2() {
        measure {
            XCTAssertEqual(day2Part2(day2Input), 352)
        }
    }
}
