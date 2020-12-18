//
//  Day4Part2.swift
//  aoc2020
//
//  Created by Andrew McKnight on Dec 18, 2020.
//

import aocHelpers
import Foundation

enum Field {
    /// - param string: a string of format "<key>:<value>", e.g. "byr:2000"
    init?(string: String) {
        let components = string.split(separator: ":")
        let key = components.first
        let value = String(components.last!)
        if key == "byr" {
            self = .byr(value)
        } else if key == "iyr" {
            self = .iyr(value)
        } else if key == "eyr" {
            self = .eyr(value)
        } else if key == "hgt" {
            self = .hgt(value)
        } else if key == "hcl" {
            self = .hcl(value)
        } else if key == "ecl" {
            self = .ecl(value)
        } else if key == "pid" {
            self = .pid(value)
        } else if key == "cid" {
            self = .cid(value)
        } else {
            return nil
        }
    }
    case byr(String)
    case iyr(String)
    case eyr(String)
    case hgt(String)
    case hcl(String)
    case ecl(String)
    case pid(String)
    case cid(String)

    var isValid: Bool {
        switch self {
        case .byr(let value): // (Birth Year) - four digits; at least 1920 and at most 2002.
            guard value.count == 4 else { return false }
            let number = value.integerValue
            return number >= 1920 && number <= 2002
        case .cid(let value): // (Country ID) - ignored, missing or not.
            return true
        case .ecl(let value): // (Eye Color) - exactly one of: amb blu brn gry grn hzl oth.
            return ["amb", "blu", "brn", "gry", "grn", "hzl", "oth"].contains(value)
        case .eyr(let value): // (Expiration Year) - four digits; at least 2020 and at most 2030.
            guard value.count == 4 else { return false }
            let number = value.integerValue
            return number >= 2020 && number <= 2030
        case .hcl(let value): // (Hair Color) - a # followed by exactly six characters 0-9 or a-f.
            return try! value.matches("^#[a-f0-9]{6}$")
        case .hgt(let value): // (Height) - a number followed by either cm or in:
        //If cm, the number must be at least 150 and at most 193.
        //If in, the number must be at least 59 and at most 76.
            print("hgt: \(value)")
            if value.contains("cm") {
                let cleaned = value.replacingOccurrences(of: "cm", with: "")
                guard cleaned.count == 3 else { return false }
                let number = cleaned.integerValue
                return number >= 150 && number <= 193
            } else if value.contains("in") {
                let cleaned = value.replacingOccurrences(of: "in", with: "")
                guard cleaned.count == 2 else { return false }
                let number = cleaned.integerValue
                return number >= 59 && number <= 76
            } else {
                return false
            }
        case .iyr(let value): // (Issue Year) - four digits; at least 2010 and at most 2020.
            guard value.count == 4 else { return false }
            let number = value.integerValue
            return number >= 2010 && number <= 2020
        case .pid(let value): // (Passport ID) - a nine-digit number, including leading zeroes.
            return try! value.matches(#"^\d{9}$"#)
        }
    }
}

public func day4Part2(_ input: String) -> Int {
    return input.replacingOccurrences(of: "\n\n", with: ";")
        .split(separator: ";")
        .filter({$0.count > 0})
        .map({String($0)})
        .reduce(0, { (partial, next) -> Int in
            let fields = next.replacingOccurrences(of: "\n", with: " ").split(separator: " ")
            let hasCID = fields.contains { (string) -> Bool in
                string.contains("cid")
            }
            if !((hasCID && fields.count == 8) || (!hasCID && fields.count == 7)) {
                return partial
            }
            for field in fields {
                if !Field(string: String(field))!.isValid {
//                      print("invalid: \(fields) on field: \(field)")
                    return partial
                }
            }
//              print("valid: \(fields)")
            return partial + 1
        })

}
