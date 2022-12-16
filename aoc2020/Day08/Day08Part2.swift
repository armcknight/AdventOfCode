//
//  Day08Part2.swift
//  aoc2020
//
//  Created by Andrew McKnight on Dec 18, 2020.
//

import aocHelpers
import Foundation

func hasLoop(instructions: [String]) -> (Bool, Int) {
    var acc = 0
    var ip = 0
    let regex = try! NSRegularExpression(pattern: #"([a-z]{3}) ([+\-]{1})(\d*)"#, options: [])
    var ipHistory = [Int]()
    while(ip < instructions.count) {
        if ipHistory.contains(ip) {
            return (true, acc)
        }
        let next = instructions[ip]
        ipHistory.append(ip)
        let range = NSRange(location: 0, length: next.count)
        let match = regex.firstMatch(in: String(next), options: [], range: range)
        let instruction = String(next[Range(match!.range(at: 1), in: next)!])
        let sign = String(next[Range(match!.range(at: 2), in: next)!])
        let offset = Int(next[Range(match!.range(at: 3), in: next)!])! * (sign == "-" ? -1 : 1)
//          print("instruction: \(instruction); sign: \(sign); offset: \(offset)")
        if instruction == "nop" {
            ip += 1
        } else if instruction == "acc" {
            acc += offset
            ip += 1
        } else if instruction == "jmp" {
            ip += offset
        }
//          print("acc: \(acc); ip: \(ip)")
    }
    return (false, acc)
}


public extension Day08 {
    var part2: Int {
        let array = rawValue.split(separator:  "\n").map({String($0)})
        var i = 0
        for instruction in array {
            let isJmp = instruction.contains("jmp")
            let isNop = instruction.contains("nop")
            if isJmp || isNop {
                let result = hasLoop(instructions: array)
                if result.0 {
                    var copy = array
                    if isJmp {
                        copy[i] = array[i].replacingOccurrences(of: "jmp", with: "nop")
                    } else {
                        copy[i] = array[i].replacingOccurrences(of: "nop", with: "jmp")
                    }
                    let swapResult = hasLoop(instructions: copy)
                    if !swapResult.0 {
                        return swapResult.1
                    }
                }
            }
            i += 1
        }
        return 0
    }
}
