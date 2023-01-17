//
//  Day04Part2.swift
//  aoc2021
//
//  Created by Andrew McKnight on Nov 30, 2021.
//

import Foundation

func printBoard(boards: [[[(Int, Bool)]]], boardIdx: Int) {
    print("\nboard \(boardIdx)")
    print(boards[boardIdx].map{ (row) -> String in
        row.map { (item) -> String in
            "\(item.0 < 10 ? " \(item.0)" : "\(item.0)")\(item.1 ? "*" : " ")"
        }.joined(separator: " ")
    }.joined(separator: "\n"))
}

/// for a given call, play the specified board and returns the score if it won, or `nil` otherwise
func playBoard(boards: inout [[[(Int, Bool)]]], boardIdx: Int, call: Int) -> Int? {
//    defer { printBoard(boards: boards, boardIdx: boardIdx) }
    for rowIdx in 0..<boards[boardIdx].count {
        for colIdx in 0..<boards[boardIdx][rowIdx].count {
            if boards[boardIdx][rowIdx][colIdx].0 == call {
                boards[boardIdx][rowIdx][colIdx].1 = true

                if isWin(board: boards[boardIdx], row: rowIdx, col: colIdx) {
                    return score(board: boards[boardIdx]) * call
                } else {
                    return nil
                }
            }
        }
    }
    return nil
}

public extension Day04 {
    var part2: Int {
        let parts = rawValue.components(separatedBy: "\n\n")
        
        let calls = parts.first!.split(separator: ",").map { $0.integerValue }
        let boardLines = parts[1..<parts.count].map { $0.components(separatedBy: "\n") }
        var boards = parseBoards(boards: boardLines)
        
        for call in calls {
            //        print("\ncall: \(call)")
            var boardIdx = boards.count - 1
            while (boardIdx >= 0) {
                if let winningScore = playBoard(boards: &boards, boardIdx: boardIdx, call: call) {
                    boards.remove(at: boardIdx)
                    //                print("\nremoved board \(boardIdx)")
                    
                    if boards.count == 0 {
                        return winningScore
                    }
                }
                boardIdx -= 1
            }
        }
        
        return -1
    }
}
