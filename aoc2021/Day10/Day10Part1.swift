//
//  Day10Part1.swift
//  aoc2021
//
//  Created by Andrew McKnight on Dec 5, 2021.
//

import Foundation

enum Delimiter: String {
    case openParen = "("
    case closeParen = ")"
    case openSquare = "["
    case closeSquare = "]"
    case openCurly = "{"
    case closeCurly = "}"
    case openAngle = "<"
    case closeAngle = ">"
    var score: Int {
        switch self {
        case .closeParen: return 3
        case .closeSquare: return 57
        case .closeCurly: return 1197
        case .closeAngle: return 25137
        default: return 0
        }
    }
    var isOpener: Bool {
        switch self {
        case .openParen, .openSquare, .openCurly, .openAngle: return true
        default: return false
        }
    }
    func closes(opener: Delimiter) -> Bool {
        switch self {
        case .closeParen: return opener == .openParen
        case .closeSquare: return opener == .openSquare
        case .closeCurly: return opener == .openCurly
        case .closeAngle: return opener == .openAngle
        default: return false
        }
    }
}

extension String {
    var firstIllegalToken: Delimiter? {
        var stack = [Delimiter]()
        for c in self {
            let delim = Delimiter(rawValue: String(c))!
            if delim.isOpener {
                stack.append(delim)
            } else {
                if delim.closes(opener: stack.last!) {
                    let _ = stack.popLast()
                } else {
                    return delim
                }
            }
        }
        return nil
    }

    var score: Int {
        firstIllegalToken?.score ?? 0
    }
}

public extension Day10 {
    var part1: Int {
        rawValue.lines.reduce(0) { result, next in
            result + next.score
        }
    }
}
