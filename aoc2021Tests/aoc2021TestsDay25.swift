//
//  Day25Problem.swift
//  aoc2021
//
//  Created by Andrew McKnight on Nov 30, 2021.
//

import aoc2021
import XCTest

class aoc2021Day25Tests: XCTestCase {
    func testPart1Sample() {
        measure {
            XCTAssertEqual(day25Part1(day25SampleInput), -1)
        }
    }

    func testPart1() {
        measure {
            XCTAssertEqual(day25Part1(day25Input), -1)
        }
    }

    func testPart2Sample() {
        measure {
            XCTAssertEqual(day25Part2(day25SampleInput), -1)
        }
    }

    func testPart2() {
        measure {
            XCTAssertEqual(day25Part2(day25Input), -1)
        }
    }
}
