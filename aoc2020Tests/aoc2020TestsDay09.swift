//
//  Day09Problem.swift
//  aoc2020
//
//  Created by Andrew McKnight on Dec 18, 2020.
//

import aoc2020
import XCTest

class aoc2020Day09Tests: XCTestCase {
    func testPart1Sample() {
        measure {
            XCTAssertEqual(day09Part1(day09SampleInput, codeAge: 5), 127)
        }
    }

    func testPart1() {
        measure {
            XCTAssertEqual(day09Part1(day09Input, codeAge: 25), 1721308972)
        }
    }

    func testPart2Sample() {
        measure {
            XCTAssertEqual(day09Part2(day09SampleInput, codeAge: 5), 62)
        }
    }

    func testPart2() {
        measure {
            XCTAssertEqual(day09Part2(day09Input, codeAge: 25), 209694133)
        }
    }
}
