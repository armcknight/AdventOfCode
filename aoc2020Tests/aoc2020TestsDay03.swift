//
//  Day03Problem.swift
//  aoc2020
//
//  Created by Andrew McKnight on Dec 18, 2020.
//

import aoc2020
import XCTest

class aoc2020Day03Tests: XCTestCase {
    func testPart1Sample() {
        measure {
            XCTAssertEqual(day03Part1(day03SampleInput), 7)
        }
    }

    func testPart1() {
        measure {
            XCTAssertEqual(day03Part1(day03Input), 252)
        }
    }

    func testPart2Sample() {
        measure {
            XCTAssertEqual(day03Part2(day03SampleInput), 336)
        }
    }

    func testPart2() {
        measure {
            XCTAssertEqual(day03Part2(day03Input), 2608962048)
        }
    }
}