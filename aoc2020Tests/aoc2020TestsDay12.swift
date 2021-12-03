//
//  Day12Problem.swift
//  aoc2020
//
//  Created by Andrew McKnight on Dec 18, 2020.
//

import aoc2020
import XCTest

class aoc2020Day12Tests: XCTestCase {
    func testPart1Sample() {
        measure {
            XCTAssertEqual(day12Part1(day12SampleInput), 25)
        }
    }

    func testPart1() {
        measure {
            XCTAssertEqual(day12Part1(day12Input), 879)
        }
    }

    func testPart2Sample() {
        measure {
            XCTAssertEqual(day12Part2(day12SampleInput), 286)
        }
    }

    func testPart2() {
        measure {
            XCTAssertEqual(day12Part2(day12Input), 18107)
        }
    }
}
