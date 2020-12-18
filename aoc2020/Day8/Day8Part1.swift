//
//  Day8Part1.swift
//  aoc2020
//
//  Created by Andrew McKnight on Dec 18, 2020.
//

import aocHelpers
import Foundation

func findLoop(instructions: String) -> Int {
    let array = instructions.split(separator: "\n")
    print("array: \(array)")
    var acc = 0
    var ip = 0
    let regex = try! NSRegularExpression(pattern: #"([a-z]{3}) ([+\-]{1})(\d*)"#, options: [])
    var ipHistory = [Int]()
    while(ip < array.count && !ipHistory.contains(ip)) {
        let next = array[ip]
        ipHistory.append(ip)
        let range = NSRange(location: 0, length: next.count)
        let match = regex.firstMatch(in: String(next), options: [], range: range)
        let instruction = String(next[Range(match!.range(at: 1), in: next)!])
        let sign = String(next[Range(match!.range(at: 2), in: next)!])
        let offset = Int(next[Range(match!.range(at: 3), in: next)!])! * (sign == "-" ? -1 : 1)
        print("instruction: \(instruction); sign: \(sign); offset: \(offset)")
        if instruction == "nop" {
            ip += 1
        } else if instruction == "acc" {
            acc += offset
            ip += 1
        } else if instruction == "jmp" {
            ip += offset
        }
        print("acc: \(acc); ip: \(ip)")
    }
    return acc
}

public func day8Part1(_ input: String) -> Int {
    return findLoop(instructions: input)
}
