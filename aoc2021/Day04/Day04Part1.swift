//
//  Day04Part1.swift
//  aoc2021
//
//  Created by Andrew McKnight on Nov 30, 2021.
//

import Foundation

// return if the board is a winner
func isWin(board: [[(Int, Bool)]], row: Int, col: Int) -> Bool {
    // rows
    board[row].reduce(true, { (result, col) -> Bool in
        result && col.1
    })
        ||
    (0..<5).reduce(true, { (result, row) -> Bool in
        result && board[row][col].1
    })
}

// score is sum of all unmarked numbers
func score(board: [[(Int, Bool)]]) -> Int {
    board.reduce(0) { (result, row) -> Int in
        result + row.reduce(0, { (rowResult, col) -> Int in
            rowResult + (col.1 ? 0 : col.0)
        })
    }
}

func parseBoard(board: [String]) -> [[(Int, Bool)]] {
    board.reduce([[(Int, Bool)]]()) { partialResult, line in
        partialResult + [line.components(separatedBy: .whitespaces).filter { $0 != "" }.map({
            (Int($0)!, false)
        })]
    }
}

func parseBoards(boards: [[String]]) -> [[[(Int, Bool)]]] {
    boards.map { boardDesc -> [[(Int, Bool)]] in
        parseBoard(board: boardDesc)
    }
}

public extension Day04 {
    var part1: Int {
        let parts = rawValue.components(separatedBy: "\n\n")
        
        let calls = parts.first!.split(separator: ",").map { $0.integerValue }
        let boardLines = parts[1..<parts.count].map { $0.components(separatedBy: "\n") }
        var boards = parseBoards(boards: boardLines)
        
        for callIdx in 0..<calls.count {
            let call = calls[callIdx]
            for boardIdx in 0..<boards.count {
                for rowIdx in 0..<boards[boardIdx].count {
                    for colIdx in 0..<boards[boardIdx][rowIdx].count {
                        if boards[boardIdx][rowIdx][colIdx].0 == call {
                            boards[boardIdx][rowIdx][colIdx].1 = true
                            
                            if isWin(board: boards[boardIdx], row: rowIdx, col: colIdx) {
                                return score(board: boards[boardIdx]) * call
                            }
                        }
                    }
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
}
