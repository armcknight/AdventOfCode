//
//  Day04Part1.swift
//  aoc2021
//
//  Created by Andrew McKnight on Nov 30, 2021.
//

import aocHelpers
import Foundation

// return if the board is a winner
func isWin(board: [[(Int, Bool)]]) -> Bool {
    // rows
    for i in (0..<5) {
        let row = board[i]
        if row.reduce(true, { (result, col) -> Bool in
            result && col.1
        }) {
            return true
        }
    }

    // cols
    for col in 0..<5 {
        if (0..<5).reduce(true, { (result, row) -> Bool in
            result && board[row][col].1
        }) {
            return true
        }
    }

    return false
}

// score is sum of all unmarked numbers
func score(board: [[(Int, Bool)]]) -> Int {
    board.reduce(0) { (result, row) -> Int in
        result + row.reduce(0, { (rowResult, col) -> Int in
            rowResult + (col.1 ? 0 : col.0)
        })
    }
}

public func day04Part1(_ input: String) -> Int {
    let lines = input.lines

    let boardDefs = Array(lines[1..<lines.count])
    var boards = [[[(Int, Bool)]]]()
    stride(from: 0, to: boardDefs.count, by: 5).forEach { (i) in
        var board = [[(Int, Bool)]]()
        for j in 0..<5 {
            board.append(boardDefs[i+j].split(separator: " ").map({ (col) -> (Int, Bool) in
                (col.integerValue, false)
            }))
        }
        boards.append(board)
    }

    let calls = lines.first!.split(separator: ",").map { $0.integerValue }
    for callIdx in 0..<calls.count {
        let call = calls[callIdx]
        for boardIdx in 0..<boards.count {
            for rowIdx in 0..<boards[boardIdx].count {
                for colIdx in 0..<boards[boardIdx][rowIdx].count {
                    if boards[boardIdx][rowIdx][colIdx].0 == call {
                        boards[boardIdx][rowIdx][colIdx].1 = true
                    }
                }
            }

            if isWin(board: boards[boardIdx]) {
                return score(board: boards[boardIdx]) * call
            }
        }
    }

    var boardIdx = 0
    boards.forEach { (board) in
        print("board \(boardIdx): \(board)")
        boardIdx += 1
    }

    return -1
}
