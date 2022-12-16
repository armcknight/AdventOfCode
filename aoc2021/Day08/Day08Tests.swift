//
//  Day08Tests.swift
//  aoc2021
//
//  Created by Andrew McKnight on Dec 5, 2021.
//

import aoc2021
import XCTest

class Day08Tests: XCTestCase {
    func testPart1Sample() throws {
        throw XCTSkip("Not finished")
        XCTAssertEqual(Day08.sample.part1, -1)
    }

    func testPart1BiggerSample() {
        XCTAssertEqual(Day08.biggerSample.part1, 26)
    }

    func testPart1() {
        XCTAssertEqual(Day08.input.part1, -1)
    }

    func testPart2Sample() throws {
        throw XCTSkip("Not finished")
        XCTAssertEqual(Day08.sample.part2, -1)
    }

    func testPart2BiggerSample() throws {
        throw XCTSkip("Not finished")
        let answers = """
fdgacbe cefdb cefbgd gcbe: 8394
fcgedb cgb dgebacf gc: 9781
cg cg fdcagb cbg: 1197
efabcd cedba gadfec cb: 9361
gecf egdcabf bgf bfgea: 4873
gebdcfa ecba ca fadegcb: 8418
cefg dcbef fcge gbcadfe: 4548
ed bcgafe cdgba cbgef: 1625
gbdfcae bgc cg cgb: 8717
fgae cfgab fg bagce: 4315
"""
        XCTAssertEqual(Day08.biggerSample.part2, 26)
    }

    func testPart2() {
        XCTAssertEqual(Day08.input.part2, -1)
    }
}
