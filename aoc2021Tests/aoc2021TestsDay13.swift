//
//  Day13Problem.swift
//  aoc2021
//
//  Created by Andrew McKnight on Nov 30, 2021.
//

import aoc2021
import XCTest

class aoc2021Day13Tests: XCTestCase {
    func testPart1Sample() {
        measure {
            XCTAssertEqual(day13Part1(day13SampleInput), -1)
        }
    }

    func testPart1() {
        measure {
            XCTAssertEqual(day13Part1(day13Input), -1)
        }
    }

    func testPart2Sample() {
        measure {
            XCTAssertEqual(day13Part2(day13SampleInput), -1)
        }
    }

    func testPart2() {
        measure {
            XCTAssertEqual(day13Part2(day13Input), -1)
        }
    }
}
