//
//  Day19Part1.swift
//  aoc2020
//
//  Created by Andrew McKnight on Dec 18, 2020.
//

import aocHelpers
import Foundation

enum RuleValue: CustomStringConvertible {
    case rule(id: Int)
    case value(matching: String)

    var description: String {
        switch self {
        case .rule(let id): return String(id)
        case .value(let value): return "\"\(value)\""
        }
    }
}

func buildRuleset(lines: [String]) -> [Int: [[RuleValue]]] {
    return lines.reduce(into: [Int: [[RuleValue]]](), { (result, next) in
        let splitRulesFromID = next.split(separator: ":")
        let id = String(splitRulesFromID.first!).integerValue
        let rules = splitRulesFromID.last!.split(separator: " ").split(separator: "|").map { (nextRules) -> [RuleValue] in
            if nextRules.filter({ (string) -> Bool in
                try! String(string).matches(#"".*""#)
            }).count > 0 {
                return [.value(matching: String(nextRules.first!).replacingOccurrences(of: "\"", with: ""))]
            } else {
                return nextRules.map { (nextRule) -> RuleValue in
                    return .rule(id: String(nextRule).integerValue)
                }
            }
        }
        result[id] = rules
    })
}

func printRec(_ message: String, _ depth: Int, _ ruleIDs: [Int]) {
    print("\(String(repeating: "*", count: depth)) \(message) in \(ruleIDs)")
}

func testRuleValue(rules: [Int: [[RuleValue]]], ruleValue: RuleValue, message: String, messageIndex: inout Int, recursionDepth: Int, ruleIDs: [Int]) -> Bool {
//    printRec("test ruleValue: \(ruleValue) @ \(messageIndex)", recursionDepth, ruleIDs)
    switch ruleValue {
    case .rule(let ruleID):
        return testRule(rules: rules, ruleID: ruleID, message: message, messageIndex: &messageIndex, recursionDepth: recursionDepth + 1, ruleIDs: ruleIDs + [ruleID])
    case .value(let matching):
        guard messageIndex < message.count else {
            printRec("finished processing message", recursionDepth, ruleIDs)
            return true
        }
        let query = String(message[message.index(message.startIndex, offsetBy: messageIndex)])
        if matching == query {
            messageIndex += 1
            printRec("\(query) == \(matching)", recursionDepth, ruleIDs)
            return true
        } else {
            printRec("\(query) != \(matching)", recursionDepth, ruleIDs)
        }
    }
    return false
}

func testRuleSet(rules: [Int: [[RuleValue]]], message: String, messageIndex: inout Int, ruleSet: [RuleValue], recursionDepth: Int, ruleIDs: [Int]) -> Bool {
//    printRec("test ruleset \(ruleSet.map { "\(String(describing: $0))"}) @ \(messageIndex)", recursionDepth, ruleIDs)
    return ruleSet.reduce(true) { (result, nextRuleValue) -> Bool in
        result && testRuleValue(rules: rules, ruleValue: nextRuleValue, message: message, messageIndex: &messageIndex, recursionDepth: recursionDepth, ruleIDs: ruleIDs)
    }
}

func testRule(rules: [Int: [[RuleValue]]], ruleID: Int, message: String, messageIndex: inout Int, recursionDepth: Int, ruleIDs: [Int]) -> Bool {
//    printRec("test rule \(ruleID) @ \(messageIndex)", recursionDepth, ruleIDs)
    let originalMessageIndex = messageIndex
    for ruleSet in rules[ruleID]! {
        let ruleSetMatched = testRuleSet(rules: rules, message: message, messageIndex: &messageIndex, ruleSet: ruleSet, recursionDepth: recursionDepth, ruleIDs: ruleIDs)
        if ruleSetMatched {
            return true
        } else {
            messageIndex = originalMessageIndex
        }
    }
    return false

}

public extension Day19 {
    var part1: Int {
        let inputParts = rawValue.replacingOccurrences(of: "\n\n", with: "\n;\n").split(separator: "\n").split(separator: ";").map { (next) -> [String] in
            next.map { String($0) }
        }
        let rules = buildRuleset(lines: inputParts.first!)
        
        print(rules)
        
        return inputParts.last!.filter({
            var messageIndex = 0
            print("################################################################")
            print("testing message: \($0)")
            let matched = testRule(rules: rules, ruleID: 0, message: $0, messageIndex: &messageIndex, recursionDepth: 1, ruleIDs: [0])
            if messageIndex < $0.count {
                print("message not fully read after matching rule")
                return false
            }
            if matched {
                print("\($0) matches")
            } else {
                print("\($0) does not match")
            }
            return matched
        }).count
    }
}
