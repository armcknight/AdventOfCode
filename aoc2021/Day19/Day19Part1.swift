//
//  Day19Part1.swift
//  aoc2021
//
//  Created by Andrew McKnight on Dec 5, 2021.
//

import Foundation
import QuartzCore

let transformMatrices = ([0, 90, 180, 270] as [CGFloat]).map({i -> [CATransform3D] in
    var transforms = [CATransform3D]()
    for x: CGFloat in [0, 1] {
        for y: CGFloat in [0, 1] {
            for z: CGFloat in [0, 1] {
                transforms.append(CATransform3DMakeRotation(i, x, y, z))
            }
        }
    }
    return transforms
})

public extension Day19 {
    var part1: Int {
        let reports: [[(x: Int, y: Int, z: Int)]] = (rawValue as NSString).components(separatedBy: "\n\n").split(separator: "\n").map { report -> [(x: Int, y: Int, z: Int)] in
            let _ = report.dropFirst()
            return Array<String>(report).map { line -> (x: Int, y: Int, z: Int) in
                let coords = line.split(separator: ",")
                return (String(coords[0]).integerValue, String(coords[1]).integerValue, String(coords[2]).integerValue)
            }
        }

        var scanners = Array<(x: Int, y: Int, z: Int)?>(repeating: nil, count: reports.count)
        for i in 0..<reports.count {
            for j in 0..<reports.count {
                if i != j {
                    // are scanners i and j overlapping?

                    let uniqueBeacons = reports[i].difference(from: reports[j]) { (a, b) -> Bool in
                        // if a and b represent the same location from the two separate scanners

                        // transform b under each type of transformation matrix and compare to a

                        return true // !!!: debug only
                    }

                    if uniqueBeacons.count > 0 {
                        // scanners overlap; triangulate the position
                    }
                }
            }
        }

        return -1
    }
}
