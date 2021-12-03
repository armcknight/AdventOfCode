//
//  Day7Problem.swift
//  aoc2021
//
//  Created by Andrew McKnight on Nov 30, 2021.
//

import aoc2021
import XCTest

class aoc2021Day7Tests: XCTestCase {
    func testPart1Sample() {
        measure {
            XCTAssertEqual(day7Part1(day7SampleInput), -1)
        }
    }

    func testPart1() {
        measure {
            XCTAssertEqual(day7Part1(day7Input), -1)
        }
    }

    func testPart2Sample() {
        measure {
            XCTAssertEqual(day7Part2(day7SampleInput), -1)
        }
    }

    func testPart2() {
        measure {
            XCTAssertEqual(day7Part2(day7Input), -1)
        }
    }
}
