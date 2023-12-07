//
//  Day07Part1.swift
//  aoc2023
//
//  Created by Andrew McKnight on Dec 6, 2023.
//

import Foundation
import SwiftArmcknight

enum Hand {
    var rank: Int {
        switch self {
        case .fiveKind: 6
        case .fourKind: 5
        case .fullHouse: 4
        case .threeKind: 3
        case .twoPair: 2
        case .pair: 1
        case .highCard(_): 0
        }
    }

    var name: String {
        switch self {
        case .fiveKind: "five of a kind"
        case .fourKind: "four of a kind"
        case .fullHouse: "full house"
        case .threeKind: "three of a kind"
        case .twoPair: "two pairs"
        case .pair: "pair"
        case .highCard(let card): "high card (\(card))"
        }
    }

    case fiveKind
    case fourKind
    case fullHouse
    case threeKind
    case twoPair
    case pair
    case highCard(Int)
}

let cards = ["A", "K", "Q", "J", "T", "9", "8", "7", "6", "5", "4", "3", "2", "J"]

extension String {
    var hand: Hand {
        let sorted = self.map { String($0) }.sorted(by: { a, b in
            cards.firstIndex(of: a)! > cards.firstIndex(of: b)!
        })
        
        var i = 0
        var count = 1
        var card: String
        var counts = [(card: String, count: Int)]()
        while i < sorted.count {
            card = sorted[i]
            if  i < sorted.count - 1 && card == sorted[i + 1] {
                while i < sorted.count - 1 && card == sorted[i + 1] {
                    i += 1
                    count += 1
                }
            }
            counts.append((card, count))
            count = 1
            i += 1
        }

        if counts.count == 1 {
            return .fiveKind
        }
        if counts.filter({ count in
            count.count == 4
        }).count > 0 {
            return .fourKind
        }
        if counts.filter({ count in
            count.count == 3
        }).count > 0 {
            if counts.filter({ count in
                count.count == 2
            }).count > 0 {
                return .fullHouse
            } else {
                return .threeKind
            }
        } 
        let pairs = counts.filter({ count in
            count.count == 2
        })
        if pairs.count == 2 {
            return .twoPair
        } else if pairs.count == 1 {
            return .pair
        }

        return .highCard(cards.firstIndex(of: sorted[0])!)
    }
}

public extension Day07 {
    var part1: Int {
        rawValue.lines.map({ handBidCombo -> (hand: String, bid: Int) in
            let parts = handBidCombo.split(separator: " ")
            return (hand: String(parts[0]), bid: parts[1].integerValue)
        }).sorted { (a: (hand: String, bid: Int), b: (hand: String, bid: Int)) -> Bool in
//            print("comparing a: \(a.hand) and b: \(b.hand)")
            if a.hand.hand.rank == b.hand.hand.rank {
                var i = 0
                var aCard = a.hand[a.hand.startIndex]
                var bCard = b.hand[b.hand.startIndex]
                while aCard == bCard {
                    i += 1
                    aCard = a.hand[a.hand.index(a.hand.startIndex, offsetBy: i)]
                    bCard = b.hand[b.hand.index(b.hand.startIndex, offsetBy: i)]
                }
//                print("returning cards.firstIndex(of: String(aCard))! < cards.firstIndex(of: String(bCard))! as \(cards.firstIndex(of: String(aCard))! < cards.firstIndex(of: String(bCard))!)")
                return cards.firstIndex(of: String(aCard))! < cards.firstIndex(of: String(bCard))!
            } else {
//                print("returning a.hand.hand.rank > b.hand.hand.rank as \(a.hand.hand.rank > b.hand.hand.rank)")
                return a.hand.hand.rank > b.hand.hand.rank
            }
        }.reversed().enumerated().reduce(0) { partialResult, hand in
//            print("hand: \(hand.element.hand); name: \(hand.element.hand.hand.name)")
            return partialResult + (hand.offset + 1) * hand.element.bid
        }
    }
}
