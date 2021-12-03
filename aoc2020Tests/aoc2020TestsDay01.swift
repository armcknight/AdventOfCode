//
//  Day01Problem.swift
//  aoc2020
//
//  Created by Andrew McKnight on Dec 18, 2020.
//

import aoc2020
import XCTest

class aoc2020Day01Tests: XCTestCase {
    func testPart1Sample() {
        measure {
            XCTAssertEqual(day01Part1(day01SampleInput), 514579)
        }
    }

    func testPart1() {
        measure {
            XCTAssertEqual(day01Part1(day01Input)!, 802011)
        }
    }

    func testPart2Sample() {
        measure {
            XCTAssertEqual(day01Part2(day01SampleInput)!, 241861950)
        }
    }

    func testPart2() {
        measure {
            XCTAssertEqual(day01Part2(day01Input)!, 248607374)
        }
    }
}
