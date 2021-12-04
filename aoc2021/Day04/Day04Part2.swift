//
//  Day04Part2.swift
//  aoc2021
//
//  Created by Andrew McKnight on Nov 30, 2021.
//

import aocHelpers
import Foundation

public func day04Part2(_ input: String) -> Int {
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
        }

        let testBoards = boards
        for i in (0..<testBoards.count).reversed() {
            if isWin(board: testBoards[i]) {
                if boards.count == 1 {
                    return score(board: testBoards[i]) * call
                } else {
                    boards.remove(at: i)
                }
            }
        }
    }

    return -1
}
