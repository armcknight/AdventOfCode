//
//  Day06Tests.swift
//  aoc2022
//
//  Created by Andrew McKnight on Dec 4, 2022.
//

import aoc2022
import XCTest

class Day06Tests: XCTestCase {
    func testPart1Sample() throws {
        XCTAssertEqual(Day06.sample.part1, 7)
    }

    func testPart1() throws {
        XCTAssertEqual(Day06.input.part1, 1920)
    }

    func testPart2Sample() throws {
        for (input, result) in [
            "mjqjpqmgbljsphdztnvjfqwrcgsmlb":  19,
            "bvwbjplbgvbhsrlpgdmjqwftvncz":  23,
            "nppdvjthqldpwncqszvftbrmjlhg":  23,
            "nznrnfrfntjfmvfwmzdfjlvtqnbhcprsg":  29,
            "zcfzfwzzqfrljwzlrfnpqdbhtmscgvjw":  26
        ] {
            XCTAssertEqual(findMessage(input: input), result)
        }
    }

    func testPart2() throws {
        XCTAssertEqual(Day06.input.part2, 2334)
    }
}
