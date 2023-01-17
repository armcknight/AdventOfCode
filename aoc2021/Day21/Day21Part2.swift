//
//  Day21Part2.swift
//  aoc2021
//
//  Created by Andrew McKnight on Dec 5, 2021.
//

import Foundation
import RegularExpressionDecoder

public extension Day21 {
    var part2: Int {
        let pattern: RegularExpressionPattern<Player, Player.CodingKeys> = #"Player (?<.number>\d*) starting position: (?<.position>\d*)"#
        let players = try! RegularExpressionDecoder<Player>(pattern: pattern).decode([Player].self, from: rawValue)

        let a = players.first!
        let b = players.last!

        func roll(value: Int, player: inout Player) {
            player.position += value
            while player.position > 10 {
                player.position -= 10
            }
            player.score += player.position
        }
        func play(player: Player, otherPlayer: Player) {
            // three rolls per turn
            for _ in 0..<3 {
                // split the universe on each roll
                for value in 1...3 {
                    var p = player
                    roll(value: value, player: &p)
                }
            }
            if player.score >= 21 {
                if player.number == 1 {
                    Player.aWins += 1
                } else {
                    Player.bWins += 1
                }
                return
            } else {
                 play(player: otherPlayer, otherPlayer: player)
            }
        }

        play(player: a, otherPlayer: b)

        return max(Player.aWins, Player.bWins)
    }
}
