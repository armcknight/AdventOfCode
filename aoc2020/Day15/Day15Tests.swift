//
//  Day15Problem.swift
//  aoc2020
//
//  Created by Andrew McKnight on Dec 18, 2020.
//

import aoc2020
import XCTest

class Day15Tests: XCTestCase {
    func testPart1Sample() {
        day15SampleInput.forEach {
            XCTAssertEqual(day15Part1($0.key), $0.value)
        }
    }

    func testPart1() {
        XCTAssertEqual(day15Part1(day15Input), 852)
    }

    func testPart2Sample() {
        day15SampleInput2.forEach {
            XCTAssertEqual(day15Part2($0.key), $0.value)
        }
    }

    func testPart2() {
        // TODO: needs an optimal solution, impractical runtime
//        measure {
            XCTAssertEqual(day15Part2(day15Input), 6007666)
//        }
    }
}
