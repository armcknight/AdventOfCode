//
//  Day06Part2.swift
//  aoc2020
//
//  Created by Andrew McKnight on Dec 18, 2020.
//

import aocHelpers
import Foundation

public func day06Part2(_ input: String) -> Int {
    let groups = input.replacingOccurrences(of: "\n\n", with: ";").split(separator: ";")
        return groups.reduce(0) { (partial, next) -> Int in
            let group = next.split(separator: "\n")
            var dict = [String: Int]()
            print("group size: \(group.count)")
            group.forEach {
                for question in $0 {
                    if dict.keys.contains(String(question)) {
                        dict[String(question)]! += 1
                    } else {
                        dict[String(question)] = 1
                    }
                }
            }
            print("dict: \(dict)")
            let filtered = dict.filter { (next) -> Bool in
                return next.value == group.count
            }
            print("count: \(filtered.count)")
            return partial + filtered.count
        }
}
