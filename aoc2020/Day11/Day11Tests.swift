//
//  Day11Problem.swift
//  aoc2020
//
//  Created by Andrew McKnight on Dec 18, 2020.
//

import aoc2020
import XCTest

class Day11Tests: XCTestCase {
    func testPart1Sample() {
        XCTAssertEqual(Day11.sample.part1, 37)
    }

    func testPart1() {
        XCTAssertEqual(Day11.input.part1, 2476)
    }

    func testPart2Sample1() {
        let input = """
        .......#.
        ...#.....
        .#.......
        .........
        ..#L....#
        ....#....
        .........
        #........
        ...#.....
        """
        XCTAssertEqual(iterateVisible(grid: input.characterGrid, row: 4, col: 3), 8)
    }

    func testPart2() {
        XCTAssertEqual(Day11.input.part2, 2257)
    }
}
