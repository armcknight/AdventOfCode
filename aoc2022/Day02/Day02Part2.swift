//
//  Day02Part2.swift
//  aoc2022
//
//  Created by Andrew McKnight on Dec 4, 2022.
//

import aocHelpers
import Foundation

public extension Day02 {
    private func rps(name: String) -> RPS.Move? {
        switch name {
        case "A": return .rock
        case "B": return .paper
        case "C": return .scissors
        default: return nil
        }
    }

    private func outcome(name: String) -> RPS.Result? {
        switch name {
        case "X": return .lose
        case "Y": return .draw
        case "Z": return .win
        default: return nil
        }
    }

    private func needed(them: RPS.Move, outcome: RPS.Result) -> RPS.Move {
        switch them {
        case .rock: switch outcome {
        case .win: return .paper
        case .lose: return .scissors
        case .draw: return .rock
        }
        case .scissors: switch outcome {
        case .win: return .rock
        case .lose: return .paper
        case .draw: return .scissors
        }
        case .paper: switch outcome {
        case .win: return .scissors
        case .lose: return .rock
        case .draw: return .paper
        }
        }
    }

    var part2: Int {
        rawValue.pairs.map { (them: rps(name: $0.0)!, outcome: outcome(name: $0.1)!) }.reduce(into: 0) { partialResult, round in
            partialResult += needed(them: round.them, outcome: round.outcome).score + round.outcome.score
        }
    }
}
