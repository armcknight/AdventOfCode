//
//  Day15Part2.swift
//  aoc2021
//
//  Created by Andrew McKnight on Dec 5, 2021.
//

import SwiftArmcknight
import Foundation

public extension Day15 {
    var part2: Int {
        let grid = rawValue.intGrid

        var nodes = Array<Node<Int>>()
        var biggrid = [[Int]]()
        for rowIdx in 0..<grid.count {
            let row = grid[rowIdx]
            var bigrow = row
            for i in 1..<5 {
                let repeated = row.map { val -> Int in
                    let inc = val + i
                    if inc < 10 { return inc }
                    else { return inc - 10 + 1 }
                }
                bigrow.append(contentsOf: repeated)
            }
            biggrid.append(bigrow)
            if rowIdx == 0 {
                nodes = (0..<row.count).map { .init(value: $0, index: $0) }
            }
        }
        var newrows = [[Int]]()
        for i in 1..<5 {
            for row in 0..<biggrid.count {
                let bigrow = biggrid[row]
                let nextrow = bigrow.map { val -> Int in
                    let inc = val + i
                    if inc < 10 { return inc }
                    else { return inc - 10 + 1 } }
                newrows.append(nextrow)
            }
        }
        biggrid.append(contentsOf: newrows)

        print((biggrid as Array<Array<CustomStringConvertible>>).gridDescription)

        biggrid[0][0] = 0

        typealias GraphType = AdjacencyMatrixGraph<DirectedEdge<Node<Int>, Int>>
        let am: GraphType = .init(adjacencyMatrix: biggrid, nodes: nodes)

        // find the path... needs bfs, or djikstra or a*

        return biggrid.last!.last!
    }
}
