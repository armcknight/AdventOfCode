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
        XCTAssertEqual(day1Part1(day1SampleInput), 514579)
        XCTAssertEqual(day1Part1(day1Input)!, 802011)
    }

    func testPart2() {
        XCTAssertEqual(day1Part2(day1SampleInput)!, 241861950)
        XCTAssertEqual(day1Part2(day1Input)!, 248607374)
    }
}

//class aoc2020Day2Tests: XCTestCase {
//    func testPart1() {
//        XCTAssertEqual(day2Part1(day2SampleInput), 0)
//        XCTAssertEqual(day2Part1(day2Input), 0)
//    }
//
//    func testPart2() {
//        XCTAssertEqual(day2Part2(day2SampleInput), 0)
//        XCTAssertEqual(day2Part2(day2Input), 0)
//    }
//}
//
//class aoc2020Day3Tests: XCTestCase {
//    func testPart1() {
//        XCTAssertEqual(day3Part1(day3SampleInput), 0)
//        XCTAssertEqual(day3Part1(day3Input), 0)
//    }
//
//    func testPart2() {
//        XCTAssertEqual(day3Part2(day3SampleInput), 0)
//        XCTAssertEqual(day3Part2(day3Input), 0)
//    }
//}
//
//class aoc2020Day4Tests: XCTestCase {
//    func testPart1() {
//        XCTAssertEqual(day4Part1(day4SampleInput), 0)
//        XCTAssertEqual(day4Part1(day4Input), 0)
//    }
//
//    func testPart2() {
//        XCTAssertEqual(day4Part2(day4SampleInput), 0)
//        XCTAssertEqual(day4Part2(day4Input), 0)
//    }
//}
//
//class aoc2020Day5Tests: XCTestCase {
//    func testPart1() {
//        XCTAssertEqual(day5Part1(day5SampleInput), 0)
//        XCTAssertEqual(day5Part1(day5Input), 0)
//    }
//
//    func testPart2() {
//        XCTAssertEqual(day5Part2(day5SampleInput), 0)
//        XCTAssertEqual(day5Part2(day5Input), 0)
//    }
//}
//
//class aoc2020Day6Tests: XCTestCase {
//    func testPart1() {
//        XCTAssertEqual(day6Part1(day6SampleInput), 0)
//        XCTAssertEqual(day6Part1(day6Input), 0)
//    }
//
//    func testPart2() {
//        XCTAssertEqual(day6Part2(day6SampleInput), 0)
//        XCTAssertEqual(day6Part2(day6Input), 0)
//    }
//}
//
//class aoc2020Day7Tests: XCTestCase {
//    func testPart1() {
//        XCTAssertEqual(day7Part1(day7SampleInput), 0)
//        XCTAssertEqual(day7Part1(day7Input), 0)
//    }
//
//    func testPart2() {
//        XCTAssertEqual(day7Part2(day7SampleInput), 0)
//        XCTAssertEqual(day7Part2(day7Input), 0)
//    }
//}
//
//class aoc2020Day8Tests: XCTestCase {
//    func testPart1() {
//        XCTAssertEqual(day8Part1(day8SampleInput), 0)
//        XCTAssertEqual(day8Part1(day8Input), 0)
//    }
//
//    func testPart2() {
//        XCTAssertEqual(day8Part2(day8SampleInput), 0)
//        XCTAssertEqual(day8Part2(day8Input), 0)
//    }
//}
//
//class aoc2020Day9Tests: XCTestCase {
//    func testPart1() {
//        XCTAssertEqual(day9Part1(day9SampleInput), 0)
//        XCTAssertEqual(day9Part1(day9Input), 0)
//    }
//
//    func testPart2() {
//        XCTAssertEqual(day9Part2(day9SampleInput), 0)
//        XCTAssertEqual(day9Part2(day9Input), 0)
//    }
//}

class aoc2020Day10Tests: XCTestCase {
    func testPart1() {
        XCTAssertEqual(day10Part1(input: day10TestInput), 35)
        XCTAssertEqual(day10Part1(input: day10Input), 0)
    }

    func testPart2Small() {
        XCTAssertEqual(day10Part2(input: day10SmallTestInput), 2)
    }

    func testPart2Medium() {
        XCTAssertEqual(day10Part2(input: day10TestInput), 8)
    }

    func testPart2() {
//        XCTAssertGreaterThan(day10Part2(input: day10Input), 520605)
        XCTAssertEqual(day10Part2(input: day10Input), 0)
    }
}

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

class aoc2020Day12Tests: XCTestCase {
    func testPart1Sample() {
        XCTAssertEqual(day12Part1(day12SampleInput), 25)
    }

    func testPart1() {
        XCTAssertEqual(day12Part1(day12Input), 879)
    }

    func testPart2Sample() {
        XCTAssertEqual(day12Part2(day12SampleInput), 286)
    }

    func testPart2() {
        XCTAssertEqual(day12Part2(day12Input), 18107)
    }
}
