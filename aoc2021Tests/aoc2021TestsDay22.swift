//
//  Day22Problem.swift
//  aoc2021
//
//  Created by Andrew McKnight on Nov 30, 2021.
//

import aoc2021
import XCTest

class aoc2021Day22Tests: XCTestCase {
    func testPart1Sample() {
        measure {
            XCTAssertEqual(day22Part1(day22SampleInput), -1)
        }
    }

    func testPart1() {
        measure {
            XCTAssertEqual(day22Part1(day22Input), -1)
        }
    }

    func testPart2Sample() {
        measure {
            XCTAssertEqual(day22Part2(day22SampleInput), -1)
        }
    }

    func testPart2() {
        measure {
            XCTAssertEqual(day22Part2(day22Input), -1)
        }
    }
}
