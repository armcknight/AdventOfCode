//
//  Day07Part2.swift
//  aoc2023
//
//  Created by Andrew McKnight on Dec 6, 2023.
//

import Foundation
import SwiftArmcknight

let cards2 = ["A", "K", "Q", "T", "9", "8", "7", "6", "5", "4", "3", "2", "J"]

func compareHands(_ a: (hand: String, type: Hand), _ b: (hand: String, type: Hand)) -> Bool {
if a.type.rank == b.type.rank {
    var i = 0
    var aCard = a.hand[a.hand.startIndex]
    var bCard = b.hand[b.hand.startIndex]
    while aCard == bCard {
        i += 1
        aCard = a.hand[a.hand.index(a.hand.startIndex, offsetBy: i)]
        bCard = b.hand[b.hand.index(b.hand.startIndex, offsetBy: i)]
    }
//    print("returning cards.firstIndex(of: String(aCard))! < cards.firstIndex(of: String(bCard))! as \(cards2.firstIndex(of: String(aCard))! < cards2.firstIndex(of: String(bCard))!)")
    return cards2.firstIndex(of: String(aCard))! < cards2.firstIndex(of: String(bCard))!
} else {
//    print("returning a.type.rank > b.type.rank as \(a.type.rank > b.type.rank)")
    return a.type.rank > b.type.rank
}
}

extension String {
    var hand2: Hand {
        func hand(withJokersAs sub: String) -> Hand {
            let resolvedHand = self.replacingOccurrences(of: "J", with: sub)
            let sorted = resolvedHand.map { String($0) }.sorted(by: { a, b in
                cards2.firstIndex(of: a)! > cards2.firstIndex(of: b)!
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

            return .highCard(cards2.firstIndex(of: sorted[0])!)
        }
        return cards2.dropLast().map({($0, hand(withJokersAs: $0))}).sorted(by: { a, b in
            compareHands(a, b)
        }).first!.1
    }
}

public extension Day07 {
    var part2: Int {
        rawValue.lines.map({ handBidCombo -> (hand: String, bid: Int) in
            let parts = handBidCombo.split(separator: " ")
            return (hand: String(parts[0]), bid: parts[1].integerValue)
        }).sorted { (a: (hand: String, bid: Int), b: (hand: String, bid: Int)) -> Bool in
//            print("comparing a: \(a.hand) and b: \(b.hand)")
            return compareHands((hand: a.hand, type: a.hand.hand2), (hand: b.hand, type: b.hand.hand2))
        }.reversed().enumerated().reduce(0) { partialResult, hand in
//            print("hand: \(hand.element.hand); name: \(hand.element.hand.hand2.name)")
            return partialResult + (hand.offset + 1) * hand.element.bid
        }
    }
}
