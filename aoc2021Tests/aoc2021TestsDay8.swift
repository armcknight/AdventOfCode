//
//  Day8Problem.swift
//  aoc2021
//
//  Created by Andrew McKnight on Nov 30, 2021.
//

import aoc2021
import XCTest

class aoc2021Day8Tests: XCTestCase {
    func testPart1Sample() {
        measure {
            XCTAssertEqual(day8Part1(day8SampleInput), -1)
        }
    }

    func testPart1() {
        measure {
            XCTAssertEqual(day8Part1(day8Input), -1)
        }
    }

    func testPart2Sample() {
        measure {
            XCTAssertEqual(day8Part2(day8SampleInput), -1)
        }
    }

    func testPart2() {
        measure {
            XCTAssertEqual(day8Part2(day8Input), -1)
        }
    }
}
