//
//  Day11Part2.swift
//  aoc2022
//
//  Created by Andrew McKnight on Dec 4, 2022.
//

import aocHelpers
import Foundation

public extension Day11 {
    var part2: Int {
        // This was my last attempt before looking for hints. I knew the worry levels needed to be reduced but my number theory wasn't correct. I thought that if the worry level was congruent to 0 mod the test value, i could just divide it and keep the quotient. But, it needs to be congruent to 0 mod all the test values, so we can take the mod of the product of them all and store that value going forwards.
        func playGameBad(monkeys: [Monkey], rounds: Int) -> Int {
            for round in 0..<rounds {
                //            print("round: \(round)")
                for (i, monkey) in monkeys.enumerated() {
                    //                print("Monkey \(i)")
                    monkey.itemWorryLevels.forEach { itemWorryLevel in
                        //                    print("Monkey inspects an item with a worry level of \(itemWorryLevel).")
                        let worryLevel = monkey.newWorryLevel(oldWorryLevel: itemWorryLevel)
                        //                    print("Monkey gets bored with item. Worry level is divided by 3 to \(worryLevel).")
                        let monkeyIdx = worryLevel % monkey.testValue == 0 ? monkey.testTrueMonkeyIdx : monkey.testFalseMonkeyIdx
                        if worryLevel % monkey.testValue == 0 {

                            //                        print("Current worry level is divisible by \(monkey.testValue).")
                        } else {
                            //                        print("Current worry level is not divisible by \(monkey.testValue).")
                        }
                        //                    print("Item with worry level \(worryLevel) is thrown to monkey \(monkeyIdx).")
                        monkeys[monkeyIdx].itemWorryLevels.append(worryLevel)
                        monkey.itemsInspected += 1
                    }
                    monkey.itemWorryLevels.removeAll()
                }
            }
        }

        func playGame(monkeys: [Monkey], rounds: Int) -> Int {
            let divisor = monkeys.reduce(1) { partialResult, monkey in
                partialResult * monkey.testValue
            }
            for round in 0..<rounds {
                //            print("round: \(round)")
                for (i, monkey) in monkeys.enumerated() {
                    //                print("Monkey \(i)")
                    monkey.itemWorryLevels.forEach { itemWorryLevel in
                        //                    print("Monkey inspects an item with a worry level of \(itemWorryLevel).")
                        let worryLevel = monkey.newWorryLevel(oldWorryLevel: itemWorryLevel) % divisor
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
        return playGame(monkeys: monkeys, rounds: 10_000)
    }
}
