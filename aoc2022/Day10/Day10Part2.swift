//
//  Day10Part2.swift
//  aoc2022
//
//  Created by Andrew McKnight on Dec 4, 2022.
//

import Foundation

func printSpritePosition(register: Int) {
    var position = Array(repeating: ".", count: 40)
    if register > 0 {
        position[register - 1] = "#"
    }
    if register > 0 && register < 39 {
        position[register] = "#"
    }
    if register >= 0 && register < 38 {
        position[register + 1] = "#"
    }
    print("sprite position:\n\(position.joined(separator: " "   ))")
}

public extension Day10 {
    var part2: Int {
        var register = 1
        var screen = Array(repeating: Array(repeating: ".", count: 40), count: 6)
        var cycle = 1
        let factor = 40
        let instructions = rawValue.lines
        instructions.forEach { instructionValue in
            let instruction: Instruction
            if instructionValue == "noop" {
                instruction = .noop
            } else {
                let value = Int(instructionValue.components(separatedBy: " ").last!)!
                instruction = .addx(value)
            }

//            printSpritePosition()

            for _ in 0 ..< instruction.cycles {

                let spritePositions = (register - 1 ... register + 1)
//                print("instruction: \(instructionValue); cycle: \(cycle); register: \(register); spritePositions: \(spritePositions)")

                let cyclemod = cycle % factor
                if spritePositions.contains((cycle / factor) + cyclemod == 0 ? 0 : cyclemod - 1) {
                    let xmod = cycle % factor
                    let x = xmod == 0 ? 0 : xmod - 1
                    let y = cycle / factor
//                    print("x: \(x); y: \(y)")
                    screen[y][x] = "#"
//                    print("")
                }

                cycle += 1

//                screen.printGrid()
            }

            instruction.execute(register: &register)
        }
        screen.printGrid()
        return -1
    }
}
