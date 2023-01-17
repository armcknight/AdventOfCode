//
//  Day18Part1.swift
//  aoc2021
//
//  Created by Andrew McKnight on Dec 5, 2021.
//

import Foundation

public extension Day18 {
//    func add(a: [Any], b: [Any]) -> [Any] {
//        return [a, b]
//    }
//    func explode(n: NSArray) -> Bool {
//        let ai = n.indexOfObject(passingTest: { (e, idx, stop) -> Bool in
//            e is NSArray
//        })
//        if ai == NSNotFound { return false }
//        let a = n[ai] as? [Any],
//        let bi = a.firstIndex(where: { (e) -> Bool in
//            e is [Any]
//        }),
//        let b = a[bi] as? [Any],
//        let ci = b.firstIndex(where: { (e) -> Bool in
//            e is [Any]
//        }),
//        let c = b[ci] as? [Any],
//        let di = c.firstIndex(where: { (e) -> Bool in
//            e is [Any]
//        }),
//        let d = c[di] as? [Int] {
//            // the pair's left value is added to the first regular number to the left of the exploding pair (if any),
//            let left = d.first!
//
//            // search for a regular number to the left, if any
//            if let rnInC_L = c.lastIndex(where: { (e) -> Bool in e is Int }) {
//                ((n[ai] as! [[Any]])[bi] as [Any])[rnInC_L] = ((n[ai] as! [[Any]])[bi] as [Any])[rnInC_L] + left
//            }
//
//            // and the pair's right value is added to the first regular number to the right of the exploding pair (if any).
//            let right = d.last!
//
//
//            // search for a regular number to the right, if any
//
//
//            // Then, the entire exploding pair is replaced with the regular number 0
//
//
//            return true
//        }
//
//        return false
//    }
//    func reduce(n: [Any]) -> [Any] {
//        var reducing = true
//        var newNumber = n
//        while (reducing) {
//            if explode(n: &newNumber) { continue }
//            else if let ten = newNumber.firstIndex(where: { (element) -> Bool in
//                if let int = element as? Int, int >= 10 {
//                    return true
//                }
//                return false
//            }), let tenValue = newNumber[ten] as? Int {
//                // split: replace it with a pair; the left element of the pair should be the regular number divided by two and rounded down, while the right element of the pair should be the regular number divided by two and rounded up
//                newNumber[ten] = [Int(floor(Double(tenValue) / 2.0)), Int(ceil(Double(tenValue) / 2.0))]
//            } else {
//                reducing = false
//            }
//        }
//        return newNumber
//    }
//    func magnitude(n: [Any]) -> Int {
//        if let a = n.first as? [Any], let b = n.first as? [Any] {
//            return 3 * magnitude(n: a) + 2 * magnitude(n: b)
//        } else if let a = n.first as? Int, let b = n.first as? [Any] {
//            return 3 * a + 2 * magnitude(n: b)
//        } else if let a = n.first as? [Any], let b = n.first as? Int {
//            return 3 * magnitude(n: a) + 2 * b
//        } else if let a = n.first as? Int, let b = n.first as? Int {
//            return 3 * a + 2 * b
//        } else {
//            fatalError("unexpected combination in pair")
//        }
//    }
    var part1: Int {

        return -1
    }
}
