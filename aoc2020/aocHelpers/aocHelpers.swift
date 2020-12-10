//
//  aocHelpers.swift
//  aocHelpers
//
//  Created by Andrew McKnight on 12/9/20.
//

import Foundation

public extension String {
    var stringLines: [String] {
        return split(separator: "\n").map({String($0)})
    }

    var integers: [Int] {
        return stringLines.map({Int($0)!})
    }
}
