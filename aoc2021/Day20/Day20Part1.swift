//
//  Day20Part1.swift
//  aoc2021
//
//  Created by Andrew McKnight on Dec 5, 2021.
//

import aocHelpers
import SwiftArmcknight
import Foundation

public extension Day20 {
    var part1: Int {
        var lines = rawValue.lines
        let alg = Array(lines.first!).map { $0 == "#" ? 1 : 0 }
        let inputImage = Array(lines[1..<lines.count]).map { (line) -> [Int] in
            line.map { (char) -> Int in
                char == "#" ? 1 : 0
            }
        }

//        print(inputImage.map({ (row) -> [String] in
//            row.map { (col) -> String in
//                col ? "#" : "."
//            }
//        }).gridDescription)

        func enhance(inputImage: [[Int]]) -> [[Int]] {
            print(inputImage.map({ (row) -> [String] in
                row.map { (col) -> String in
                    col.description
                }
            }).gridDescription)

            var outputImage = [[Int]](repeating: [Int](repeating: 0, count: inputImage.first!.count), count: inputImage.count)
            for row in 0..<inputImage.count {
                for col in 0..<inputImage[row].count {
                    let a = row >= 1 && col >= 1 ? inputImage[row - 1][col - 1] : 0
                    let b = row >= 1 ? inputImage[row - 1][col] : 0
                    let c = row >= 1 && col <= inputImage[row - 1].count - 2 ? inputImage[row - 1][col + 1] : 0
                    let d = col >= 1 ? inputImage[row][col - 1] : 0
                    let e = inputImage[row][col]
                    let f = col <= inputImage[row].count - 2 ? inputImage[row][col + 1] : 0
                    let g = row <= inputImage.count - 2 && col >= 1 ? inputImage[row + 1][col - 1] : 0
                    let h = row <= inputImage.count - 2 ? inputImage[row + 1][col] : 0
                    let i = row <= inputImage.count - 2 && col <= inputImage[row + 1].count - 2 ? inputImage[row + 1][col + 1] : 0
                    let subsquare: [Int] = [a, b, c, d, e, f, g, h, i]
                    let integer = subsquare.decimalValueOfBinary
//                    print("row: \(row), col: \(col), binary: \(number), decimal: \(integer), alg value: \(value)")
                    outputImage[row][col] = alg[integer]
                }
            }
            return outputImage
        }

        let steps = 2
        let expand = 3 * steps
        var extendedImage = [[Int]]()
        var extendedRows = [[Int]]()
        for row in inputImage {
            var extendedRow = [Int]()
            extendedRow.append(contentsOf: [Int](repeating: 0, count: expand))
            extendedRow.append(contentsOf: row)
            extendedRow.append(contentsOf: [Int](repeating: 0, count: expand))
            extendedRows.append(extendedRow)
        }

        extendedImage.append(contentsOf: [[Int]](repeating: [Int](repeating: 0, count: extendedRows.first!.count), count: expand))
        extendedImage.append(contentsOf: extendedRows)
        extendedImage.append(contentsOf: [[Int]](repeating: [Int](repeating: 0, count: extendedRows.first!.count), count: expand))

        var output: [[Int]] = extendedImage
        for i in 0..<steps {
            output = enhance(inputImage: output)
//            print(first.map({ (row) -> [String] in
//                row.map { (col) -> String in
//                    col ? "#" : "."
//                }
//            }).gridDescription)
        }

        let chop = expand - steps
        return output[chop..<output.count - chop].reduce(0) { (result, next) -> Int in
            result + next[chop..<next.count - chop].reduce(0) { (result, next) -> Int in
                result + next
            }
        }

    }
}
