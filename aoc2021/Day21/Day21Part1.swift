//
//  Day21Part1.swift
//  aoc2021
//
//  Created by Andrew McKnight on Dec 5, 2021.
//

import Foundation

public extension Day21 {
    struct Player: Decodable {
        enum CodingKeys: String, CodingKey {
            case number
            case position
        }
        let number: Int
        var position: Int
        var score: Int = 0
        static var aWins: Int = 0
        static var bWins: Int = 0
    }
    var part1: Int {
        var players = [Player]()
        try! rawValue.enumerateMatches(with: #"Player (\d*) starting position: (\d*)"#) { (result) in
            players.append(Player(number: result[1, rawValue].integerValue, position: result[2, rawValue].integerValue))
        }
        var a = players.first!
        var b = players.last!

        var numberOfRolls = 0
        var dieRoll = 1;

        func play(player: inout Player) {
            for _ in 0..<3 {
                player.position += dieRoll
                while player.position > 10 {
                    player.position -= 10
                }
//                print("player \(player.number) rolled \(dieRoll) and moved to spot \(player.position)")
                dieRoll = max((dieRoll + 1) % 101, 1)
                numberOfRolls += 1
            }
            player.score += player.position
//            print("player \(player.number) ended on spot \(player.position) and has score \(player.score)")
        }

        while true {
            play(player: &a)
            if a.score >= 1000 {
                return numberOfRolls * b.score
            }

            play(player: &b)
            if b.score >= 1000 {
                return numberOfRolls * a.score
            }
        }
    }
}
