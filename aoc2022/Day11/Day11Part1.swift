//
//  Day11Part1.swift
//  aoc2022
//
//  Created by Andrew McKnight on Dec 4, 2022.
//

import aocHelpers
import Foundation
import PippinLibrary

public extension Day11 {
    enum OperationArg {
        case old
        case value(Int)

        init(def: String) {
            if def == "old" {
                self = .old
            } else {
                self = .value(Int(def)!)
            }
        }
    }
    enum Operation {
        case add
        case multiply

        init(def: String) {
            if (def == "+") {
                self = .add
            } else {
                self = .multiply
            }
        }
    }
    class Monkey {
        var itemWorryLevels: [Int]
        var operationArg1: OperationArg
        var operationArg2: OperationArg
        var operation: Operation
        var testValue: Int
        var itemsInspected: Int = 0
        var testTrueMonkeyIdx: Int
        var testFalseMonkeyIdx: Int

        init(itemWorryLevels: [Int], operationArg1: OperationArg, operationArg2: OperationArg, operation: Operation, testValue: Int, itemsInspected: Int = 0, testTrueMonkeyIdx: Int, testFalseMonkeyIdx: Int) {
            self.itemWorryLevels = itemWorryLevels
            self.operationArg1 = operationArg1
            self.operationArg2 = operationArg2
            self.operation = operation
            self.testValue = testValue
            self.itemsInspected = itemsInspected
            self.testTrueMonkeyIdx = testTrueMonkeyIdx
            self.testFalseMonkeyIdx = testFalseMonkeyIdx
        }

        func newWorryLevel(oldWorryLevel: Int) -> Int {
            var a: Int
            switch operationArg1 {
            case .value(let value): a = value
            case .old: a = oldWorryLevel
            }

            var b: Int
            switch operationArg2 {
            case .value(let value): b = value
            case .old: b = oldWorryLevel
            }

            switch operation {
            case .multiply:
                let result = a * b
//                switch operationArg2 {
//                case .value(_): print("Worry level is multiplied by \(b) to \(result).")
//                case .old: print("Worry level increases by \(b) to \(result).")
//                }
                return result
            case .add:
                let result = a + b
//                print("Worry level increases by \(b) to \(result).")
                return result
            }
        }
    }

    func parseMonkeys(input: String) -> [Monkey] {
        input.components(separatedBy: "\n\n").map { $0.lines }.map { def -> Monkey in
//            print("def: \(def)")
            let operationParts = def[2].replacingOccurrences(of: "Operation: new = ", with: "").components(separatedBy: " ")
            return Monkey(
                itemWorryLevels: def[1].replacingOccurrences(of: "Starting items: ", with: "").components(separatedBy: ", ").map { worryLevel -> Int in
                    Int(worryLevel)!
                },
                operationArg1: OperationArg(def: operationParts[0]),
                operationArg2: OperationArg(def: operationParts[2]),
                operation: Operation(def: operationParts[1]),
                testValue: Int(def[3].replacingOccurrences(of: "Test: divisible by ", with: ""))!,
                testTrueMonkeyIdx: Int(def[4].replacingOccurrences(of: "If true: throw to monkey ", with: ""))!,
                testFalseMonkeyIdx: Int(def[5].replacingOccurrences(of: "If false: throw to monkey ", with: ""))!
            )
        }
    }

    func foo(monkeys: [Monkey], rounds: Int) -> Int {
        let divisor = monkeys.reduce(1) { partialResult, monkey in
            partialResult * monkey.testValue
        }
        for round in 0..<rounds {
//            print("round: \(round)")
            for (i, monkey) in monkeys.enumerated() {
//                print("Monkey \(i)")
                monkey.itemWorryLevels.forEach { itemWorryLevel in
//                    print("Monkey inspects an item with a worry level of \(itemWorryLevel).")
                    let worryLevel = monkey.newWorryLevel(oldWorryLevel: itemWorryLevel) / 3
//                    print("Monkey gets bored with item. Worry level is divided by 3 to \(worryLevel).")
                    let monkeyIdx = worryLevel % monkey.testValue == 0 ? monkey.testTrueMonkeyIdx : monkey.testFalseMonkeyIdx
//                    if worryLevel % monkey.testValue == 0 {
//                        print("Current worry level is divisible by \(monkey.testValue).")
//                    } else {
//                        print("Current worry level is not divisible by \(monkey.testValue).")
//                    }
//                    print("Item with worry level \(worryLevel) is thrown to monkey \(monkeyIdx).")
                    monkeys[monkeyIdx].itemWorryLevels.append(worryLevel)
                    monkey.itemsInspected += 1
                }
                monkey.itemWorryLevels.removeAll()
            }
        }

        return monkeys.sorted(by: { a, b in
            a.itemsInspected > b.itemsInspected
        })[0...1].reduce(Int(1)) { partialResult, monkey in
            partialResult * monkey.itemsInspected
        }
    }

    var part1: Int {
        func foo(monkeys: [Monkey], rounds: Int) -> Int {
            let divisor = monkeys.reduce(1) { partialResult, monkey in
                partialResult * monkey.testValue
            }
            for round in 0..<rounds {
    //            print("round: \(round)")
                for (i, monkey) in monkeys.enumerated() {
    //                print("Monkey \(i)")
                    monkey.itemWorryLevels.forEach { itemWorryLevel in
    //                    print("Monkey inspects an item with a worry level of \(itemWorryLevel).")
                        let worryLevel = monkey.newWorryLevel(oldWorryLevel: itemWorryLevel) / 3
    //                    print("Monkey gets bored with item. Worry level is divided by 3 to \(worryLevel).")
                        let monkeyIdx = worryLevel % monkey.testValue == 0 ? monkey.testTrueMonkeyIdx : monkey.testFalseMonkeyIdx
    //                    if worryLevel % monkey.testValue == 0 {
    //                        print("Current worry level is divisible by \(monkey.testValue).")
    //                    } else {
    //                        print("Current worry level is not divisible by \(monkey.testValue).")
    //                    }
    //                    print("Item with worry level \(worryLevel) is thrown to monkey \(monkeyIdx).")
                        monkeys[monkeyIdx].itemWorryLevels.append(worryLevel)
                        monkey.itemsInspected += 1
                    }
                    monkey.itemWorryLevels.removeAll()
                }
            }

            return monkeys.sorted(by: { a, b in
                a.itemsInspected > b.itemsInspected
            })[0...1].reduce(Int(1)) { partialResult, monkey in
                partialResult * monkey.itemsInspected
            }
        }

        let monkeys = parseMonkeys(input: rawValue)
        return foo(monkeys: monkeys, rounds: 20)
    }
}
