//
//  Day11Problem.swift
//  aoc2020
//
//  Created by Andrew McKnight on Dec 18, 2020.
//

import aoc2020
import XCTest

class aoc2020Day11Tests: XCTestCase {
    func testPart1Sample() {
        XCTAssertEqual(day11Part1(input: day11TestInput), 37)
    }

    func testPart1() {
        XCTAssertEqual(day11Part1(input: day11Input), 2476)
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
        XCTAssertEqual(day11Part2(input: day11Input), 0)
    }
}
