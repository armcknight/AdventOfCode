//
//  Day7Problem.swift
//  aoc2020
//
//  Created by Andrew McKnight on Dec 18, 2020.
//

import aoc2020
import XCTest

class aoc2020Day7Tests: XCTestCase {
    func testPart1Sample() {
        measure {
            XCTAssertEqual(day7Part1(day7SampleInput), 4)
        }
    }

    func testPart1() {
        measure {
            XCTAssertEqual(day7Part1(day7Input), 128)
        }
    }

    func testPart2Sample() {
        measure {
            XCTAssertEqual(day7Part2(day7SampleInput), 126)
        }
    }

    func testPart2() {
        measure {
            XCTAssertEqual(day7Part2(day7Input), -1)
        }
    }
}
