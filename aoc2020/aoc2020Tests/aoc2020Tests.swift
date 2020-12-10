//
//  aoc2020Tests.swift
//  aoc2020Tests
//
//  Created by Andrew McKnight on 12/9/20.
//

import aoc2020
import XCTest

class aoc2020Day1Tests: XCTestCase {
    func testPart1() {
        XCTAssertEqual(find2020By2(testInput), 514579)
        XCTAssertEqual(find2020By2(input)!, 802011)
    }

    func testPart2() {
        XCTAssertEqual(find2020By3(testInput)!, 241861950)
        XCTAssertEqual(find2020By3(input)!, 248607374)
    }
}
