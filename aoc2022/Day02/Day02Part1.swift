//
//  Day02Part1.swift
//  aoc2022
//
//  Created by Andrew McKnight on Dec 4, 2022.
//

import Foundation
import SwiftArmcknight

enum RPS {
    enum Move {
        case rock
        case paper
        case scissors

        var score: Int {
            switch self {
            case .rock: return 1
            case .paper: return 2
            case .scissors: return 3
            }
        }
    }

    enum Result {
        case win
        case lose
        case draw

        var score: Int {
            switch self {
            case .draw: return 3
            case .lose: return 0
            case .win: return 6
            }
        }
    }

    private static func outcome(a: Move, b: Move) -> Result {
        switch a {
        case .rock: switch b {
        case .rock: return .draw
        case .paper: return .lose
        case .scissors: return .win
        }
        case .paper: switch b {
        case .rock: return .win
        case .paper: return .draw
        case .scissors: return .lose
        }
        case .scissors: switch b {
        case .rock: return .lose
        case .paper: return .win
        case .scissors: return .draw
        }
        }
    }

    static func score(a: Move, b: Move) -> Int {
        return a.score + outcome(a: a, b: b).score
    }
}

public extension Day02 {
    private func rps(name: String) -> RPS.Move? {
        switch name {
        case "A", "X": return .rock
        case "B", "Y": return .paper
        case "C", "Z": return .scissors
        default: return nil
        }
    }

    var part1: Int {
        rawValue.pairs.map { (them: rps(name: $0.0)!, me: rps(name: $0.1)!) }.reduce(into: 0) { partialResult, round in
            partialResult += RPS.score(a: round.me, b: round.them)
        }
    }
}
