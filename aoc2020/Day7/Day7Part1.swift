//
//  Day7Part1.swift
//  aoc2020
//
//  Created by Andrew McKnight on Dec 18, 2020.
//

import aocHelpers
import Foundation

struct Rule {
    var from: String
    var to: String? = nil
    var amount: Int = 0
}

func buildRuleset(string: String) -> [Rule] {
    let containerRegex = #"^(.*) bags contain (.*)\.$"#
    let containeeRegex = #"^\s?(\d*) (.*) bags?$"#
    return string.split(separator: "\n").map({ line -> [Rule] in
        var rules = [Rule]()
        try! String(line).enumerateMatches(with: containerRegex) { (result) in
            let container = String(line[Range(result!.range(at: 1), in: line)!])
            let containees = String(line[Range(result!.range(at: 2), in: line)!])
            if containees == "no other bags" {
                rules.append(Rule(from: container))
            } else {
                rules.append(contentsOf: containees.split(separator: ",").reduce(into: [Rule](), { (result, next) in
                    try! String(next).enumerateMatches(with: containeeRegex, block: { (match) in
                        let containeeCount = Int(next[Range(match!.range(at: 1), in: next)!])!
                        let containee = String(next[Range(match!.range(at: 2), in: next)!])
                        result.append(Rule(from: container, to: containee, amount: containeeCount))
                    })
                }))
            }
        }
        return rules
    }).reduce([Rule]()) { (partial, rules) -> [Rule] in
        partial + rules
    }
}

var cache = NSCache<NSString, NSNumber>()

/// A DFS that finds all the ways a given bag may be contained
func _search(rules: [Rule], rule: Rule, target: String) -> Bool {
    guard rule.to != nil else {
        cache.setObject(NSNumber(booleanLiteral: false), forKey: rule.from as NSString)
        return false
    }
    if rule.to == target {
        cache.setObject(NSNumber(booleanLiteral: true), forKey: rule.from as NSString)
        return true
    }
    else if let cached = cache.object(forKey: rule.from as NSString) {
        return cached.boolValue
    }
    else {
        return rules.filter({ $0.from == rule.to}).reduce(false) { (result, nextRule) -> Bool in
            let nextResult = _search(rules: rules, rule: nextRule, target: target)
            return result || nextResult
        }
    }
}

/// A trampoline into the recursive _search function that looks through each kind of bag to see if there's a way it can contain the target type of bag.
func search(rules: [Rule], target: String) -> Int {
    return rules.filter({ $0.to != nil }).reduce(into: Set<String>(), { (result, next) in
        if _search(rules: rules, rule: next, target: target) {
            result.insert(next.from)
        }
    }).count
}

/// - complexity: slow as shit 😅
public func day7Part1(_ input: String) -> Int {
    let rules = buildRuleset(string: input)
    return search(rules: rules, target: "shiny gold")
}
