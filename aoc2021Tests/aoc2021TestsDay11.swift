//
//  Day11Problem.swift
//  aoc2021
//
//  Created by Andrew McKnight on Nov 30, 2021.
//

import aoc2021
import XCTest

class aoc2021Day11Tests: XCTestCase {
    func testPart1Sample() {
        measure {
            XCTAssertEqual(day11Part1(day11SampleInput), -1)
        }
    }

    func testPart1() {
        measure {
            XCTAssertEqual(day11Part1(day11Input), -1)
        }
    }

    func testPart2Sample() {
        measure {
            XCTAssertEqual(day11Part2(day11SampleInput), -1)
        }
    }

    func testPart2() {
        measure {
            XCTAssertEqual(day11Part2(day11Input), -1)
        }
    }
}
