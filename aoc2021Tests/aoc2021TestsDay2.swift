//
//  Day2Problem.swift
//  aoc2021
//
//  Created by Andrew McKnight on Nov 30, 2021.
//

import aoc2021
import XCTest

class aoc2021Day2Tests: XCTestCase {
    func testPart1Sample() {
        measure {
            XCTAssertEqual(day2Part1(day2SampleInput), 150)
        }
    }

    func testPart1() {
        measure {
            XCTAssertEqual(day2Part1(day2Input), 1499229)
        }
    }

    func testPart2Sample() {
        measure {
            XCTAssertEqual(day2Part2(day2SampleInput), 900)
        }
    }

    func testPart2() {
        measure {
            XCTAssertEqual(day2Part2(day2Input), 1340836560)
        }
    }
}
