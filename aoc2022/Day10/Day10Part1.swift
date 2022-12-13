//
//  Day10Part1.swift
//  aoc2022
//
//  Created by Andrew McKnight on Dec 4, 2022.
//

import aocHelpers
import Foundation
import SwiftArmcknight


enum Instruction {
    case addx(Int)
    case noop

    var cycles: Int {
        switch self {
        case .addx(_): return 2
        case .noop: return 1
        }
    }

    func execute(register: inout Int) {
        switch self {
        case .addx(let v): register += v
        case .noop: break
        }
    }
}

public extension Day10 {
    var part1: Int {
        var cycle = 1
        var register = 1
        var targetCycles = [20, 60, 100, 140, 180, 220]
        var signal = 0
        let instructions = rawValue.lines
        instructions.forEach { instructionValue in
            let instruction: Instruction
            if instructionValue == "noop" {
                instruction = .noop
            } else {
                let value = Int(instructionValue.components(separatedBy: " ").last!)!
                instruction = .addx(value)
            }

            for _ in 0 ..< instruction.cycles {
                if targetCycles.contains(cycle) {
                    signal += cycle * register
//                    print("signal: \(signal)")
                }
                cycle += 1
            }

            instruction.execute(register: &register)

//            print("cycle: \(cycle); register: \(register)")
        }
        return signal
    }
}
