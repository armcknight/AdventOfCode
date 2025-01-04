//
//  Day10Part1.swift
//  aoc2023
//
//  Created by Andrew McKnight on Dec 10, 2023.
//

import Foundation
import SwiftArmcknight

public extension Day10 {
    var part1: Int {
        let grid = rawValue.characterGrid
        let count = grid.count
        var distances = [[Int]](repeating: [Int](repeating: -1, count: count), count: count)
        
        var adjacencyList = [Node<String>: Set<DirectedEdge<Node<String>, Int>>]()
        
        // strategy: iterate through 2d grid, build adjacency list that describes graph, where each node is named "(i,j)" where i = row and j = col in the input grid, perform DFS on graph to find the cycle, count number of edges in cycle, divide by two to find greatest distance from start
        for row in 0..<count {
            for col in 0..<count {
                let spot = grid[row][col]
                
                switch spot {
                    case "|": // is a *vertical pipe* connecting north and south.
                    if row > 0 {
                        distances[row][col] += distances[row - 1][col]
                    }
                    case "-": // is a *horizontal pipe* connecting east and west.
                    if col > 0 {
                        distances[row][col] += distances[row][col - 1]
                    }
                    case "L": // is a *90-degree bend* connecting north and east.
                    if row > 0 && col > 0 {
                        distances[row][col] += distances[row - 1][col - 1]
                    }
                    case "J": // is a *90-degree bend* connecting north and west.
                    if row > 0 && col < count - 1 {
                        distances[row][col] += distances[row - 1][col + 1]
                    }
                    case "7": // is a *90-degree bend* connecting south and west.
                    if row < count - 1 && col < count - 1 {
                        distances[row][col] += distances[row + 1][col + 1]
                    }
                    case "F": // is a *90-degree bend* connecting south and east.
                    if row < count - 1 && col > 0 {
                        distances[row][col] += distances[row + 1][col - 1]
                    }
                    case ".": // is *ground*; there is no pipe in this tile.
                        continue
                    default/*case "S"*/: // is the *starting position* of the animal; there is a pipe on
                        distances[row][col] = 0
                }
            }
        }
        
        return -1
    }
}
