//
//  Day15Part2.swift
//  aoc2021
//
//  Created by Andrew McKnight on Dec 5, 2021.
//

import aocHelpers
import Foundation

public extension Day15 {
    var part2: Int {
        let grid = rawValue.intGrid

        var biggrid = [[Int]]()
        for row in 0..<grid.count {
            let row = grid[row]
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

        // find the path... needs djikstra or a*

//        for(int i=0;i<n-1;i++){ //loop n-1 times
//                 int u; //u is the vertex to be selected
//                 int min=inf; //Make the initial minimum value>max, so that the vertices with a distance of max can also be added to S
//                for(int j=0;j<n;j++){
//                     if((!S[j])&&dist[j]<min){ //Find the vertex u with the smallest distance S
//                        min=dist[j];
//                        u=j;
//                    }
//                }
//                 S[u]=1; //Set its flag to 1
//                 for(int k=0;k<n;k++){ //Adjust the distance value of the point without adding S
//                    if((!S[k])&&dist[k]>dist[u]+cost[u][k]){
//                        dist[k]=dist[u]+cost[u][k];
//                         pre[k]=u; //If the distance of k is reduced by u, then modify the predecessor of k to u
//                    }
//                }
//            }

        let maximum = biggrid.flattened
        for i in 0..<biggrid.count - 1 {
            var min = 10
            for j in 0..<biggrid[i].count {
                let test = biggrid[i][j]

            }
        }

        return biggrid.last!.last!
    }
}
