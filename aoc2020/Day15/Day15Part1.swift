//
//  Day15Part1.swift
//  aoc2020
//
//  Created by Andrew McKnight on Dec 18, 2020.
//

import aocHelpers
import Foundation

func compute(turns: Int, input: String) -> Int {
    var numbersSpokenOnTurns = [Int: (Int, Int?)]()
    var turn = 1
    var lastNumberSpoken = -1
    input.split(separator: ",")
        .map({ $0.integerValue })
        .forEach {
            numbersSpokenOnTurns[$0] = (turn, nil)
            lastNumberSpoken = $0
            turn += 1
        }
    while turn <= turns {
        let toSpeak: Int
        if let spokenOnTurns = numbersSpokenOnTurns[lastNumberSpoken], let mostRecent = spokenOnTurns.1 {
            toSpeak = spokenOnTurns.0 - mostRecent
        } else {
            toSpeak = 0
        }
        if let _ = numbersSpokenOnTurns[toSpeak] {
            let priorTurn = numbersSpokenOnTurns[toSpeak]?.0
            numbersSpokenOnTurns[toSpeak]?.1 = priorTurn
            numbersSpokenOnTurns[toSpeak]?.0 = turn
        } else {
            numbersSpokenOnTurns[toSpeak] = (turn, nil)
        }
//        print("turn: \(turn); number: \(toSpeak); numbersSpokenOnTurns: \(numbersSpokenOnTurns)")
        lastNumberSpoken = toSpeak
        turn += 1
    }

    return lastNumberSpoken

}

public func day15Part1(_ input: String) -> Int {
    return compute(turns: 2020, input: input)
}
