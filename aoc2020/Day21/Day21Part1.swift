//
//  Day21Part1.swift
//  aoc2020
//
//  Created by Andrew McKnight on Dec 18, 2020.
//

import aocHelpers
import Foundation

struct Food {
    var ingredients: [String]
    var allergens: [String]
}

public extension Day21 {
    var part1: Int {
        let foods = rawValue.lines.map({ line -> Food in
            var allergens = [String]()
            var ingredients = [String]()
            try! String(line).enumerateMatches(with: #"(.*) \(contains (.*)\)"#) { (match) in
                ingredients = match[1, line].split(separator: " ").map { String($0) }
                allergens = match[2, line].split(separator: ",").map { $0.trimmingCharacters(in: .whitespaces)}
            }
            return Food(ingredients: ingredients, allergens: allergens)
        })
        
        
        
        return -1
    }
}
