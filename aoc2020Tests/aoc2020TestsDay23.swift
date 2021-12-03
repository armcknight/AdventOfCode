//
//  Day23Problem.swift
//  aoc2020
//
//  Created by Andrew McKnight on Dec 18, 2020.
//

import aoc2020
import XCTest

class aoc2020Day23Tests: XCTestCase {
    func testPart1Sample() {
        measure {
            XCTAssertEqual(day23Part1(day23SampleInput), 67384529)
        }
    }

    func testPart1() {
        measure {
            XCTAssertEqual(day23Part1(day23Input), -1)
        }
    }

    func testPart2Sample() {
        measure {
            XCTAssertEqual(day23Part2(day23SampleInput), -1)
        }
    }

    func testPart2() {
        measure {
            XCTAssertEqual(day23Part2(day23Input), -1)
        }
    }
}
