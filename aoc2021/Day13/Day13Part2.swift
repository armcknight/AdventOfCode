//
//  Day13Part2.swift
//  aoc2021
//
//  Created by Andrew McKnight on Dec 5, 2021.
//

import aocHelpers
import Foundation

public extension Day13 {
    var part2: Int {
        let input = rawValue.lines

        var maxX = 0
        var maxY = 0
        var coords: [(Int, Int)] = input.filter { !$0.contains("fold") }.map {
            let xy = $0.split(separator: ",")
            let x = xy.first!.integerValue
            let y = xy.last!.integerValue
            if x > maxX {
                maxX = x
            }
            if y > maxY {
                maxY = y
            }
            return (y, x)
        }

        let folds: [(String, Int)] = input.filter { $0.contains("fold") }.map {
            let cleaned = ($0 as NSString)
                .replacingOccurrences(of: "fold along ", with: "")
                .split(separator: "=")
            return (String(cleaned.first!), cleaned.last!.integerValue)
        }

        var grid = Array(repeating: Array(repeating: false, count: maxX + 1), count: maxY + 1)
        for coord in coords {
            grid[coord.0][coord.1] = true
        }

//        print("coords: \(coords)")

//        print((grid as Array<Array<CustomStringConvertible>>).gridDescription.replacingOccurrences(of: "true", with: "#").replacingOccurrences(of: "false", with: "."))

        func performFold(fold: (String, Int)) {
            for coordIdx in (0..<coords.count).reversed() {
                guard coordIdx < coords.count else { continue }
                let coord = coords[coordIdx]
                if fold.0 == "x" { // vertical fold
                    if fold.1 < coord.1 {
                        let newXCoord = coord.1 - 2 * (coord.1 - fold.1)
                        grid[coord.0][newXCoord] = true
                        grid[coord.0][coord.1] = false
                        coords.removeAll { oldCoord in
                            if oldCoord.0 == coord.0 && oldCoord.1 == coord.1 {
//                                print("removing \(oldCoord)")
                                return true
                            }
                            return false
                        }
                        let newCoord = (coord.0, newXCoord)
//                        print("adding \(newCoord)")
                        coords.append(newCoord)
//                        print("coords: \(coords)")
//                        print((grid as Array<Array<CustomStringConvertible>>).gridDescription.replacingOccurrences(of: "true", with: "#").replacingOccurrences(of: "false", with: "."))
                    }
                } else { // horizontal fold
                    if fold.1 < coord.0 {
                        let newYCoord = coord.0 - 2 * (coord.0 - fold.1)
                        grid[newYCoord][coord.1] = true
                        grid[coord.0][coord.1] = false
                        coords.removeAll { oldCoord in
                            if oldCoord.0 == coord.0 && oldCoord.1 == coord.1 {
//                                print("removing \(oldCoord)")
                                return true
                            }
                            return false
                        }
                        let newCoord = (newYCoord, coord.1)
//                        print("adding \(newCoord)")
                        coords.append(newCoord)
//                        print("coords: \(coords)")
//                        print((grid as Array<Array<CustomStringConvertible>>).gridDescription.replacingOccurrences(of: "true", with: "#").replacingOccurrences(of: "false", with: "."))
                    }
                }
            }
        }

        for fold in folds {
            performFold(fold: fold)
        }

        let gridAboveLastHorizontalFold = Array(grid[0..<folds.last(where: { fold in
            fold.0 == "y"
        })!.1])

        let gridLeftofLastVerticalFold = gridAboveLastHorizontalFold.reduce(into: [[Bool]]()) { partialResult, nextRow in
            partialResult.append(Array(nextRow[0..<folds.last(where: { fold in
                fold.0 == "x"
            })!.1]))
        }

        print((gridLeftofLastVerticalFold as Array<Array<CustomStringConvertible>>).gridDescription.replacingOccurrences(of: "true", with: "#").replacingOccurrences(of: "false", with: "."))

        return -1
    }
}
