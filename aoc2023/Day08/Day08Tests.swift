//
//  Day08Tests.swift
//  aoc2023
//
//  Created by Andrew McKnight on Dec 10, 2023.
//

import aoc2023
import XCTest

class Day08Tests: XCTestCase {
    func testPart1Sample1() throws {
        XCTAssertEqual(Day08.sample1.part1, 2)
    }
    
    func testPart1Sample2() throws {
        XCTAssertEqual(Day08.sample2.part1, 6)
    }

    func testPart1() throws {
        XCTAssertEqual(Day08.input.part1, 17141)
    }

    func testPart2Sample() throws {
        XCTAssertEqual(Day08.sample3.part2, 6)
    }

    func testPart2() throws {
        XCTAssertEqual(Day08.input.part2, 10818234074807)
    }
}
